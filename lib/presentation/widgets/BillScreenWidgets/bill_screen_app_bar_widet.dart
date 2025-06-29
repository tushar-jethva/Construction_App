import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/FinancialBloc/financial_bloc.dart';
import 'package:construction_mate/presentation/widgets/BillScreenWidgets/custom_top_bill_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/transaction_status_widget.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBillScreenAppBarWidget extends StatefulWidget {
  final bool? isdetailScreen;
  const MyBillScreenAppBarWidget({super.key, this.isdetailScreen = false});

  @override
  State<MyBillScreenAppBarWidget> createState() =>
      _MyBillScreenAppBarWidgetState();
}

class _MyBillScreenAppBarWidgetState extends State<MyBillScreenAppBarWidget> {
  @override
  void initState() {
    super.initState();
    context.read<FinancialBloc>().add(const FinancialEvent.fetchFinancials());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.2,
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
      decoration: BoxDecoration(
          color: theme.cardColor, borderRadius: BorderRadius.circular(10.r)),
      child: BlocBuilder<FinancialBloc, FinancialState>(
        builder: (context, state) {
          return Row(
            children: [
              TransactionStatusWidget(
                upperText: "Received",
                belowText:
                    "₹ ${ReusableFunctions.formatNumber(state.financialModel.totalReceivedAmount)}",
                upperTextStyle:
                    theme.textTheme.titleMedium!.copyWith(fontSize: 14.sp),
                belowTextStyle: theme.textTheme.titleLarge!
                    .copyWith(fontSize: 15.sp, color: red),
                mainAxisSize: MainAxisSize.max,
              ),
              10.wx,
              TransactionStatusWidget(
                upperText: "Receivable",
                belowText:
                    "₹ ${ReusableFunctions.formatNumber(state.financialModel.totalReceivableAmount)}",
                upperTextStyle:
                    theme.textTheme.titleMedium!.copyWith(fontSize: 14.sp),
                belowTextStyle: theme.textTheme.titleLarge!
                    .copyWith(fontSize: 15.sp, color: green),
                mainAxisSize: MainAxisSize.max,
              ),
              10.wx,
              Column(
                children: [
                  Expanded(
                    child: MyCustomTopBillWidget(
                      title: "TDS",
                      amount: ReusableFunctions.formatNumber(
                          state.financialModel.totalTds),
                    ),
                  ),
                  10.hx,
                  Expanded(
                    child: MyCustomTopBillWidget(
                      title: "GST",
                      amount: ReusableFunctions.formatNumber(
                          state.financialModel.totalGst),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
