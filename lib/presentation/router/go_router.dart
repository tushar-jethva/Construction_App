import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/data/datasource/site_progress_data_source.dart';
import 'package:construction_mate/data/datasource/transaction_data_source.dart';
import 'package:construction_mate/data/repository/bills_repository.dart';
import 'package:construction_mate/data/repository/site_progress_repository.dart';
import 'package:construction_mate/data/repository/transaction_repository.dart';
import 'package:construction_mate/logic/controllers/Authentication/SignUp/sign_up_bloc.dart';
import 'package:construction_mate/logic/controllers/BillingPartyParticularBloc/billing_party_particular_bloc.dart';
import 'package:construction_mate/logic/controllers/Building-by-id/building_by_id_bloc.dart';
import 'package:construction_mate/logic/controllers/FinancialByParty/financialy_by_party_bloc.dart';
import 'package:construction_mate/logic/controllers/MenuBloc/menu_bloc.dart';
import 'package:construction_mate/logic/controllers/PaymentTotalProjectWiseBloc/payment_total_project_bloc.dart';
import 'package:construction_mate/logic/controllers/Profile/EditProfileBloc/edit_profile_bloc.dart';
import 'package:construction_mate/logic/controllers/SelectFloorsBloc/select_floors_bloc.dart';
import 'package:construction_mate/logic/controllers/SiteProgressAgencyUpdate/site_progress_agency_update_bloc.dart';
import 'package:construction_mate/logic/controllers/StartAndEndDateBloc/start_and_end_date_bloc.dart';
import 'package:construction_mate/logic/controllers/TransactionByAgency/transaction_by_agency_bloc.dart';
import 'package:construction_mate/logic/controllers/TransactionIndividualAgency/transactions_individual_agency_bloc.dart';
import 'package:construction_mate/logic/controllers/FloorNameAndFeet/floor_name_and_feet_bloc.dart';
import 'package:construction_mate/logic/controllers/VisibillityBloc/visibility_eye_bloc.dart';
import 'package:construction_mate/logic/models/agency_model.dart';
import 'package:construction_mate/logic/models/bill_model.dart';
import 'package:construction_mate/logic/models/billing_party_model.dart';
import 'package:construction_mate/logic/models/building_model.dart';
import 'package:construction_mate/logic/models/floor_site_model.dart';
import 'package:construction_mate/logic/models/per_building_agency_model.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:construction_mate/logic/models/total_agency_model.dart';
import 'package:construction_mate/presentation/screens/authentication/forgot_password/forgot_email_screen.dart';
import 'package:construction_mate/presentation/screens/authentication/forgot_password/new_password_screen.dart';
import 'package:construction_mate/presentation/screens/authentication/signin/sign_in_screen.dart';
import 'package:construction_mate/presentation/screens/authentication/signup/sign_up_screen.dart';
import 'package:construction_mate/presentation/screens/authentication/signup/widgets/sign_up_step_2.dart';
import 'package:construction_mate/presentation/screens/bills/bills_particular_screen.dart';
import 'package:construction_mate/presentation/screens/bills/bills_screen.dart';
import 'package:construction_mate/presentation/screens/bills/pdf_preview.dart';
import 'package:construction_mate/presentation/screens/bills/sheet_view_screen.dart';
import 'package:construction_mate/presentation/screens/bottom_bar.dart';
import 'package:construction_mate/presentation/screens/onboard/onboard_step1.dart';
import 'package:construction_mate/presentation/screens/parties/material_party/material_party_screen.dart';
import 'package:construction_mate/presentation/screens/parties/material_party/material_product_screen.dart';
import 'package:construction_mate/presentation/screens/parties/material_party/material_thing_screen.dart';
import 'package:construction_mate/presentation/screens/parties/parties_screen.dart';
import 'package:construction_mate/presentation/screens/parties/parties_transaction_screen.dart';
import 'package:construction_mate/presentation/screens/parties/rent_party/rent_party_screen.dart';
import 'package:construction_mate/presentation/screens/parties/widget/add_particular_party_screen.dart';
import 'package:construction_mate/presentation/screens/profile/edit_profile/edit_profile_screen.dart';
import 'package:construction_mate/presentation/screens/profile/gst/gst_screen.dart';
import 'package:construction_mate/presentation/screens/profile/other_expense.dart/other_expense_screen.dart';
import 'package:construction_mate/presentation/screens/profile/tds/tds_screen.dart';
import 'package:construction_mate/presentation/screens/project/building_details_screen.dart';
import 'package:construction_mate/presentation/screens/project/details_screen.dart';
import 'package:construction_mate/presentation/screens/project/inidividual_transaction_screen.dart';
import 'package:construction_mate/presentation/screens/project/project_details_n_screen.dart';
import 'package:construction_mate/presentation/screens/project/rent/rental_products_screen.dart';
import 'package:construction_mate/presentation/screens/project/rent/rental_thing_screen.dart';
import 'package:construction_mate/presentation/screens/project/select_floors_screen.dart';
import 'package:construction_mate/presentation/screens/project/working_agency_details_screen.dart';
import 'package:construction_mate/presentation/screens/splash_screen/splash_screen.dart';
import 'package:construction_mate/presentation/screens/subscription/contact_us_screen.dart';
import 'package:construction_mate/presentation/screens/subscription/subscription_screen.dart';
import 'package:construction_mate/presentation/widgets/BillScreenWidgets/add_billing_party_bottom_sheet.dart';
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
          path: RoutesName.ONBOARD_SCREEN_PATH,
          name: RoutesName.ONBOARD_SCREEN_NAME,
          builder: (contex, state) => const OnboardStep1(),
        ),
        GoRoute(
          path: RoutesName.signUpScreen,
          name: RoutesName.signUpScreen,
          builder: (contex, state) {
            contex
                .read<VisibilityEyeBloc>()
                .add(const VisibilityEyeEvent.initialize());
            return SignUpScreen();
          },
        ),
        GoRoute(
          path: RoutesName.signUpScreen2,
          name: RoutesName.signUpScreen2,
          builder: (contex, state) {
            contex
                .read<VisibilityEyeBloc>()
                .add(const VisibilityEyeEvent.initialize());
            contex.read<SignUpBloc>().add(const SignUpEvent.initial());
            return const SignUpStep2();
          },
        ),
        GoRoute(
          path: RoutesName.signInScreen,
          name: RoutesName.signInScreen,
          builder: (contex, state) {
            contex
                .read<VisibilityEyeBloc>()
                .add(const VisibilityEyeEvent.initialize());
            return SignInScreen();
          },
        ),

        ///-----------------------------------------------------------
        ///--------------- Forgot Email
        ///-----------------------------------------------------------
        GoRoute(
          path: RoutesName.FORGOT_EMAIL_SCREEN_NAME,
          name: RoutesName.FORGOT_EMAIL_SCREEN_PATH,
          builder: (context, state) {
            return ForgotEmailScreen();
          },
        ),

        ///-----------------------------------------------------------
        ///--------------- New Password
        ///-----------------------------------------------------------
        GoRoute(
          path: RoutesName.NEW_PASSWORD_SCREEN_NAME,
          name: RoutesName.NEW_PASSWORD_SCREEN_PATH,
          builder: (context, state) {
            context
                .read<VisibilityEyeBloc>()
                .add(const VisibilityEyeEvent.initialize());

            return NewPasswordScreen();
          },
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
            final AgencyModel totalAgencyModel = state.extra as AgencyModel;
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
            final AgencyModel party = state.extra as AgencyModel;
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
          path: RoutesName.CONTACT_US_SCREEN_NAME,
          name: RoutesName.CONTACT_US_SCREEN_PATH,
          builder: (context, state) {
            return const ContactUsScreen();
          },
        ),
        GoRoute(
          path: RoutesName.tdsScreen,
          name: RoutesName.tdsScreen,
          builder: (context, state) {
            return const TdsScreen();
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
            context
                .read<EditProfileBloc>()
                .add(const EditProfileEvent.setData());

            return const EditProfileScreen();
          },
        ),

        ///-----------------------------------------------------------
        ///--------------- Add particular Party
        ///-----------------------------------------------------------
        GoRoute(
          path: RoutesName.ADD_PARTICULAR_PARTY_SCREEN_PATH,
          name: RoutesName.ADD_PARTICULAR_PARTY_SCREEN_NAME,
          builder: (context, state) {
            return const AddParticularPartyScreen();
          },
        ),

        ///-----------------------------------------------------------
        ///--------------- Add Billing Party
        ///-----------------------------------------------------------
        GoRoute(
          path: RoutesName.ADD_BILLING_PARTY_SCREEN_NAME,
          name: RoutesName.ADD_BILLING_PARTY_SCREEN_PATH,
          builder: (context, state) {
            return const MyAddBillingPartyBottomSheet();
          },
        ),

        ///-----------------------------------------------------------
        ///--------------- Add Material Party
        ///-----------------------------------------------------------
        GoRoute(
          path: RoutesName.ADD_MATERIAL_PARTY_SCREEN_NAME,
          name: RoutesName.ADD_MATERIAL_PARTY_SCREEN_PATH,
          builder: (context, state) {
            return const MyMaterialPartyBottomSheet();
          },
        ),

        ///-----------------------------------------------------------
        ///--------------- Add Rent Party
        ///-----------------------------------------------------------
        GoRoute(
          path: RoutesName.ADD_RENT_PARTY_SCREEN_NAME,
          name: RoutesName.ADD_RENT_PARTY_SCREEN_PATH,
          builder: (context, state) {
            return const MyRentPartyScreen();
          },
        ),

        ///-----------------------------------------------------------
        ///--------------- All Rent Party
        ///-----------------------------------------------------------
        GoRoute(
          path: RoutesName.RENT_PRODUCTS_BY_PROJECT_SCREEN_PATH,
          name: RoutesName.RENT_PRODUCTS_BY_PROJECT_SCREEN_NAME,
          builder: (context, state) {
            final data = state.extra as Map<String, dynamic>;

            return RentalProductsScreen(
              project: data['project'],
              partieId: data['partieId'],
              rental: data['rental'],
            );
          },
        ),

        ///-----------------------------------------------------------
        ///--------------- All Rental Thing
        ///-----------------------------------------------------------
        GoRoute(
          path: RoutesName.ALL_RENTAL_PRODUCTS_BY_PROJECT_SCREEN_PATH,
          name: RoutesName.ALL_RENTAL_PRODUCTS_BY_PROJECT_SCREEN_NAME,
          builder: (context, state) {
            final data = state.extra as Map<String, dynamic>;

            return RentThingScreen(
              project: data['project'],
              partieId: data['partieId'],
              rental: data['rental'],
            );
          },
        ),

        ///-----------------------------------------------------------
        ///--------------- All Materail Party
        ///-----------------------------------------------------------
        GoRoute(
          path: RoutesName.MATERIAL_PRODUCTS_BY_PROJECT_SCREEN_PATH,
          name: RoutesName.MATERIAL_PRODUCTS_BY_PROJECT_SCREEN_NAME,
          builder: (context, state) {
            final data = state.extra as Map<String, dynamic>;

            return MaterialProductsScreen(
              project: data['project'],
              partieId: data['partieId'],
              materials: data['material'],
            );
          },
        ),

        ///-----------------------------------------------------------
        ///--------------- All Materail Thing
        ///-----------------------------------------------------------
        GoRoute(
          path: RoutesName.ALL_MATERIAL_PRODUCTS_BY_PROJECT_SCREEN_PATH,
          name: RoutesName.ALL_MATERIAL_PRODUCTS_BY_PROJECT_SCREEN_NAME,
          builder: (context, state) {
            final data = state.extra as Map<String, dynamic>;

            return MaterialThingScreen(
              project: data['project'],
              partieId: data['partieId'],
              material: data['material'],
            );
          },
        ),
        GoRoute(
          path: RoutesName.NEW_DETAIL_SCREEN_PATH,
          name: RoutesName.NEW_DETAIL_SCREEN_NAME,
          builder: (context, state) {
            final ProjectModel project = state.extra as ProjectModel;

            return ProjectDetailsNScreen(
              projectModel: project,
            );
          },
        ),
      ]);
}
