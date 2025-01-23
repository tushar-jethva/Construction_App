import 'dart:async';

import 'package:construction_mate/data/datasource/agency_data_source.dart';
import 'package:construction_mate/data/datasource/authentication_datasource.dart';
import 'package:construction_mate/data/datasource/building_data_source.dart';
import 'package:construction_mate/data/datasource/project_data_source.dart';
import 'package:construction_mate/data/datasource/site_progress_data_source.dart';
import 'package:construction_mate/data/datasource/transaction_data_source.dart';
import 'package:construction_mate/data/datasource/work_types_source.dart';
import 'package:construction_mate/data/repository/agency_repository.dart';
import 'package:construction_mate/data/repository/authentication_repository.dart';
import 'package:construction_mate/data/repository/billing_party_repository.dart';
import 'package:construction_mate/data/repository/bills_repository.dart';
import 'package:construction_mate/data/repository/building_repository.dart';
import 'package:construction_mate/data/repository/project_repository.dart';
import 'package:construction_mate/data/repository/site_progress_repository.dart';
import 'package:construction_mate/data/repository/transaction_repository.dart';
import 'package:construction_mate/data/repository/work_type_repository.dart';
import 'package:construction_mate/injections/injection.dart';
import 'package:construction_mate/logic/controllers/AddAgencyDropDowns/add_agency_drop_downs_bloc.dart';
import 'package:construction_mate/logic/controllers/AddBillingPartyBloc/add_billing_party_bloc.dart';
import 'package:construction_mate/logic/controllers/AddMaterialBloc/add_material_bloc.dart';
import 'package:construction_mate/logic/controllers/AgencyWorkingInProject/agency_works_projects_bloc.dart';
import 'package:construction_mate/logic/controllers/Authentication/SignIn/sign_in_bloc.dart';
import 'package:construction_mate/logic/controllers/Authentication/SignUp/sign_up_bloc.dart';
import 'package:construction_mate/logic/controllers/BillingPartiesHomeBloc/billing_parties_home_bloc.dart';
import 'package:construction_mate/logic/controllers/BottomBarBloc/bottom_bar_bloc.dart';
import 'package:construction_mate/logic/controllers/Building-by-id/building_by_id_bloc.dart';
import 'package:construction_mate/logic/controllers/BuildingAddBloc/buildings_bloc.dart';
import 'package:construction_mate/logic/controllers/DateBloc/date_bloc_bloc.dart';
import 'package:construction_mate/logic/controllers/Onboard/onboard_bloc.dart';
import 'package:construction_mate/logic/controllers/Profile/EditProfileBloc/edit_profile_bloc.dart';
import 'package:construction_mate/logic/controllers/FinancialBloc/financial_bloc.dart';
import 'package:construction_mate/logic/controllers/Gst/gst_bloc.dart';
import 'package:construction_mate/logic/controllers/MenuBloc/menu_bloc.dart';
import 'package:construction_mate/logic/controllers/OtherExpense/payment_out_other_expense_bloc.dart';
import 'package:construction_mate/logic/controllers/PaymentInDropDownBloc/payment_in_drop_down_bloc.dart';
import 'package:construction_mate/logic/controllers/PaymentOutDropDownBloc/payment_out_drop_down_bloc.dart';
import 'package:construction_mate/logic/controllers/PaymentTotalProjectWiseBloc/payment_total_project_bloc.dart';
import 'package:construction_mate/logic/controllers/PerBuildingAgency/per_building_agencies_bloc.dart';
import 'package:construction_mate/logic/controllers/Profile/user-watcher/user_watcher_bloc.dart';
import 'package:construction_mate/logic/controllers/ProjectListBloc/project_bloc.dart';
import 'package:construction_mate/logic/controllers/SiteProgressFloorBloc/site_progress_floors_bloc.dart';
import 'package:construction_mate/logic/controllers/StartAndEndDateBloc/start_and_end_date_bloc.dart';
import 'package:construction_mate/logic/controllers/SubscriptionBoxBloc/subsctiption_box_bloc.dart';
import 'package:construction_mate/logic/controllers/Tds/tds_bloc.dart';
import 'package:construction_mate/logic/controllers/ThemeBloc/theme_bloc.dart';
import 'package:construction_mate/logic/controllers/TotalAgencies/total_agencies_bloc.dart';
import 'package:construction_mate/logic/controllers/TotalPaymentOutBloc/total_payment_out_bloc.dart';
import 'package:construction_mate/logic/controllers/TransactionBuilding/transaction_building_bloc.dart';
import 'package:construction_mate/logic/controllers/VisibillityBloc/visibility_eye_bloc.dart';
import 'package:construction_mate/logic/controllers/authenticator_watcher/authenticator_watcher_bloc.dart';
import 'package:construction_mate/logic/controllers/OtherExpenseBloc/other_expense_bloc.dart';
import 'package:construction_mate/logic/controllers/bottomsheet/bottomsheet_bloc.dart';
import 'package:construction_mate/logic/controllers/network/network_bloc.dart';
import 'package:construction_mate/presentation/router/go_router.dart';
import 'package:construction_mate/utilities/app_bloc_observer.dart';
import 'package:construction_mate/utilities/logger.dart';
import 'package:construction_mate/utilities/shared_preference_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:construction_mate/injections/injection.dart' as di;

void main() {
  logger.runLogging(
    () => runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        Bloc.observer = const AppBlocObserver();
        // await ErrorStack.init();
        configureDependencies();
        await SharedPreferenceHelper().init();
        runApp(const MyApp());
      },
      logger.logZoneError,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return const MyMultiBlocProviders();
  }
}

