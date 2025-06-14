// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:construction_mate/logic/controllers/MenuBloc/menu_bloc.dart';
import 'package:construction_mate/logic/controllers/PaymentTotalProjectWiseBloc/payment_total_project_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/logic/models/project_model.dart';
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
    super.initState();
    _paymentTotalProjectBloc =
        BlocProvider.of<PaymentTotalProjectBloc>(context);
    _paymentTotalProjectBloc.add(PaymentTotalProjectEvent.fetchAllTotalPayments(
        projectId: widget.projectModel.sId!));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: theme.canvasColor),
          backgroundColor: theme.scaffoldBackgroundColor,
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlocBuilder<PaymentTotalProjectBloc, PaymentTotalProjectState>(
                  builder: (context, state) {
                    return TransactionStatusWidget(
                      upperText: "Amount Received",
                      belowText: state.paymentIn,
                      upperTextStyle: theme.textTheme.titleLarge!
                          .copyWith(color: greyELight, fontSize: 13),
                      belowTextStyle: theme.textTheme.titleLarge!
                          .copyWith(color: green, fontSize: 13.5),
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
                      upperText: "Amount Paid",
                      belowText: state.paymentOut,
                      upperTextStyle: theme.textTheme.titleLarge!
                          .copyWith(color: greyELight, fontSize: 13),
                      belowTextStyle: theme.textTheme.titleLarge!
                          .copyWith(color: red, fontSize: 13.5),
                    );
                  },
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: TabBar(
              isScrollable: true,
              onTap: (index) {
                context
                    .read<MenuBloc>()
                    .add(MenuEvent.onIndexChanged(index: index));
              },
              labelColor: purple,
              unselectedLabelColor: greyELight,
              dividerColor: theme.canvasColor,
              indicatorColor: purple,
              overlayColor: const MaterialStatePropertyAll(Colors.transparent),
              tabs: const [
                Tab(text: 'Parties'),
                Tab(text: 'Buildings'),
                Tab(
                  text: 'Material',
                ),
                Tab(text: 'Transactions'),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            // BlocProvider(
            //   create: (context) => AgencyWorksProjectsBloc(
            //       agencyRepository: AgencyRepositoryImpl(
            //           agencyDataSource: AgencyDataSourceDataSourceImpl())),
            //   child: MyPartiesProjectScreen(
            //     project: widget.projectModel,
            //   ),
            // ),
            // // BuildingsScreen(
            // //   project: widget.projectModel,
            // // ),
            // MaterialScreen(
            //   project: widget.projectModel,
            // ),
            // MultiBlocProvider(
            //   providers: [
            //     BlocProvider(
            //       create: (_) => TransactionBuildingBloc(
            //           transactionRepository: TransactionRepositoryImpl(
            //               transactionDataSource: TransactionDataSourceImpl())),
            //     ),
            //     BlocProvider(
            //       create: (_) => StartAndEndDateBloc(),
            //     )
            //   ],
            //   child: MyTransactionScreen(
            //     project: widget.projectModel,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
