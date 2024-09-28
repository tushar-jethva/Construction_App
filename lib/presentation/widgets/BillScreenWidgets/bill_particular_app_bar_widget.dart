import 'package:construction_mate/logic/controllers/FinancialByParty/financialy_by_party_bloc.dart';
import 'package:construction_mate/presentation/widgets/BillScreenWidgets/custom_top_bill_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MyBillScreenParticularAppBarWidget extends StatefulWidget {
  final String partyId;
  const MyBillScreenParticularAppBarWidget({super.key, required this.partyId});

  @override
  State<MyBillScreenParticularAppBarWidget> createState() =>
      _MyBillScreenParticularAppBarWidgetState();
}

class _MyBillScreenParticularAppBarWidgetState
    extends State<MyBillScreenParticularAppBarWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FinancialyByPartyBloc>().add(
        FinancialyByPartyEvent.fetchFinancialsByParty(partyId: widget.partyId));
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
      child: BlocBuilder<FinancialyByPartyBloc, FinancialyByPartyState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: theme.canvasColor,
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyCustomTopBillWidget(
                    title: "TDS",
                    amount: state.financialModel.totalTds!,
                  ),
                  MyCustomTopBillWidget(
                    title: "Received",
                    amount: state.financialModel.totalReceivedAmount!,
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyCustomTopBillWidget(
                    title: "GST",
                    amount: state.financialModel.totalGst!,
                  ),
                  MyCustomTopBillWidget(
                    title: "Receivable",
                    amount: state.financialModel.totalReceivableAmount!,
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
