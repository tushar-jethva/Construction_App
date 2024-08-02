import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/logic/controllers/TotalPaymentOutBloc/total_payment_out_bloc.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/transaction_status_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/vertical_divider.dart';
import 'package:flutter/cupertino.dart';
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
    return Padding(
      padding: EdgeInsets.only(left: 8.w, right: 9.w, top: 20.h),
      child: Container(
        decoration: BoxDecoration(
            color: theme.cardColor, borderRadius: BorderRadius.circular(15.r)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlocBuilder<TotalPaymentOutBloc, TotalPaymentOutState>(
                    builder: (context, state) {
                      return TransactionStatusWidget(
                        upperText: "Total +ve",
                        belowText: state.paymentIn,
                        upperTextStyle:
                            theme.textTheme.titleMedium!.copyWith(fontSize: 15),
                        belowTextStyle: theme.textTheme.titleLarge!
                            .copyWith(color: green, fontSize: 15),
                      );
                    },
                  ),
                  MyVerticalDivider(
                    height: 70.h,
                    width: 2.w,
                    color: grey,
                  ),
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
                  MyVerticalDivider(
                    height: 70.h,
                    width: 2.w,
                    color: grey,
                  ),
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
          ],
        ),
      ),
    );
  }
}
