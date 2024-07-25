import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/logic/controllers/SelectFloorsBloc/select_floors_bloc.dart';
import 'package:construction_mate/logic/controllers/SiteProgressAgencyUpdate/site_progress_agency_update_bloc.dart';
import 'package:construction_mate/logic/models/building_model.dart';
import 'package:construction_mate/logic/models/floor_site_model.dart';
import 'package:construction_mate/logic/models/per_building_agency_model.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:construction_mate/logic/models/total_agency_model.dart';
import 'package:construction_mate/presentation/screens/bills/bills_screen.dart';
import 'package:construction_mate/presentation/screens/bottom_bar.dart';
import 'package:construction_mate/presentation/screens/parties/parties_screen.dart';
import 'package:construction_mate/presentation/screens/parties/parties_transaction_screen.dart';
import 'package:construction_mate/presentation/screens/project/building_details_screen.dart';
import 'package:construction_mate/presentation/screens/project/details_screen.dart';
import 'package:construction_mate/presentation/screens/project/project_screen.dart';
import 'package:construction_mate/presentation/screens/project/select_floors_screen.dart';
import 'package:construction_mate/presentation/screens/project/working_agency_details_screen.dart';
import 'package:construction_mate/presentation/widgets/building_details_screen.dart/site_progress_details_widget.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static final routes =
      GoRouter(initialLocation: RoutesName.initialLocation, routes: [
    GoRoute(
      path: RoutesName.initialLocation,
      name: RoutesName.initialLocation,
      builder: (contex, state) => const MyBottomBar(),
    ),
    GoRoute(
      path: RoutesName.partiesScreen,
      name: RoutesName.partiesScreen,
      builder: (contex, state) => const MyPartiesScreen(),
    ),
    GoRoute(
      path: RoutesName.projectScreen,
      name: RoutesName.projectScreen,
      builder: (contex, state) => const MyProjectScreen(),
    ),
    GoRoute(
      path: RoutesName.billsScreen,
      name: RoutesName.billsScreen,
      builder: (contex, state) => const MyBillScreen(),
    ),
    GoRoute(
      path: RoutesName.projectDetailsScreen,
      name: RoutesName.projectDetailsScreen,
      builder: (contex, state) {
        final ProjectModel project = state.extra as ProjectModel;
        return MyProjectDetailsScreen(
          projectModel: project,
        );
      },
    ),
    GoRoute(
      path: RoutesName.buildingDetailsScreen,
      name: RoutesName.buildingDetailsScreen,
      builder: (context, state) {
        final args = state.extra as Map<String, dynamic>;
        final buildingModel = args['buildingModel'] as BuildingModel;
        final projectModel = args["projectModel"] as ProjectModel;
        return MyBuildingDetailsScreen(
          buildingModel: buildingModel,
          projectModel: projectModel,
        );
      },
    ),
    GoRoute(
      path: RoutesName.selectFloorsScreen,
      name: RoutesName.selectFloorsScreen,
      builder: (context, state) {
        final args = state.extra as Map<String, dynamic>;
        final buildingModel = args['buildingModel'] as BuildingModel;
        final selectFloorsBloc = args['bloc'] as SelectFloorsBloc;
        final workTypeId = args['workTypeId'] as String;
        final projectModel = args['projectModel'] as ProjectModel;
        return MySelectFloorsScreen(
          buildingModel: buildingModel,
          selectFloorsBloc: selectFloorsBloc,
          projectModel: projectModel,
          workTypeId: workTypeId,
        );
      },
    ),
    GoRoute(
      path: RoutesName.workingAgencyDetailsScreen,
      name: RoutesName.workingAgencyDetailsScreen,
      builder: (context, state) {
        final PerBuildingAgencyModel perBuildingAgencyModel =
            state.extra as PerBuildingAgencyModel;
        return MyWorkingAgencyDetailsScreen(
          perBuildingAgency: perBuildingAgencyModel,
        );
      },
    ),
    GoRoute(
      path: RoutesName.siteProgressDeailsScreen,
      name: RoutesName.siteProgressDeailsScreen,
      builder: (context, state) {
        final args = state.extra as Map<String, dynamic>;
        final floorSiteModel = args['floorSiteModel'] as FloorSiteModel;
        final siteProgressAgencyUpdateBloc =
            args['bloc'] as SiteProgressAgencyUpdateBloc;
        return MySiteProgressDetailsWidget(
          floorSiteModel: floorSiteModel,
          siteProgressAgencyUpdateBloc: siteProgressAgencyUpdateBloc,
        );
      },
    ),
    GoRoute(
      path: RoutesName.transactionOfAgencyPartiesScreen,
      name: RoutesName.transactionOfAgencyPartiesScreen,
      builder: (context, state) {
        final TotalAgencyModel totalAgencyModel =
            state.extra as TotalAgencyModel;
        return MyTransactionPartiesScreen(
          agency: totalAgencyModel,
        );
      },
    )
  ]);
}
