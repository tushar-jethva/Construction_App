import 'package:bloc/bloc.dart';
import 'package:construction_mate/data/repository/site_progress_repository.dart';
import 'package:construction_mate/logic/models/floor_site_model.dart';
import 'package:construction_mate/logic/models/site_progress_agency_update_model.dart';
import 'package:meta/meta.dart';

part 'site_progress_agency_update_event.dart';
part 'site_progress_agency_update_state.dart';

class SiteProgressAgencyUpdateBloc
    extends Bloc<SiteProgressAgencyUpdateEvent, SiteProgressAgencyUpdateState> {
  final SiteProgressRepository siteProgressRepository;
  SiteProgressAgencyUpdateBloc({required this.siteProgressRepository})
      : super(const SiteProgressAgencyUpdateState(isLoading: true)) {
    on<FetchAlreadySelectedAgencies>((event, emit) async {
      try {
        emit(state.copyWith(isLoading: true, selectAll: false));

        FloorSiteModel floorSiteModel =
            await siteProgressRepository.getFloorOfSiteByFloorIndex(
          projectId: event.projectId,
          buildingId: event.buildingId,
          floorIndex: event.floorIndex,
        );
        print(floorSiteModel);
        List<SiteProgressAgencyUpdateModel> selectedAgencies =
            floorSiteModel.workStatus!.map((agency) {
          return SiteProgressAgencyUpdateModel(
              agencyId: agency.agencyId!,
              workTypeId: agency.workTypeId!,
              isSelected: agency.isCompleted,
              agencyName: agency.agencyName,
              workTypeName: agency.workTypeName);
        }).toList();

        List<SiteProgressAgencyUpdateModel> currentSelectedAgencies =
            floorSiteModel.workStatus!.map((agency) {
          return SiteProgressAgencyUpdateModel(
              agencyId: agency.agencyId!,
              workTypeId: agency.workTypeId!,
              isSelected: false,
              agencyName: agency.agencyName,
              workTypeName: agency.workTypeName);
        }).toList();
        emit(state.copyWith(
            selectedAgencies: selectedAgencies,
            isLoading: false,
            currentSelectedAgencies: currentSelectedAgencies));
      } catch (e) {
        print(e.toString());
      }
    });

    on<ToggleAgencySelection>((event, emit) {
      final currentSelectedAgencies = List<SiteProgressAgencyUpdateModel>.from(
          state.currentSelectedAgencies);
      currentSelectedAgencies[event.index].isSelected =
          !currentSelectedAgencies[event.index].isSelected!;
      final selectAll =
          currentSelectedAgencies.every((selected) => selected.isSelected!);
      emit(state.copyWith(
        currentSelectedAgencies: currentSelectedAgencies,
        selectAll: selectAll,
      ));
    });

    on<ToggleSelectAll>((event, emit) {
      final selectAll = !state.selectAll;
      List<SiteProgressAgencyUpdateModel> currentSelectedAgencies =
          state.currentSelectedAgencies.map((agency) {
        return SiteProgressAgencyUpdateModel(
            agencyId: agency.agencyId!,
            workTypeId: agency.workTypeId!,
            isSelected: selectAll);
      }).toList();
      emit(state.copyWith(
          selectAll: selectAll,
          currentSelectedAgencies: currentSelectedAgencies));
    });

    on<OnUpdateButtonPressed>((event, emit) {
      try {} catch (e) {
        print(e.toString());
      }
    });
  }
}
