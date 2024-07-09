import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/logic/models/building_model.dart';
import 'package:construction_mate/presentation/screens/bills/bills_screen.dart';
import 'package:construction_mate/presentation/screens/bottom_bar.dart';
import 'package:construction_mate/presentation/screens/parties/parties_screen.dart';
import 'package:construction_mate/presentation/screens/project/building_details_screen.dart';
import 'package:construction_mate/presentation/screens/project/details_screen.dart';
import 'package:construction_mate/presentation/screens/project/project_screen.dart';
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
      builder: (contex, state) => const MyProjectDetailsScreen(),
    ),
    GoRoute(
      path: RoutesName.buildingDetailsScreen,
      name: RoutesName.buildingDetailsScreen,
      builder: (context, state) {
        final buildingModel = state.extra as BuildingModel;
        return MyBuildingDetailsScreen(buildingModel: buildingModel);
      },
    ),
  ]);
}
