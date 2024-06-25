import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static final routes = GoRouter(initialLocation: RoutesName.homeScreen, routes: [
    GoRoute(
        path: RoutesName.homeScreen,
        name: RoutesName.homeScreen,
        builder: (contex, state) => const MyHomeScreen())
  ]);

}
