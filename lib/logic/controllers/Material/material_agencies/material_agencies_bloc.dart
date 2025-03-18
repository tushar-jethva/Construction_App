import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/repository/agency_repository.dart';
import 'package:construction_mate/logic/models/agency_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'material_agencies_event.dart';
part 'material_agencies_state.dart';
part 'material_agencies_bloc.freezed.dart';

@singleton
class MaterialAgenciesBloc
    extends Bloc<MaterialAgenciesEvent, MaterialAgenciesState> {
  MaterialAgenciesBloc(this._agencyRepository)
      : super(MaterialAgenciesState.initial()) {
    on<MaterialAgenciesEvent>((event, emit) async {
      await event.map(initialize: (_Initialize value) {
        emit(MaterialAgenciesState.initial());
      }, onChangeMaterialAgency: (value) {
        emit(state.copyWith(selectedMaterialAgency: value.materialAgency));
      }, fetchMaterialAgencies: (_FetchMaterialAgencies value) async {
        emit(state.copyWith(state: RequestState.loading));
        final res = await _agencyRepository.getTotalAgencies(
            partyType: PartyType.Material);

        res.fold((l) {
          emit(state.copyWith(state: RequestState.error, message: l.message));
        }, (r) {
          final agencies = [
            AgencyModel(name: "--Select Agencies--", sId: '0'),
            ...r // Add fetched agencies after
          ];

          emit(state.copyWith(
            state: RequestState.loaded,
            listOfMaterialAgencies: agencies,
          ));
        });
      });
    });
  }

  final AgencyRepository _agencyRepository;
}
