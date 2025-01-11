import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/data/datasource/site_progress_data_source.dart';
import 'package:construction_mate/data/datasource/transaction_data_source.dart';
import 'package:construction_mate/data/repository/bills_repository.dart';
import 'package:construction_mate/data/repository/site_progress_repository.dart';
import 'package:construction_mate/data/repository/transaction_repository.dart';
import 'package:construction_mate/logic/controllers/BillingPartyParticularBloc/billing_party_particular_bloc.dart';
import 'package:construction_mate/logic/controllers/Building-by-id/building_by_id_bloc.dart';
import 'package:construction_mate/logic/controllers/FinancialByParty/financialy_by_party_bloc.dart';
import 'package:construction_mate/logic/controllers/PaymentTotalProjectWiseBloc/payment_total_project_bloc.dart';
import 'package:construction_mate/logic/controllers/SelectFloorsBloc/select_floors_bloc.dart';
import 'package:construction_mate/logic/controllers/SiteProgressAgencyUpdate/site_progress_agency_update_bloc.dart';
import 'package:construction_mate/logic/controllers/StartAndEndDateBloc/start_and_end_date_bloc.dart';
import 'package:construction_mate/logic/controllers/TransactionByAgency/transaction_by_agency_bloc.dart';
import 'package:construction_mate/logic/controllers/TransactionIndividualAgency/transactions_individual_agency_bloc.dart';
import 'package:construction_mate/logic/controllers/FloorNameAndFeet/floor_name_and_feet_bloc.dart';
import 'package:construction_mate/logic/models/bill_model.dart';
import 'package:construction_mate/logic/models/billing_party_model.dart';
import 'package:construction_mate/logic/models/building_model.dart';
import 'package:construction_mate/logic/models/floor_site_model.dart';
import 'package:construction_mate/logic/models/per_building_agency_model.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:construction_mate/logic/models/total_agency_model.dart';
import 'package:construction_mate/presentation/screens/authentication/signin/sign_in_screen.dart';
import 'package:construction_mate/presentation/screens/authentication/signup/sign_up_screen.dart';
import 'package:construction_mate/presentation/screens/authentication/signup/widgets/sign_up_step_2.dart';
import 'package:construction_mate/presentation/screens/bills/bills_particular_screen.dart';
import 'package:construction_mate/presentation/screens/bills/bills_screen.dart';
import 'package:construction_mate/presentation/screens/bills/pdf_preview.dart';
import 'package:construction_mate/presentation/screens/bills/sheet_view_screen.dart';
import 'package:construction_mate/presentation/screens/bottom_bar.dart';
import 'package:construction_mate/presentation/screens/parties/parties_screen.dart';
import 'package:construction_mate/presentation/screens/parties/parties_transaction_screen.dart';
import 'package:construction_mate/presentation/screens/profile/edit_profile/edit_profile_screen.dart';
import 'package:construction_mate/presentation/screens/profile/gst/gst_screen.dart';
import 'package:construction_mate/presentation/screens/profile/other_expense.dart/other_expense_screen.dart';
import 'package:construction_mate/presentation/screens/profile/tds/tds_screen.dart';
import 'package:construction_mate/presentation/screens/project/building_details_screen.dart';
import 'package:construction_mate/presentation/screens/project/details_screen.dart';
import 'package:construction_mate/presentation/screens/project/inidividual_transaction_screen.dart';
import 'package:construction_mate/presentation/screens/project/project_details_n_screen.dart';
import 'package:construction_mate/presentation/screens/project/project_screen.dart';
import 'package:construction_mate/presentation/screens/project/select_floors_screen.dart';
import 'package:construction_mate/presentation/screens/project/working_agency_details_screen.dart';
import 'package:construction_mate/presentation/screens/splash_screen/splash_screen.dart';
import 'package:construction_mate/presentation/screens/subscription/subscription_screen.dart';
import 'package:construction_mate/presentation/widgets/building_details_screen.dart/site_progress_details_widget.dart';
import 'package:construction_mate/presentation/widgets/details_screen_widgets/floors_and_foot_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Routes {
  static final GoRouter routes = GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: RoutesName.initialLocation,
      routes: [
        GoRoute(
          path: RoutesName.initialLocation,
          name: RoutesName.initialLocation,
          builder: (contex, state) => const SplashScreen(),
        ),
        GoRoute(
          path: RoutesName.signUpScreen,
          name: RoutesName.signUpScreen,
          builder: (contex, state) => SignUpScreen(),
        ),
        GoRoute(
          path: RoutesName.signUpScreen2,
          name: RoutesName.signUpScreen2,
          builder: (contex, state) => const SignUpStep2(),
        ),
        GoRoute(
          path: RoutesName.signInScreen,
          name: RoutesName.signInScreen,
          builder: (contex, state) => SignInScreen(),
        ),
        GoRoute(
          path: RoutesName.bottomBar,
          name: RoutesName.bottomBar,
          builder: (contex, state) => const MyBottomBar(),
        ),
        GoRoute(
          path: RoutesName.partiesScreen,
          name: RoutesName.partiesScreen,
          builder: (contex, state) => const MyPartiesScreen(),
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

            context
                .read<StartAndEndDateBloc>()
                .add(const StartAndEndDateEvent.initalize());
            return BlocProvider(
              create: (context) => TransactionsIndividualAgencyBloc(
                  transactionRepository: TransactionRepositoryImpl(
                      transactionDataSource: TransactionDataSourceImpl())),
              child: MyTransactionIndividualScreen(
                  agencyId: agencyId,
                  projectId: projectId,
                  agencyName: agencyName),
            );
          },
        ),
        GoRoute(
          path: RoutesName.footAndFloorScreen,
          name: RoutesName.footAndFloorScreen,
          builder: (context, state) {
            final FloorNameAndFeetBloc bloc =
                state.extra as FloorNameAndFeetBloc;
            return MyFootAndFloorScreen(
              floorNameAndFeetBloc: bloc,
            );
          },
        ),
        GoRoute(
          path: RoutesName.billingPartyPaticularScreen,
          name: RoutesName.billingPartyPaticularScreen,
          builder: (context, state) {
            final BillingPartyModel party = state.extra as BillingPartyModel;
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: (context) => FinancialyByPartyBloc(
                        billsRepository: BillsRepositoryImpl())),
                BlocProvider(
                    create: (context) => BillingPartyParticularBloc(
                        billsRepository: BillsRepositoryImpl()))
              ],
              child: MyBillsParticularPartyScreen(
                party: party,
              ),
            );
          },
        ),
        GoRoute(
          path: RoutesName.sheetViewScreen,
          name: RoutesName.sheetViewScreen,
          builder: (context, state) {
            final args = state.extra as Map<String, dynamic>;
            final String partyId = args['partyId'] as String;
            final String partyName = args['partyName'] as String;
            return BlocProvider(
              create: (context) => BillingPartyParticularBloc(
                  billsRepository: BillsRepositoryImpl()),
              child: MySheetViewScreen(
                partyId: partyId,
                partyName: partyName,
              ),
            );
          },
        ),
        GoRoute(
          path: RoutesName.pdfPreviewScreen,
          name: RoutesName.pdfPreviewScreen,
          builder: (context, state) {
            final BillModel bill = state.extra as BillModel;
            return MyPdfPreview(
              bill: bill,
            );
          },
        ),
        GoRoute(
          path: RoutesName.subscriptionScreen,
          name: RoutesName.subscriptionScreen,
          builder: (context, state) {
            final bool isExpired = state.extra as bool;
            return SubscriptionScreen(
              isExpired: isExpired,
            );
          },
        ),
        GoRoute(
          path: RoutesName.tdsScreen,
          name: RoutesName.tdsScreen,
          builder: (context, state) {
            return TdsScreen();
          },
        ),
        GoRoute(
          path: RoutesName.gstScreen,
          name: RoutesName.gstScreen,
          builder: (context, state) {
            return const GstScreen();
          },
        ),
        GoRoute(
          path: RoutesName.otherExpensesScreen,
          name: RoutesName.otherExpensesScreen,
          builder: (context, state) {
            return const OtherExpenseScreen();
          },
        ),
        GoRoute(
          path: RoutesName.editProfileScreen,
          name: RoutesName.editProfileScreen,
          builder: (context, state) {
            return const EditProfileScreen();
          },
        ),
        GoRoute(
          path: RoutesName.NEW_DETAIL_SCREEN_PATH,
          name: RoutesName.NEW_DETAIL_SCREEN_NAME,
          builder: (context, state) {
            final ProjectModel project = state.extra as ProjectModel;
            context
                .read<BuildingByIdBloc>()
                .add(BuildingByIdEvent.getProject(project: project));
            context
                .read<StartAndEndDateBloc>()
                .add(const StartAndEndDateEvent.initalize());
            return ProjectDetailsNScreen(
              projectModel: project,
            );
          },
        ),
      ]);
}
