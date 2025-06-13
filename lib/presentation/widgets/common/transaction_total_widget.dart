import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/logic/controllers/PaymentInDropDownBloc/payment_in_drop_down_bloc.dart';
import 'package:construction_mate/logic/controllers/PaymentOutDropDownBloc/payment_out_drop_down_bloc.dart';
import 'package:construction_mate/logic/controllers/TotalPaymentOutBloc/total_payment_out_bloc.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/transaction_bottom_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/transaction_status_widget.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<TotalPaymentOutBloc, TotalPaymentOutState>(
              builder: (context, state) {
                return TransactionStatusWidget(
                  upperText: "Received",
                  belowText: "₹ ${state.paymentIn}",
                  upperTextStyle:
                      theme.textTheme.titleMedium!.copyWith(fontSize: 12),
                  belowTextStyle: theme.textTheme.titleLarge!
                      .copyWith(color: green, fontSize: 13),
                  onTap: () {},
                );
              },
            ),
            15.wx,
            BlocBuilder<TotalPaymentOutBloc, TotalPaymentOutState>(
              builder: (context, state) {
                return TransactionStatusWidget(
                  upperText: "Paid",
                  belowText: "₹ ${state.paymentOut}",
                  upperTextStyle:
                      theme.textTheme.titleMedium!.copyWith(fontSize: 12),
                  belowTextStyle: theme.textTheme.titleLarge!
                      .copyWith(color: red, fontSize: 13),
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
                      "₹ ${(double.parse(state.paymentIn) - double.parse(state.paymentOut)).toString()}",
                  upperTextStyle:
                      theme.textTheme.titleMedium!.copyWith(fontSize: 12),
                  belowTextStyle:
                      theme.textTheme.titleLarge!.copyWith(fontSize: 13),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
