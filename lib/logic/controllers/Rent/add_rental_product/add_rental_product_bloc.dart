import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/usecases/rental_usecase.dart';
import 'package:construction_mate/logic/controllers/Material/material_agencies/material_agencies_bloc.dart';
import 'package:construction_mate/logic/controllers/Rent/get_rental_suppliers/get_rental_suppliers_bloc.dart';
import 'package:construction_mate/logic/models/add_rental_model.dart';
import 'package:construction_mate/logic/models/get_rental_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'add_rental_product_event.dart';
part 'add_rental_product_state.dart';
part 'add_rental_product_bloc.freezed.dart';

@singleton
class AddRentalProductBloc
    extends Bloc<AddRentalProductEvent, AddRentalProductState> {
  AddRentalProductBloc(this.rentalUsecase, this.getRentalSuppliersBloc)
      : super(AddRentalProductState.initial()) {
    on<AddRentalProductEvent>((event, emit) async {
      await event.map(initialize: (_Initialize value) {
        emit(AddRentalProductState.initial());
      }, onUnitChanged: (_OnUnitChanged value) {
        emit(state.copyWith(unit: value.unit, state: RequestState.empty));
      }, onDateChanged: (_onDateChanged value) {
        emit(state.copyWith(date: value.date, state: RequestState.empty));
      }, onRentalPartyIdChanged: (value) {
        emit(state.copyWith(
            state: RequestState.empty, rentalPartyId: value.rentalPartyId));
      }, fetchAllRental: (value) async {
        emit(state.copyWith(state: RequestState.loading));

        final res = await rentalUsecase.getRentals(projectId: value.projectId);

        res.fold((l) {
          emit(state.copyWith(state: RequestState.error, message: l.message));
        }, (r) {
          emit(state.copyWith(state: RequestState.loaded, rentalList: r));
        });
      }, onAddRental: (_OnAddRental value) async {
        emit(state.copyWith(state: RequestState.loading));

        AddRentalModel model = AddRentalModel(
          name: value.materialName,
          quantity: value.quantity,
          unit: state.unit,
          description: value.description,
          date: state.date,
          projectId: value.projectId,
          partieId: getRentalSuppliersBloc.state.selectedRentalAgency,
          priceperunit: value.pricePerUnit,
          id: value.rentalPartyId,
        );
        final res = value.isUpdate == false
            ? await rentalUsecase.addRental(rentalModel: model)
            : await rentalUsecase.updateRental(rentalModel: model);

        res.fold((l) {
          emit(state.copyWith(state: RequestState.error, message: l.message));
        }, (r) {
          emit(state.copyWith(state: RequestState.loaded, message: r));
        });
      });
    });
  }

  final RentalUsecase rentalUsecase;
  final GetRentalSuppliersBloc getRentalSuppliersBloc;
}
