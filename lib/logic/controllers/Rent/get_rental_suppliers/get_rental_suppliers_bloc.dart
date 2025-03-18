import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/repository/agency_repository.dart';
import 'package:construction_mate/data/usecases/rental_usecase.dart';
import 'package:construction_mate/logic/models/agency_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'get_rental_suppliers_event.dart';
part 'get_rental_suppliers_state.dart';
part 'get_rental_suppliers_bloc.freezed.dart';

@singleton
class GetRentalSuppliersBloc
    extends Bloc<GetRentalSuppliersEvent, GetRentalSuppliersState> {
  GetRentalSuppliersBloc(this._agencyRepository)
      : super(GetRentalSuppliersState.initial()) {
    on<GetRentalSuppliersEvent>((event, emit) async {
      await event.map(initialize: (_Initialize value) {
        emit(GetRentalSuppliersState.initial());
      }, onRentalPartyChanged: (value) {
        emit(state.copyWith(selectedRentalAgency: value.rentalParty));
      }, fetchRentalSuppliers: (_FetchRentalSuppliers value) async {
        emit(state.copyWith(state: RequestState.loading));

        final res = await _agencyRepository.getTotalAgencies(
            partyType: PartyType.EquipmentSupplier);

        res.fold((l) {
          emit(state.copyWith(state: RequestState.error, message: l.message));
        }, (r) {
          final agencies = [
            AgencyModel(name: "--Select Agencies--", sId: '0'),
            ...r // Add fetched agencies after
          ];
          emit(state.copyWith(
              state: RequestState.loaded, listOfRentalAgencies: agencies));
        });
      });
    });
  }

  final AgencyRepository _agencyRepository;
}
