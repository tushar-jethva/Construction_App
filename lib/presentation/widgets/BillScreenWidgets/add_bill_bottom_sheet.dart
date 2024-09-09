import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/AddBillBloc/add_bill_bloc.dart';
import 'package:construction_mate/logic/models/bill_item_model.dart';
import 'package:construction_mate/presentation/widgets/common/custom_text_form_field.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/custom_button_widget.dart';
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
    return Padding(
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
              Container(
                height: 5.w,
                width: 50.w,
                margin: EdgeInsets.symmetric(vertical: 15.h),
                decoration: BoxDecoration(
                    color: grey, borderRadius: BorderRadius.circular(8)),
              ),
              BlocBuilder<AddBillBloc, AddBillState>(
                builder: (context, state) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.billItems.length,
                    itemBuilder: (context, index) {
                      return Container(
                        color: black,
                        child: Text(state.billItems[index].HSNCode),
                      );
                    },
                  );
                },
              ),
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
                            style: TextStyle(),
                            onPressed: () {
                              if (_innerItemFormKey.currentState!.validate()) {
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
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    Gap(10.h),
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
                                      sgst:
                                          double.parse(_sgstController.text)));
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
                                      cgst:
                                          double.parse(_cgstController.text)));
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
                                      tds: double.parse(_tdsController.text)));
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
                    MyCustomButton(
                      buttonName: "Add Bill",
                      color: green,
                      style: theme.textTheme.titleMedium!,
                      onPressed: () {
                        if (_billFormKey.currentState!.validate()) {
                          print("Outer Done");
                        }
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
    );
  }
}
