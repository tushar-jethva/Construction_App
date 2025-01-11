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
import 'package:construction_mate/presentation/screens/project/project_screen.dart';
import 'package:construction_mate/presentation/widgets/BillScreenWidgets/add_bill_bottom_sheet.dart';
import 'package:construction_mate/presentation/widgets/BillScreenWidgets/add_billing_party_bottom_sheet.dart';
import 'package:construction_mate/presentation/widgets/BillScreenWidgets/bill_screen_app_bar_widet.dart';
import 'package:construction_mate/presentation/widgets/BillScreenWidgets/custom_top_bill_widget.dart';
import 'package:construction_mate/presentation/widgets/common/common_error_and_notfound_widget.dart';
import 'package:construction_mate/presentation/widgets/common/draggable_scrollable_sheet.dart';
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
        backgroundColor: theme.cardColor,
        body: Stack(
          children: [
            const MyBillScreenAppBarWidget(),
            scrollableSheetWidget(context, theme)
          ],
        ));
  }

  BlocBuilder<BillingPartiesHomeBloc, BillingPartiesHomeState> allBillsWidget(
      ThemeData theme) {
    return BlocBuilder<BillingPartiesHomeBloc, BillingPartiesHomeState>(
      builder: (context, state) {
        if (state is BillingPartiesHomeLoading) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Center(
              child: CircularProgressIndicator(
                color: purple,
              ),
            ),
          );
        } else if (state is BillingPartiesHomeLoaded) {
          return state.billingParties.isNotEmpty
              ? RefreshIndicator(
                  onRefresh: onRefreshIndicatorCalled,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.billingParties.length,
                      itemBuilder: (context, index) {
                        final party = state.billingParties[index];
                        return GestureDetector(
                          onTap: () {
                            context.pushNamed(
                                RoutesName.billingPartyPaticularScreen,
                                extra: party);
                          },
                          child: Card(
                            elevation: 2,
                            margin: const EdgeInsets.all(16),
                            color: theme.hintColor,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        party.name!,
                                        style: theme.textTheme.titleMedium,
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text: "Received: ",
                                            style: theme.textTheme.titleMedium!
                                                .copyWith(
                                                    fontSize: 14, color: grey)),
                                        TextSpan(
                                            text:
                                                " ₹ ${double.parse(party.receivedAmount!).toStringAsFixed(2)}",
                                            style: theme.textTheme.titleMedium!
                                                .copyWith(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: green))
                                      ])),
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text: "Receivable: ",
                                            style: theme.textTheme.titleMedium!
                                                .copyWith(
                                                    fontSize: 14, color: grey)),
                                        TextSpan(
                                            text:
                                                "₹ ${double.parse(party.receivableAmount!).toStringAsFixed(2)}",
                                            style: theme.textTheme.titleMedium!
                                                .copyWith(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: red))
                                      ]))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                )
              : const ErrorAndNotFoundWidget(text: "No bills found!");
        } else {
          return const Center(
            child: Text("Something went wrong!"),
          );
        }
      },
    );
  }

  Widget partyAndBillAddWidget(BuildContext context, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonButton2(
            buttonName: " Billing Party",
            onTap: () {
              openBottomSheetOfBillParty(context: context);
            },
            backgroundColor: theme.cardColor,
            textColor: theme.canvasColor,
            iconColor: black,
            iconBackColor: const Color(0xffEBEEF0),
          ),
          CommonButton2(
            buttonName: "Add Bill",
            onTap: () {
              openBottomSheetOfBill(context: context);
            },
          ),
        ],
      ),
    );
  }

  DraggableScrollableSheetCommonComp scrollableSheetWidget(
      BuildContext context, ThemeData theme) {
    return DraggableScrollableSheetCommonComp(
      draggableScrollableController: DraggableScrollableController(),
      stops: const [0.75, 0.98],
      initialSize: 0.75,
      minChildSize: 0.75,
      radius: 20,
      isDraggerShow: false,
      newWidget: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Column(
            children: [
              partyAndBillAddWidget(context, theme),
              Expanded(
                child: SingleChildScrollView(
                    controller: scrollController, child: allBillsWidget(theme)),
              )
            ],
          ),
        );
      },
    );
  }
}
