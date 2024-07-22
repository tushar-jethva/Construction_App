// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:construction_mate/data/datasource/transaction_data_source.dart';
import 'package:construction_mate/data/repository/transaction_repository.dart';
import 'package:construction_mate/logic/controllers/StartAndEndDateBloc/start_and_end_date_bloc.dart';
import 'package:construction_mate/logic/controllers/TransactionBuilding/transaction_building_bloc.dart';
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
  @override
  Widget build(BuildContext context) {
    final project = widget.projectModel;
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TransactionStatusWidget(
                  upperText: "Advanced Paid",
                  belowText: "\$${project.paymentIn}",
                  upperTextStyle: TextStyle(color: grey, fontSize: 12),
                  belowTextStyle: TextStyle(color: green, fontSize: 12),
                ),
                MyVerticalDivider(
                  height: 40.h,
                  width: 2.w,
                  color: grey,
                ),
                TransactionStatusWidget(
                  upperText: "Pending to Pay",
                  belowText: "\$${project.paymentOut}",
                  upperTextStyle: TextStyle(color: grey, fontSize: 12),
                  belowTextStyle: TextStyle(color: red, fontSize: 12),
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
            const Center(child: Text('Paties Tab')),
            BuildingsScreen(
              project: widget.projectModel,
            ),
            BlocProvider(
              create: (context) => TransactionBuildingBloc(
                  transactionRepository: TransactionRepositoryImpl(
                      transactionDataSource: TransactionDataSourceImpl())),
              child: BlocProvider(
                create: (context) => StartAndEndDateBloc(),
                child: MyTransactionScreen(
                  project: widget.projectModel,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
