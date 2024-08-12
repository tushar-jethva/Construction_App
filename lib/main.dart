import 'package:construction_mate/data/datasource/agency_data_source.dart';
import 'package:construction_mate/data/datasource/building_data_source.dart';
import 'package:construction_mate/data/datasource/project_data_source.dart';
import 'package:construction_mate/data/datasource/site_progress_data_source.dart';
import 'package:construction_mate/data/datasource/transaction_data_source.dart';
import 'package:construction_mate/data/datasource/work_types_source.dart';
import 'package:construction_mate/data/repository/agency_repository.dart';
import 'package:construction_mate/data/repository/building_repository.dart';
import 'package:construction_mate/data/repository/project_repository.dart';
import 'package:construction_mate/data/repository/site_progress_repository.dart';
import 'package:construction_mate/data/repository/transaction_repository.dart';
import 'package:construction_mate/data/repository/work_type_repository.dart';
import 'package:construction_mate/logic/controllers/AddAgencyDropDowns/add_agency_drop_downs_bloc.dart';
import 'package:construction_mate/logic/controllers/BottomBarBloc/bottom_bar_bloc.dart';
import 'package:construction_mate/logic/controllers/BuildingAddBloc/buildings_bloc.dart';
import 'package:construction_mate/logic/controllers/DateBloc/date_bloc_bloc.dart';
import 'package:construction_mate/logic/controllers/PaymentInDropDownBloc/payment_in_drop_down_bloc.dart';
import 'package:construction_mate/logic/controllers/PaymentOutDropDownBloc/payment_out_drop_down_bloc.dart';
import 'package:construction_mate/logic/controllers/PerBuildingAgency/per_building_agencies_bloc.dart';
import 'package:construction_mate/logic/controllers/ProjectListBloc/project_bloc.dart';
import 'package:construction_mate/logic/controllers/SiteProgressFloorBloc/site_progress_floors_bloc.dart';
import 'package:construction_mate/logic/controllers/ThemeBloc/theme_bloc.dart';
import 'package:construction_mate/logic/controllers/TotalAgencies/total_agencies_bloc.dart';
import 'package:construction_mate/logic/controllers/TotalPaymentOutBloc/total_payment_out_bloc.dart';
import 'package:construction_mate/presentation/router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
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
              transactionRepository: TransactionRepositoryImpl(transactionDataSource: TransactionDataSourceImpl()),
                projectRepository:
                    ProjectRepositoryImpl(ProjectDataSourceImpl()),
                agencyRepository: AgencyRepositoryImpl(
                    agencyDataSource: AgencyDataSourceDataSourceImpl()))),
        BlocProvider(
            create: (_) => SiteProgressFloorsBloc(
                siteProgressRepository: SiteProgressRepositoryImpl(
                    siteProgressDataSource: SiteProgressDataSourceImpl()))),
        BlocProvider(
            create: (_) => TotalAgenciesBloc(
                agencyRepository: AgencyRepositoryImpl(
                    agencyDataSource: AgencyDataSourceDataSourceImpl()))),
        BlocProvider(create: (_) => ThemeBloc())
      ],
      child: ScreenUtilInit(
        designSize: const Size(392.72, 783.27),
        splitScreenMode: true,
        child: MultiBlocProvider(
          providers: [BlocProvider(create: (_) => DateBlocBloc())],
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