class MyMultiBlocProviders extends StatelessWidget {
  const MyMultiBlocProviders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NetworkBloc()),
        BlocProvider(create: (_) => AuthenticatorWatcherBloc()),
        BlocProvider(
          create: (_) => BottomBarBloc(),
        ),
        BlocProvider(
            create: (_) => TotalPaymentOutBloc(
                transactionRepository: TransactionRepositoryImpl(
                    transactionDataSource: TransactionDataSourceImpl()))),
        BlocProvider(
          create: (_) =>
              ProjectBloc(ProjectRepositoryImpl(ProjectDataSourceImpl()))
                ..add(LoadProjects()),
        ),
        BlocProvider(
          create: (_) =>
              BuildingsBloc(BuildingRepositoryImpl(BuildingDataSourceImpl())),
        ),
        BlocProvider(
          create: (_) => PerBuildingAgenciesBloc(
              agencyRepository: AgencyRepositoryImpl(
                  agencyDataSource: AgencyDataSourceDataSourceImpl())),
        ),
        BlocProvider(
          create: (_) => AddAgencyDropDownsBloc(
              agencyRepository: AgencyRepositoryImpl(
                  agencyDataSource: AgencyDataSourceDataSourceImpl()),
              workTypesRepository:
                  WorkTypesRepositoryImpl(WorkTypesDataSourceImpl())),
        ),
        BlocProvider(
            create: (_) => PaymentOutDropDownBloc(
                buildingRepository:
                    BuildingRepositoryImpl(BuildingDataSourceImpl()),
                agencyRepository: AgencyRepositoryImpl(
                    agencyDataSource: AgencyDataSourceDataSourceImpl()),
                projectRepository:
                    ProjectRepositoryImpl(ProjectDataSourceImpl()),
                transactionRepository: TransactionRepositoryImpl(
                    transactionDataSource: TransactionDataSourceImpl()))),
        BlocProvider(
            create: (_) => PaymentInDropDownBloc(
                  transactionRepository: TransactionRepositoryImpl(
                      transactionDataSource: TransactionDataSourceImpl()),
                  billingPartyRepository: BillingRepositoryImpl(),
                )),
        BlocProvider(
            create: (_) => SiteProgressFloorsBloc(
                siteProgressRepository: SiteProgressRepositoryImpl(
                    siteProgressDataSource: SiteProgressDataSourceImpl()))),
        BlocProvider(
            create: (_) => TotalAgenciesBloc(
                agencyRepository: AgencyRepositoryImpl(
                    agencyDataSource: AgencyDataSourceDataSourceImpl()))),
        BlocProvider(create: (_) => ThemeBloc()),
        BlocProvider(
            create: (_) => BillingPartiesHomeBloc(
                billingPartyRepository: BillingRepositoryImpl())),
        BlocProvider(
            create: (_) =>
                FinancialBloc(billsRepository: BillsRepositoryImpl())),
        BlocProvider(
            create: (_) => SignUpBloc(
                repository: AuthenticationRepositoryImpl(
                    AuthenticationDatasourceImpl()))),
        BlocProvider(create: (_) => VisibilityEyeBloc()),
        BlocProvider(
          create: (_) => SignInBloc(
              authenticationRepository:
                  AuthenticationRepositoryImpl(AuthenticationDatasourceImpl())),
        ),
        BlocProvider(
          create: (context) => AddBillingPartyBloc(
              projectRepository: ProjectRepositoryImpl(ProjectDataSourceImpl()),
              billingPartyRepository: BillingRepositoryImpl()),
        ),
        BlocProvider(
            create: (context) => PaymentTotalProjectBloc(
                transactionRepository: TransactionRepositoryImpl(
                    transactionDataSource: TransactionDataSourceImpl()))),
        BlocProvider(
            create: (context) => TransactionBuildingBloc(
                transactionRepository: TransactionRepositoryImpl(
                    transactionDataSource: TransactionDataSourceImpl()))),
        BlocProvider(create: (_) => di.locator<AgencyWorksProjectsBloc>()),
        BlocProvider(create: (_) => di.locator<AddMaterialBloc>()),
        BlocProvider(create: (_) => di.locator<BottomsheetBloc>()),
        BlocProvider(create: (_) => di.locator<SubsctiptionBoxBloc>()),
        BlocProvider(create: (_) => di.locator<TdsBloc>()),
        BlocProvider(create: (_) => di.locator<GstBloc>()),
        BlocProvider(create: (_) => di.locator<OtherExpenseBloc>()),
        BlocProvider(create: (_) => di.locator<EditProfileBloc>()),
        BlocProvider(create: (_) => di.locator<PaymentOutOtherExpenseBloc>()),
        BlocProvider(create: (_) => di.locator<MenuBloc>()),
        BlocProvider(create: (_) => di.locator<BuildingByIdBloc>()),
        BlocProvider(create: (_) => di.locator<DateBlocBloc>()),
        BlocProvider(create: (_) => StartAndEndDateBloc()),
        BlocProvider(create: (_) => di.locator<UserWatcherBloc>()),
        BlocProvider(create: (_) => di.locator<OnboardBloc>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(392.72, 783.27),
        splitScreenMode: true,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => DateBlocBloc()),
          ],
          child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: state.themeData,
                routerConfig: Routes.routes,
              );
            },
          ),
        ),
      ),
    );
  }
}
