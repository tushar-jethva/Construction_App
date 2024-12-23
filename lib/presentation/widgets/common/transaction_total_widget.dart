import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/TotalPaymentOutBloc/total_payment_out_bloc.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/transaction_status_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/vertical_divider.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionsTotalWidget extends StatelessWidget {
  const TransactionsTotalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<TotalPaymentOutBloc, TotalPaymentOutState>(
              builder: (context, state) {
                return TransactionStatusWidget(
                  upperText: "Total +ve",
                  belowText: state.paymentIn ?? "",
                  upperTextStyle:
                      theme.textTheme.titleMedium!.copyWith(fontSize: 15),
                  belowTextStyle: theme.textTheme.titleLarge!
                      .copyWith(color: green, fontSize: 15),
                );
              },
            ),
            15.wx,
            BlocBuilder<TotalPaymentOutBloc, TotalPaymentOutState>(
              builder: (context, state) {
                return TransactionStatusWidget(
                  upperText: "Total -ve",
                  belowText: state.paymentOut,
                  upperTextStyle:
                      theme.textTheme.titleMedium!.copyWith(fontSize: 15),
                  belowTextStyle: theme.textTheme.titleLarge!
                      .copyWith(color: red, fontSize: 15),
                );
              },
            ),
            15.wx,
            BlocBuilder<TotalPaymentOutBloc, TotalPaymentOutState>(
              builder: (context, state) {
                return TransactionStatusWidget(
                  upperText: "Total",
                  belowText: (double.parse(state.paymentIn) -
                          double.parse(state.paymentOut))
                      .toString(),
                  upperTextStyle:
                      theme.textTheme.titleMedium!.copyWith(fontSize: 15),
                  belowTextStyle:
                      theme.textTheme.titleLarge!.copyWith(fontSize: 15),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
