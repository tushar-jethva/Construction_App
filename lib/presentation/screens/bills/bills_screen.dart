import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/data/datasource/project_data_source.dart';
import 'package:construction_mate/data/repository/billing_party_repository.dart';
import 'package:construction_mate/data/repository/bills_repository.dart';
import 'package:construction_mate/data/repository/project_repository.dart';
import 'package:construction_mate/logic/controllers/AddBillBloc/add_bill_bloc.dart';
import 'package:construction_mate/logic/controllers/AddBillingPartyBloc/add_billing_party_bloc.dart';
import 'package:construction_mate/logic/controllers/BillingPartiesHomeBloc/billing_parties_home_bloc.dart';
import 'package:construction_mate/logic/controllers/FinancialBloc/financial_bloc.dart';
import 'package:construction_mate/logic/controllers/OtherDetailsBillBloc/other_details_bill_bloc.dart';
import 'package:construction_mate/logic/controllers/SwitchBloc/switch_bloc.dart';
import 'package:construction_mate/presentation/widgets/BillScreenWidgets/add_bill_bottom_sheet.dart';
import 'package:construction_mate/presentation/widgets/BillScreenWidgets/add_billing_party_bottom_sheet.dart';
import 'package:construction_mate/presentation/widgets/BillScreenWidgets/bill_screen_app_bar_widet.dart';
import 'package:construction_mate/presentation/widgets/BillScreenWidgets/custom_top_bill_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MyBillScreen extends StatefulWidget {
  const MyBillScreen({super.key});

  @override
  State<MyBillScreen> createState() => _MyBillScreenState();
}

class _MyBillScreenState extends State<MyBillScreen> {
  openBottomSheetOfBillParty({required BuildContext context}) {
    showModalBottomSheet(
        isScrollControlled: true,
        showDragHandle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return const MyAddBillingPartyBottomSheet();
        });
  }

  openBottomSheetOfBill({required BuildContext context}) {
    showModalBottomSheet(
        isScrollControlled: true,
        showDragHandle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AddBillBloc(
                    billingPartyRepository: BillingRepositoryImpl(),
                    billsRepository: BillsRepositoryImpl()),
              ),
              BlocProvider(
                create: (context) => SwitchBloc(),
              ),
            ],
            child: const MyAddBillBottomSheet(),
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<BillingPartiesHomeBloc>().add(BillingPartiesLoadEvent());
  }

  Future<void> onRefreshIndicatorCalled() async {
    context.read<BillingPartiesHomeBloc>().add(BillingPartiesLoadEvent());
    context.read<FinancialBloc>().add(const FinancialEvent.fetchFinancials());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity,
                ReusableFunctions.getHeight(context: context, height: 0.19)),
            child: const MyBillScreenAppBarWidget()),
        body: RefreshIndicator(
          color: purple,
          onRefresh: onRefreshIndicatorCalled,
          child: Column(
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
              ),
              BlocBuilder<BillingPartiesHomeBloc, BillingPartiesHomeState>(
                builder: (context, state) {
                  if (state is BillingPartiesHomeLoading) {
                    return Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: purple,
                        ),
                      ),
                    );
                  } else if (state is BillingPartiesHomeLoaded) {
                    return Expanded(
                        child: state.billingParties.isNotEmpty
                            ? ListView.builder(
                                itemCount: state.billingParties.length,
                                itemBuilder: (context, index) {
                                  final party = state.billingParties[index];
                                  return GestureDetector(
                                    onTap: () {
                                      context.pushNamed(
                                          RoutesName
                                              .billingPartyPaticularScreen,
                                          extra: party);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(8),
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: theme.cardColor,
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                party.name!,
                                                style:
                                                    theme.textTheme.titleMedium,
                                              )
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                    text: "Received: ",
                                                    style: theme
                                                        .textTheme.titleMedium!
                                                        .copyWith(
                                                            fontSize: 14)),
                                                TextSpan(
                                                    text: double.parse(party
                                                            .receivedAmount!)
                                                        .toStringAsFixed(2),
                                                    style: theme
                                                        .textTheme.titleMedium!
                                                        .copyWith(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))
                                              ])),
                                              RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                    text: "Receivable: ",
                                                    style: theme
                                                        .textTheme.titleMedium!
                                                        .copyWith(
                                                            fontSize: 14)),
                                                TextSpan(
                                                    text: double.parse(party
                                                            .receivableAmount!)
                                                        .toStringAsFixed(2),
                                                    style: theme
                                                        .textTheme.titleMedium!
                                                        .copyWith(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))
                                              ]))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                })
                            : SingleChildScrollView(
                                physics:
                                    const AlwaysScrollableScrollPhysics(), // Ensures scrollability
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.55, // Ensure enough height
                                  child: const Center(
                                    child: Text('No parties found!'),
                                  ),
                                )));
                  } else {
                    return const Center(
                      child: Text("Something went wrong!"),
                    );
                  }
                },
              )
            ],
          ),
        ));
  }
}
