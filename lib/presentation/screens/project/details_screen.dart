// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:construction_mate/data/datasource/agency_data_source.dart';
import 'package:construction_mate/data/datasource/transaction_data_source.dart';
import 'package:construction_mate/data/repository/agency_repository.dart';
import 'package:construction_mate/data/repository/transaction_repository.dart';
import 'package:construction_mate/logic/controllers/AgencyWorkingInProject/agency_works_projects_bloc.dart';
import 'package:construction_mate/logic/controllers/PaymentTotalProjectWiseBloc/payment_total_project_bloc.dart';
import 'package:construction_mate/logic/controllers/StartAndEndDateBloc/start_and_end_date_bloc.dart';
import 'package:construction_mate/logic/controllers/TransactionBuilding/transaction_building_bloc.dart';
import 'package:construction_mate/presentation/screens/project/parties_screen.dart';
import 'package:construction_mate/presentation/screens/project/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:construction_mate/presentation/screens/project/building_screen.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/transaction_status_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/vertical_divider.dart';

class MyProjectDetailsScreen extends StatefulWidget {
  final ProjectModel projectModel;
  const MyProjectDetailsScreen({
    Key? key,
    required this.projectModel,
  }) : super(key: key);

  @override
  State<MyProjectDetailsScreen> createState() => _MyProjectDetailsScreenState();
}

class _MyProjectDetailsScreenState extends State<MyProjectDetailsScreen> {
  late PaymentTotalProjectBloc _paymentTotalProjectBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _paymentTotalProjectBloc =
        BlocProvider.of<PaymentTotalProjectBloc>(context);
    _paymentTotalProjectBloc
        .add(FetchTotalPaymentOutProject(projectId: widget.projectModel.sId!));
  }

  @override
  Widget build(BuildContext context) {
    final project = widget.projectModel;
    final theme = Theme.of(context);
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.scaffoldBackgroundColor,
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlocBuilder<PaymentTotalProjectBloc, PaymentTotalProjectState>(
                  builder: (context, state) {
                    return TransactionStatusWidget(
                      upperText: "Advanced Paid",
                      belowText: state.paymentOut,
                      upperTextStyle: TextStyle(color: grey, fontSize: 12),
                      belowTextStyle: TextStyle(color: green, fontSize: 12),
                    );
                  },
                ),
                MyVerticalDivider(
                  height: 40.h,
                  width: 2.w,
                  color: grey,
                ),
                BlocBuilder<PaymentTotalProjectBloc, PaymentTotalProjectState>(
                  builder: (context, state) {
                    return TransactionStatusWidget(
                      upperText: "Pending to Pay",
                      belowText: state.paymentIn,
                      upperTextStyle: TextStyle(color: grey, fontSize: 12),
                      belowTextStyle: TextStyle(color: red, fontSize: 12),
                    );
                  },
                ),
              ],
            ),
          ),
          bottom: TabBar(
            onTap: (index) {},
            tabs: const [
              Tab(text: 'Parties'),
              Tab(text: 'Buildings'),
              Tab(text: 'Transactions'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BlocProvider(
              create: (context) => AgencyWorksProjectsBloc(
                  agencyRepository: AgencyRepositoryImpl(
                      agencyDataSource: AgencyDataSourceDataSourceImpl())),
              child: MyPartiesProjectScreen(
                project: widget.projectModel,
              ),
            ),
            BuildingsScreen(
              project: widget.projectModel,
            ),
            MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) => TransactionBuildingBloc(
                      transactionRepository: TransactionRepositoryImpl(
                          transactionDataSource: TransactionDataSourceImpl())),
                ),
                BlocProvider(
                  create: (_) => StartAndEndDateBloc(),
                )
              ],
              child: MyTransactionScreen(
                project: widget.projectModel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
