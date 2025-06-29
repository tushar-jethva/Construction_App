import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/PaymentInDropDownBloc/payment_in_drop_down_bloc.dart';
import 'package:construction_mate/logic/controllers/PaymentOutDropDownBloc/payment_out_drop_down_bloc.dart';
import 'package:construction_mate/logic/controllers/TotalPaymentOutBloc/total_payment_out_bloc.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/transaction_bottom_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/transaction_status_widget.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionsTotalWidget extends StatefulWidget {
  const TransactionsTotalWidget({
    super.key,
  });

  @override
  State<TransactionsTotalWidget> createState() =>
      _TransactionsTotalWidgetState();
}

class _TransactionsTotalWidgetState extends State<TransactionsTotalWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 30.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<TotalPaymentOutBloc, TotalPaymentOutState>(
              builder: (context, state) {
                return TransactionStatusWidget(
                  upperText: "Received",
                  belowText:
                      "₹ ${ReusableFunctions.formatNumber(state.paymentIn)}",
                  upperTextStyle:
                      theme.textTheme.titleMedium!.copyWith(fontSize: 12.sp),
                  belowTextStyle: theme.textTheme.titleLarge!
                      .copyWith(color: green, fontSize: 13.sp),
                  onTap: () {},
                );
              },
            ),
            15.wx,
            BlocBuilder<TotalPaymentOutBloc, TotalPaymentOutState>(
              builder: (context, state) {
                return TransactionStatusWidget(
                  upperText: "Paid",
                  belowText:
                      "₹ ${ReusableFunctions.formatNumber(state.paymentOut)}",
                  upperTextStyle:
                      theme.textTheme.titleMedium!.copyWith(fontSize: 12.sp),
                  belowTextStyle: theme.textTheme.titleLarge!
                      .copyWith(color: red, fontSize: 13.sp),
                  onTap: () {},
                );
              },
            ),
            15.wx,
            BlocBuilder<TotalPaymentOutBloc, TotalPaymentOutState>(
              builder: (context, state) {
                return TransactionStatusWidget(
                  upperText: "Total",
                  belowText:
                      "₹ ${ReusableFunctions.formatNumber((double.parse(state.paymentIn) - double.parse(state.paymentOut)))}",
                  upperTextStyle:
                      theme.textTheme.titleMedium!.copyWith(fontSize: 12.sp),
                  belowTextStyle:
                      theme.textTheme.titleLarge!.copyWith(fontSize: 13.sp),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
