import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/data/datasource/building_data_source.dart';
import 'package:construction_mate/data/datasource/site_progress_data_source.dart';
import 'package:construction_mate/data/datasource/transaction_data_source.dart';
import 'package:construction_mate/data/repository/building_repository.dart';
import 'package:construction_mate/data/repository/site_progress_repository.dart';
import 'package:construction_mate/data/repository/transaction_repository.dart';
import 'package:construction_mate/logic/controllers/BuildingAddBloc/buildings_bloc.dart';
import 'package:construction_mate/logic/controllers/PaymentTotalProjectWiseBloc/payment_total_project_bloc.dart';
import 'package:construction_mate/logic/controllers/SelectFloorsBloc/select_floors_bloc.dart';
import 'package:construction_mate/logic/controllers/SiteProgressAgencyUpdate/site_progress_agency_update_bloc.dart';
import 'package:construction_mate/logic/controllers/TransactionByAgency/transaction_by_agency_bloc.dart';
import 'package:construction_mate/logic/controllers/TransactionIndividualAgency/transactions_individual_agency_bloc.dart';
import 'package:construction_mate/logic/controllers/FloorNameAndFeet/floor_name_and_feet_bloc.dart';
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
import 'package:construction_mate/presentation/screens/project/inidividual_transaction_screen.dart';
import 'package:construction_mate/presentation/screens/project/project_screen.dart';
import 'package:construction_mate/presentation/screens/project/select_floors_screen.dart';
import 'package:construction_mate/presentation/screens/project/working_agency_details_screen.dart';
import 'package:construction_mate/presentation/widgets/building_details_screen.dart/site_progress_details_widget.dart';
import 'package:construction_mate/presentation/widgets/details_screen_widgets/floors_and_foot_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        return BlocProvider(
          create: (context) => PaymentTotalProjectBloc(
              transactionRepository: TransactionRepositoryImpl(
                  transactionDataSource: TransactionDataSourceImpl())),
          child: MyProjectDetailsScreen(
            projectModel: project,
          ),
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

        return BlocProvider(
          create: (context) => SiteProgressAgencyUpdateBloc(
              siteProgressRepository: SiteProgressRepositoryImpl(
                  siteProgressDataSource: SiteProgressDataSourceImpl())),
          child: MySiteProgressDetailsWidget(
            floorSiteModel: floorSiteModel,
          ),
        );
      },
    ),
    GoRoute(
      path: RoutesName.transactionOfAgencyPartiesScreen,
      name: RoutesName.transactionOfAgencyPartiesScreen,
      builder: (context, state) {
        final TotalAgencyModel totalAgencyModel =
            state.extra as TotalAgencyModel;
        return BlocProvider(
          create: (context) => TransactionByAgencyBloc(
              transactionRepository: TransactionRepositoryImpl(
                  transactionDataSource: TransactionDataSourceImpl())),
          child: MyTransactionPartiesScreen(agency: totalAgencyModel),
        );
      },
    ),
    GoRoute(
      path: RoutesName.transactionIndividualScreen,
      name: RoutesName.transactionIndividualScreen,
      builder: (context, state) {
        final args = state.extra as Map<String, dynamic>;
        final agencyId = args['agencyId'] as String;
        final projectId = args['projectId'] as String;
        final agencyName = args['agencyName'] as String;
        return BlocProvider(
          create: (context) => TransactionsIndividualAgencyBloc(
              transactionRepository: TransactionRepositoryImpl(
                  transactionDataSource: TransactionDataSourceImpl())),
          child: MyTransactionIndividualScreen(
              agencyId: agencyId, projectId: projectId, agencyName: agencyName),
        );
      },
    ),
    GoRoute(
      path: RoutesName.footAndFloorScreen,
      name: RoutesName.footAndFloorScreen,
      builder: (context, state) {
        final FloorNameAndFeetBloc bloc = state.extra as FloorNameAndFeetBloc;
        return MyFootAndFloorScreen(
          floorNameAndFeetBloc: bloc,
        );
      },
    ),
  ]);
}
