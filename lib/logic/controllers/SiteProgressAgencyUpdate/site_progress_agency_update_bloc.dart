import 'package:bloc/bloc.dart';
import 'package:construction_mate/logic/models/floor_site_model.dart';
import 'package:construction_mate/logic/models/site_progress_agency_update_model.dart';
import 'package:meta/meta.dart';

part 'site_progress_agency_update_event.dart';
part 'site_progress_agency_update_state.dart';

class SiteProgressAgencyUpdateBloc
    extends Bloc<SiteProgressAgencyUpdateEvent, SiteProgressAgencyUpdateState> {
  SiteProgressAgencyUpdateBloc()
      : super(const SiteProgressAgencyUpdateState(isLoading: true)) {
    on<FetchAlreadySelectedAgencies>((event, emit) {
      try {
        emit(state.copyWith(isLoading: true, selectAll: false));

        List<SiteProgressAgencyUpdateModel> selectedAgencies =
            event.floorSiteModel.workStatus!.map((agency) {
          return SiteProgressAgencyUpdateModel(
              agencyId: agency.agencyId!,
              workTypeId: agency.workTypeId!,
              isSelected: agency.isCompleted);
        }).toList();
        emit(state.copyWith(
            selectedAgencies: selectedAgencies, isLoading: false));
      } catch (e) {
        print(e.toString());
      }
    });

    on<ToggleAgencySelection>((event, emit) {
      final selectedAgencies =
          List<SiteProgressAgencyUpdateModel>.from(state.selectedAgencies);
      selectedAgencies[event.index].isSelected =
          !selectedAgencies[event.index].isSelected!;
      final selectAll =
          selectedAgencies.every((selected) => selected.isSelected!);
      emit(state.copyWith(
        selectedAgencies: selectedAgencies,
        selectAll: selectAll,
      ));
    });

    on<ToggleSelectAll>((event, emit) {
      final selectAll = !state.selectAll;
      List<SiteProgressAgencyUpdateModel> selectedAgencies =
          state.selectedAgencies.map((agency) {
        return SiteProgressAgencyUpdateModel(
            agencyId: agency.agencyId!,
            workTypeId: agency.workTypeId!,
            isSelected: selectAll);
      }).toList();
      emit(state.copyWith(
          selectAll: selectAll, selectedAgencies: selectedAgencies));
    });

    on<OnUpdateButtonPressed>((event, emit){
      try{
          
      }
      catch(e){
        print(e.toString());
      }
    });

  }
}
