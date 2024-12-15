import 'package:construction_mate/gen/assets.gen.dart';
import 'package:construction_mate/logic/controllers/FinancialBloc/financial_bloc.dart';
import 'package:construction_mate/presentation/widgets/BillScreenWidgets/custom_top_bill_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

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
    // TODO: implement initState
    super.initState();
    context.read<FinancialBloc>().add(FinancialEvent.fetchFinancials());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 25.h),
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
      decoration: BoxDecoration(
          color: theme.cardColor, borderRadius: BorderRadius.circular(10.r)),
      child: BlocBuilder<FinancialBloc, FinancialState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.isdetailScreen!
                  ? IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: theme.canvasColor,
                      ))
                  : Align(
                      alignment: Alignment.bottomCenter,
                      child: SvgPicture.asset(
                        Assets.svg.billsBack3.path,
                      ),
                    ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyCustomTopBillWidget(
                    title: "TDS",
                    amount: double.parse(state.financialModel.totalTds!)
                        .toStringAsFixed(2),
                  ),
                  MyCustomTopBillWidget(
                    title: "Received",
                    amount:
                        double.parse(state.financialModel.totalReceivedAmount!)
                            .toStringAsFixed(2),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyCustomTopBillWidget(
                    title: "GST",
                    amount: double.parse(state.financialModel.totalGst!)
                        .toStringAsFixed(2),
                  ),
                  MyCustomTopBillWidget(
                    title: "Receivable",
                    amount: double.parse(
                            state.financialModel.totalReceivableAmount!)
                        .toStringAsFixed(2),
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
