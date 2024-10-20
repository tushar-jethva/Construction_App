import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/lists.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/AddBillBloc/add_bill_bloc.dart';
import 'package:construction_mate/logic/controllers/BillingPartiesHomeBloc/billing_parties_home_bloc.dart';
import 'package:construction_mate/logic/controllers/FinancialBloc/financial_bloc.dart';
import 'package:construction_mate/logic/controllers/OtherDetailsBillBloc/other_details_bill_bloc.dart';
import 'package:construction_mate/logic/controllers/SwitchBloc/switch_bloc.dart';
import 'package:construction_mate/logic/models/Other_Details_Bill_Model.dart';
import 'package:construction_mate/logic/models/bill_item_model.dart';
import 'package:construction_mate/presentation/widgets/common/custom_button_with_widget.dart';
import 'package:construction_mate/presentation/widgets/common/custom_text_form_field.dart';
import 'package:construction_mate/presentation/widgets/common/drop_down.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/custom_button_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/transaction_bottom_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class MyAddBillBottomSheet extends StatefulWidget {
  const MyAddBillBottomSheet({super.key});

  @override
  State<MyAddBillBottomSheet> createState() => _MyAddBillBottomSheetState();
}

class _MyAddBillBottomSheetState extends State<MyAddBillBottomSheet> {
  final TextEditingController _hsnCodeController = TextEditingController();
  final TextEditingController _itemDescriptionController =
      TextEditingController();
  final TextEditingController _squareFeetController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _cgstController = TextEditingController();
  final TextEditingController _sgstController = TextEditingController();
  final TextEditingController _tdsController = TextEditingController();

