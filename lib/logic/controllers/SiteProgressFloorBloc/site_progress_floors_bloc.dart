import 'package:bloc/bloc.dart';
import 'package:construction_mate/data/repository/site_progress_repository.dart';
import 'package:construction_mate/logic/models/floor_site_model.dart';
import 'package:meta/meta.dart';

part 'site_progress_floors_event.dart';
part 'site_progress_floors_state.dart';

class SiteProgressFloorsBloc
    extends Bloc<SiteProgressFloorsEvent, SiteProgressFloorsState> {
  final SiteProgressRepository siteProgressRepository;
  SiteProgressFloorsBloc({required this.siteProgressRepository})
      : super(SiteProgressFloorsInitial()) {
    on<LoadFloorsSite>((event, emit) async {
      try {
        print("---------------- inin -------------------");
        emit(SiteProgressFloorsInitial());
        List<FloorSiteModel> listOfFloorsSite =
            await siteProgressRepository.getFloorsOfSite(
                projectId: event.projectId, buildingId: event.buildingId);

        print(
            "----- in siteprgredssflorrbloc ${listOfFloorsSite.first.workStatus?[0].agencyName}");
        emit(SiteProgressFloorsSuccess(listOfFloorsSite: listOfFloorsSite));
      } catch (e) {
        emit(SiteProgressFloorsFailure());
      }
    });
  }
}
