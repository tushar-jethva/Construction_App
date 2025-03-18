import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/repository/agency_repository.dart';
import 'package:construction_mate/logic/models/agency_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'material_supplier_event.dart';
part 'material_supplier_state.dart';
part 'material_supplier_bloc.freezed.dart';

@singleton
class MaterialSupplierBloc
    extends Bloc<MaterialSupplierEvent, MaterialSupplierState> {
  MaterialSupplierBloc(this.agencyRepository)
      : super(MaterialSupplierState.initial()) {
    on<MaterialSupplierEvent>((event, emit) async {
      await event.map(
        started: (_Started value) {
          emit(MaterialSupplierState.initial());
        },
        partyNameChanged: (_PartyNameChanged value) {
          emit(state.copyWith(
              state: RequestState.empty, partyName: value.partyName));
        },
        gstNoChanged: (_GstNoChanged value) {
          emit(state.copyWith(state: RequestState.empty, gstNo: value.gstNo));
        },
        emailChanged: (_EmailChanged value) {
          emit(state.copyWith(state: RequestState.empty, email: value.email));
        },
        contactNoChanged: (_ContactNoChanged value) {
          emit(state.copyWith(
              state: RequestState.empty, contactNo: value.contactNo));
        },
        addressChanged: (_AddressChanged value) {
          emit(state.copyWith(
              state: RequestState.empty, address: value.address));
        },
        addMaterialSupplier: (_AddMaterialSupplier value) async {
          emit(state.copyWith(state: RequestState.loading));
          final AgencyModel agencyModel = AgencyModel(
            name: state.partyName,
            gSTNumber: state.gstNo,
            email: state.email,
            contactNumber: state.contactNo,
            shippingAddress: state.address,
            agencyType: 'Material supplier',
          );
          final res =
              await agencyRepository.addAgency(agencyModel: agencyModel);

          res.fold((l) {
            emit(state.copyWith(state: RequestState.error, message: l.message));
          }, (r) {
            emit(state.copyWith(
              state: RequestState.loaded,
            ));
          });
        },
      );
    });
  }

  final AgencyRepository agencyRepository;
}
