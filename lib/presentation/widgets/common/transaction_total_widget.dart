import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/logic/controllers/TotalPaymentOutBloc/total_payment_out_bloc.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/transaction_status_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/vertical_divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionsTotalWidget extends StatelessWidget {
  const TransactionsTotalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w, right: 9.w, top: 15.h),
      child: Container(
        decoration: BoxDecoration(
            color: greyLight, borderRadius: BorderRadius.circular(15.r)),
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
                        upperTextStyle: TextStyle(color: grey),
                        belowTextStyle: TextStyle(color: green),
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
                        upperTextStyle: TextStyle(color: grey),
                        belowTextStyle: TextStyle(color: red),
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
                        upperTextStyle: const TextStyle(color: grey),
                        belowTextStyle: const TextStyle(color: black),
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
