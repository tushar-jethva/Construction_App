import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/data/datasource/project_data_source.dart';
import 'package:construction_mate/data/repository/billing_party_repository.dart';
import 'package:construction_mate/data/repository/bills_repository.dart';
import 'package:construction_mate/data/repository/project_repository.dart';
import 'package:construction_mate/logic/controllers/AddBillBloc/add_bill_bloc.dart';
import 'package:construction_mate/logic/controllers/AddBillingPartyBloc/add_billing_party_bloc.dart';
import 'package:construction_mate/presentation/widgets/BillScreenWidgets/add_bill_bottom_sheet.dart';
import 'package:construction_mate/presentation/widgets/BillScreenWidgets/add_billing_party_bottom_sheet.dart';
import 'package:construction_mate/presentation/widgets/BillScreenWidgets/bill_screen_app_bar_widet.dart';
import 'package:construction_mate/presentation/widgets/BillScreenWidgets/custom_top_bill_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBillScreen extends StatefulWidget {
  const MyBillScreen({super.key});

  @override
  State<MyBillScreen> createState() => _MyBillScreenState();
}

class _MyBillScreenState extends State<MyBillScreen> {
  openBottomSheetOfBillParty({required BuildContext context}) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return BlocProvider(
            create: (context) => AddBillingPartyBloc(
                projectRepository:
                    ProjectRepositoryImpl(ProjectDataSourceImpl()),
                    billingPartyRepository: BillingRepositoryImpl()),
                    
            child: const MyAddBillingPartyBottomSheet(),
          );
        });
  }

  openBottomSheetOfBill({required BuildContext context}) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return BlocProvider(
            create: (context) => AddBillBloc(billingPartyRepository: BillingRepositoryImpl(), billsRepository: BillsRepositoryImpl()),
            child: MyAddBillBottomSheet(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity,
                ReusableFunctions.getHeight(context: context, height: 0.22)),
            child: MyBillScreenAppBarWidget()),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      openBottomSheetOfBillParty(context: context);
                    },
                    child: Text(
                      "+ Billing Party",
                      style: theme.textTheme.titleLarge!
                          .copyWith(color: purple, fontSize: 16.5),
                    )),
                TextButton(
                  onPressed: () {
                    openBottomSheetOfBill(context: context);
                  },
                  child: Text(
                    "+ Add Bill",
                    style: theme.textTheme.titleLarge!
                        .copyWith(color: purple, fontSize: 16.5),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