  final _billFormKey = GlobalKey<FormState>();
  final _innerItemFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AddBillBloc>().add(BillGetAllPartiesEvent());
    _sgstController.text = "9";
    _cgstController.text = "9";
    _tdsController.text = "2";
  }

  @override
  void dispose() {
    super.dispose();
    _hsnCodeController.dispose();
    _itemDescriptionController.dispose();
    _squareFeetController.dispose();
    _rateController.dispose();
    _amountController.dispose();
    _cgstController.dispose();
    _sgstController.dispose();
    _tdsController.dispose();
  }

  double totalAmount = 0;
  double getTotalAmount() {
    if (_squareFeetController.text.isNotEmpty &&
        _rateController.text.isNotEmpty) {
      double squareFeet = double.parse(_squareFeetController.text);
      double rate = double.parse(_rateController.text);
      totalAmount = squareFeet * rate;
      setState(() {});
      return totalAmount;
    } else {
      totalAmount = 0;
      setState(() {});
      return 0;
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime initialDate = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      // ignore: use_build_context_synchronously
      context
          .read<AddBillBloc>()
          .add(BillDateChangedEvent(dateTime: pickedDate));
    }
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final theme = Theme.of(context);

    List<BillItemModel> billItems = [];
    return FractionallySizedBox(
      heightFactor: 0.9,
      child: Padding(
        padding: mediaQueryData.viewInsets,
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r))),
            child: Column(
              children: [
                BlocBuilder<AddBillBloc, AddBillState>(
                    builder: (context, state) {
                  if (!state.isLoadingParties) {
                    return CustomDropDown(items: selectParties);
                  }
                  return PaymentOutCustomDropDown(
                      value: state.selecteParty[0].sId,
                      list: state.selecteParty
                          .map((e) => DropdownMenuItem(
                                value: e.sId,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      0.4, // Set a specific width here
                                  child: Text(
                                    e.name!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (val) {
                        context
                            .read<AddBillBloc>()
                            .add(BillPartyNameChanged(partyId: val));
                      },
                      validator: (val) {
                        if (val == state.selecteParty[0].sId) {
                          return 'Please select one of the party!';
                        }
                      });
                }),
                Gap(10.h),
                BlocBuilder<AddBillBloc, AddBillState>(
                  builder: (context, state) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.billItems.length,
                      itemBuilder: (context, index) {
                        BillItemModel bill = state.billItems[index];
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: greyELight),
                              color: theme.scaffoldBackgroundColor),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "HSN Code : ${bill.hashCode}",
                                style: theme.textTheme.titleMedium,
                              ),
                              Text(
                                "Sqare Feet : ${bill.squareFeet}",
                                style: theme.textTheme.titleMedium,
                              ),
                              Text(
                                "Rate : ${bill.rate}",
                                style: theme.textTheme.titleMedium,
                              ),
                              Text(
                                "Total Amount : ${bill.amount}",
                                style: theme.textTheme.titleMedium,
                              ),
                              Text(
                                "Description : ${bill.itemDescription}",
                                style: theme.textTheme.titleMedium,
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
                Gap(10),
                Form(
                  key: _billFormKey,
                  child: Column(
                    children: [
                      Form(
                        key: _innerItemFormKey,
                        child: Column(
                          children: [
                            MyCustomTextFormField(
                              controller: _hsnCodeController,
                              hintText: "HSN code",
                              maxLines: 1,
                              textInputType: TextInputType.name,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please add HSN Code!';
                                }
                              },
                            ),
                            Gap(10.h),
                            MyCustomTextFormField(
                              controller: _itemDescriptionController,
                              hintText: "Description",
                              maxLines: 2,
                              textInputType: TextInputType.name,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please add description!';
                                }
                              },
                            ),
                            Gap(10.h),
                            MyCustomTextFormField(
                              controller: _squareFeetController,
                              hintText: "Square feet",
                              maxLines: 1,
                              onChanged: (value) {
                                getTotalAmount();
                              },
                              textInputType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please add foot per floor!';
                                }
                                if (double.tryParse(value) == null) {
                                  return 'Please enter valid digit!';
                                }
                                if (value.startsWith('-')) {
                                  return 'Please enter valid digit!';
                                }
                              },
                            ),
                            Gap(10.h),
                            MyCustomTextFormField(
                              controller: _rateController,
                              hintText: "Rate",
                              maxLines: 1,
                              textInputType: TextInputType.number,
                              onChanged: (value) {
                                getTotalAmount();
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please add rate!';
                                }
                                if (double.tryParse(value) == null) {
                                  return 'Please enter valid digit!';
                                }
                                if (value.startsWith('-')) {
                                  return 'Please enter valid digit!';
                                }
                              },
                            ),
                            Gap(10.h),
                            Container(
                              height: 50,
                              alignment: Alignment.centerLeft,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border.all(color: grey, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(totalAmount.toString()),
                              ),
                            ),
                            Gap(10.h),
                            MyCustomButton(
                              buttonName: "Add Item",
                              color: green,
                              style: theme.textTheme.titleMedium!
                                  .copyWith(color: white),
                              onPressed: () {
                                if (_innerItemFormKey.currentState!
                                    .validate()) {
                                  BillItemModel billItem = BillItemModel(
                                      HSNCode: _hsnCodeController.text,
                                      itemDescription:
                                          _itemDescriptionController.text,
                                      squareFeet: double.parse(
                                          _squareFeetController.text),
                                      rate: double.parse(_rateController.text),
                                      amount: totalAmount);
                                  context.read<AddBillBloc>().add(
                                      BillItemAddedEvent(billItem: billItem));
                                  print("Done");

                                  _hsnCodeController.clear();
                                  _itemDescriptionController.clear();
                                  _squareFeetController.clear();
                                  _rateController.clear();
                                  totalAmount = 0;
                                  setState(() {});
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      Gap(20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: MyCustomTextFormField(
                              controller: _sgstController,
                              hintText: "SGST",
                              maxLines: 1,
                              textInputType: TextInputType.number,
                              onChanged: (value) {
                                context.read<AddBillBloc>().add(
                                    BillSGSTChangedEvent(
                                        sgst: double.parse(
                                            _sgstController.text)));
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please add SGST!';
                                }
                                if (int.tryParse(value) == null) {
                                  return 'Please enter valid digit!';
                                }
                                if (value.startsWith('-')) {
                                  return 'Please enter valid digit!';
                                }
                              },
                            ),
                          ),
                          Gap(10.w),
                          Expanded(
                            flex: 1,
                            child: MyCustomTextFormField(
                              controller: _cgstController,
                              hintText: "CGST",
                              maxLines: 1,
                              textInputType: TextInputType.number,
                              onChanged: (value) {
                                context.read<AddBillBloc>().add(
                                    BillCGSTChangedEvent(
                                        cgst: double.parse(
                                            _cgstController.text)));
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please add CGST!';
                                }
                                if (int.tryParse(value) == null) {
                                  return 'Please enter valid digit!';
                                }
                                if (value.startsWith('-')) {
                                  return 'Please enter valid digit!';
                                }
                              },
                            ),
                          ),
                          Gap(10.w),
                          Expanded(
                            flex: 1,
                            child: MyCustomTextFormField(
                              controller: _tdsController,
                              hintText: "TDS",
                              maxLines: 1,
                              textInputType: TextInputType.number,
                              onChanged: (value) {
                                context.read<AddBillBloc>().add(
                                    BillTDSChangedEvent(
                                        tds:
                                            double.parse(_tdsController.text)));
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please add TDS!';
                                }
                                if (int.tryParse(value) == null) {
                                  return 'Please enter valid digit!';
                                }
                                if (value.startsWith('-')) {
                                  return 'Please enter valid digit!';
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      Gap(10.h),
                      Gap(10.h),
                      BlocBuilder<AddBillBloc, AddBillState>(
                        builder: (context, state) {
                          double netAmount = 0;
                          double totalAmount = 0;
                          for (int i = 0; i < state.billItems.length; i++) {
                            totalAmount += state.billItems[i].amount;
                          }
                          double SGSTAmount = totalAmount * state.sgst / 100;
                          double CGSTAmount = totalAmount * state.cgst / 100;
                          netAmount = totalAmount + SGSTAmount + CGSTAmount;

                          return Container(
                            height: 50,
                            alignment: Alignment.centerLeft,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: grey, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(netAmount.toString()),
                            ),
                          );
                        },
                      ),
                      Gap(10.h),
                      GestureDetector(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: Container(
                          height: 50.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 15.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: grey),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BlocBuilder<AddBillBloc, AddBillState>(
                                builder: (context, state) {
                                  final String formattedDate =
                                      DateFormat.yMMMd().format(state.date);
                                  return Text("Date: $formattedDate");
                                },
                              ),
                              Icon(
                                Icons.calendar_month,
                                color: theme.canvasColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Gap(10.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Others",
                              style: theme.textTheme.titleMedium,
                            ),
                            Gap(10.w),
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<SwitchBloc>()
                                    .add(SwitchEvent.switched());
                              },
                              child: BlocBuilder<SwitchBloc, SwitchState>(
                                builder: (context, state) {
                                  return Container(
                                    padding: const EdgeInsets.all(7),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(34, 97, 97, 97),
                                    ),
                                    child: Icon(
                                      state.isSwitched
                                          ? Icons.cancel
                                          : Icons.add,
                                      color: theme.canvasColor,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(10.h),
                      BlocBuilder<SwitchBloc, SwitchState>(
                        builder: (context, state) {
                          return state.isSwitched
                              ? Column(children: [
                                  MyCustomTextFormField(
                                    hintText: "Delivery Note",
                                    maxLines: 2,
                                    onChanged: (value) {
                                      print(
                                          "---------------------textfield--------------");
                                      context.read<AddBillBloc>().add(
                                          BillDeliveryNoteChanged(
                                              value: value!));
                                    },
                                  ),
                                  Gap(10.h),
                                  MyCustomTextFormField(
                                    hintText: "Mode of Payment",
                                    maxLines: 1,
                                    onChanged: (value) {
                                      context.read<AddBillBloc>().add(
                                          BillModeOfPaymentChanged(
                                              value: value!));
                                    },
                                  ),
                                  Gap(10.h),
                                  MyCustomTextFormField(
                                    hintText: "Reference No.",
                                    maxLines: 1,
                                    onChanged: (value) {
                                      context.read<AddBillBloc>().add(
                                          BillreferenceNoChanged(
                                              value: value!));
                                    },
                                  ),
                                  Gap(10.h),
                                  MyCustomTextFormField(
                                    hintText: "Other references",
                                    maxLines: 1,
                                    onChanged: (value) {
                                      context.read<AddBillBloc>().add(
                                          BillOtherReferencesChanged(
                                              value: value!));
                                    },
                                  ),
                                  Gap(10.h),
                                  MyCustomTextFormField(
                                    hintText: "Buyers's Order No.",
                                    maxLines: 1,
                                    onChanged: (value) {
                                      context.read<AddBillBloc>().add(
                                          BillBuyersOrderNoChanged(
                                              value: value!));
                                    },
                                  ),
                                  Gap(10.h),
                                  MyCustomTextFormField(
                                    hintText: "Dispatch doc No.",
                                    maxLines: 1,
                                    onChanged: (value) {
                                      context.read<AddBillBloc>().add(
                                          BillDispatchDocNoChanged(
                                              value: value!));
                                    },
                                  ),
                                  Gap(10.h),
                                  MyCustomTextFormField(
                                    hintText: "Dispatched through",
                                    maxLines: 1,
                                    onChanged: (value) {
                                      context.read<AddBillBloc>().add(
                                          BillDispatchedThroughChanged(
                                              value: value!));
                                    },
                                  ),
                                  Gap(10.h),
                                  MyCustomTextFormField(
                                    hintText: "Destination",
                                    maxLines: 2,
                                    onChanged: (value) {
                                      context.read<AddBillBloc>().add(
                                          BillDestinationChanged(
                                              value: value!));
                                    },
                                  ),
                                ])
                              : const SizedBox();
                        },
                      ),
                      Gap(10.h),
                      BlocConsumer<AddBillBloc, AddBillState>(
                        listener: (context, state) {
                          if (state.isAddedBill == 2) {
                            Navigator.pop(context);
                            context
                                .read<BillingPartiesHomeBloc>()
                                .add(BillingPartiesLoadEvent());
                          }
                        },
                        builder: (context, state) {
                          return MyCustomButtonWidget(
                            widget: state.isAddedBill == 1
                                ? ReusableFunctions.loader()
                                : Text(
                                    "Add Bill",
                                    style: theme.textTheme.titleMedium!
                                        .copyWith(color: white),
                                  ),
                            color: green,
                            onPressed: () {
                              if (_billFormKey.currentState!.validate()) {
                                final state = context.read<SwitchBloc>().state;
                                if (state.isSwitched) {
                                  print(
                                      "------------------switch ${state.isSwitched}------------------------");
                                  context
                                      .read<AddBillBloc>()
                                      .add(BillAddBillEvent());
                                  context.read<FinancialBloc>().add(
                                      const FinancialEvent.fetchFinancials());
                                } else {
                                  context
                                      .read<AddBillBloc>()
                                      .add(BillAddBillEvent());
                                  context.read<FinancialBloc>().add(
                                      const FinancialEvent.fetchFinancials());
                                }
                              }
                            },
                          );
                        },
                      ),
                      Gap(10.h),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
