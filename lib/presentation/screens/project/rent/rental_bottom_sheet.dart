// ignore_for_file: use_build_context_synchronously

import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/common_toast.dart';
import 'package:construction_mate/core/constants/constants.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/core/constants/lists.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/AddMaterialBloc/add_material_bloc.dart';
import 'package:construction_mate/logic/controllers/DateBloc/date_bloc_bloc.dart';
import 'package:construction_mate/logic/controllers/Material/material_agencies/material_agencies_bloc.dart';
import 'package:construction_mate/logic/controllers/Parties/add_parties/add_parties_bloc.dart';
import 'package:construction_mate/logic/controllers/Rent/add_rent_supplier/add_rent_supplier_bloc.dart';
import 'package:construction_mate/logic/controllers/Rent/add_rental_product/add_rental_product_bloc.dart';
import 'package:construction_mate/logic/controllers/Rent/get_rental_project/get_rental_partie_project_bloc.dart';
import 'package:construction_mate/logic/controllers/Rent/get_rental_suppliers/get_rental_suppliers_bloc.dart';
import 'package:construction_mate/logic/controllers/Rent/rental_by_id/rental_by_partie_id_bloc.dart';
import 'package:construction_mate/logic/models/get_material_model.dart';
import 'package:construction_mate/logic/models/get_rental_model.dart';
import 'package:construction_mate/logic/models/material_model.dart';
import 'package:construction_mate/presentation/widgets/common/common_button.dart';
import 'package:construction_mate/presentation/widgets/common/custom_text_form_field.dart';
import 'package:construction_mate/presentation/widgets/common/drop_down.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/transaction_bottom_widget.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class MyRentalAddBottomSheet extends StatefulWidget {
  final String projectId;
  final RentalModel material;
  final bool? isUpdate;
  const MyRentalAddBottomSheet(
      {super.key,
      required this.projectId,
      required this.material,
      this.isUpdate = false});

  @override
  State<MyRentalAddBottomSheet> createState() => _MyRentalAddBottomSheetState();
}

class _MyRentalAddBottomSheetState extends State<MyRentalAddBottomSheet> {
  //Textform fields
  late final TextEditingController _materialNameController =
      TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _pricePerUnitController = TextEditingController();

  String dropDownValue = unitOfRental[0];

  final _formKeyMaterial = GlobalKey<FormState>();
  Future<void> _selectDate(BuildContext context) async {
    DateTime initialDate = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      context
          .read<DateBlocBloc>()
          .add(DateBlocEvent.onDateChanged(dateTime: pickedDate));

      context.read<AddRentalProductBloc>().add(
          AddRentalProductEvent.onDateChanged(date: pickedDate.toString()));
    }
  }

  @override
  void initState() {
    super.initState();
    widget.isUpdate == true ? setController() : ();
  }

  //Set controller text
  setController() {
    _materialNameController.text = widget.material.name ?? '';
    _quantityController.text = (widget.material.quantity ?? 0).toString();
    _descriptionController.text = widget.material.description ?? '';
    _pricePerUnitController.text =
        (widget.material.priceperunit ?? 0).toString();

    context.read<AddRentalProductBloc>().add(
        AddRentalProductEvent.onDateChanged(
            date: widget.material.date.toString()));
    context.read<AddRentalProductBloc>().add(
        AddRentalProductEvent.onUnitChanged(unit: widget.material.unit ?? ''));
    context.read<AddRentalProductBloc>().add(
        AddRentalProductEvent.onRentalPartyIdChanged(
            rentalPartyId: widget.material.partieId ?? ''));
    context.read<GetRentalSuppliersBloc>().add(
        GetRentalSuppliersEvent.onRentalPartyChanged(
            rentalParty: widget.material.partieId ?? ''));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _materialNameController.dispose();
    _quantityController.dispose();
    _descriptionController.dispose();
    _pricePerUnitController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final material = widget.material;
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final theme = Theme.of(context);
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
              topRight: Radius.circular(15.r),
            ),
          ),
          child: BlocBuilder<AddRentalProductBloc, AddRentalProductState>(
            builder: (context, state) {
              return Column(
                children: [
                  10.hx,
                  BlocListener<AddRentSupplierBloc, AddRentSupplierState>(
                    listener: (context, state) {
                      if (state.state.isLoaded) {
                        context.read<GetRentalSuppliersBloc>().add(
                            const GetRentalSuppliersEvent
                                .fetchRentalSuppliers());
                      }
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          context.read<AddPartiesBloc>().add(
                              const AddPartiesEvent.onPartyTypeChange(
                                  partyType: PartyType.EquipmentSupplier));
                          context
                              .pushNamed(RoutesName.ADD_RENT_PARTY_SCREEN_NAME);
                        },
                        child: Text(
                          "Add Equipment Supplier",
                          style: theme.textTheme.titleMedium?.copyWith(
                              color: purple,
                              decoration: TextDecoration.underline,
                              decorationColor: purple),
                        ),
                      ),
                    ),
                  ),
                  20.hx,
                  Form(
                    key: _formKeyMaterial,
                    child: Column(
                      children: [
                        BlocBuilder<AddRentalProductBloc,
                            AddRentalProductState>(builder: (context, rstate) {
                          return BlocBuilder<GetRentalSuppliersBloc,
                              GetRentalSuppliersState>(
                            builder: (context, state) {
                              return state.state.isLoaded
                                  ? PaymentOutCustomDropDown(
                                      value: widget.isUpdate == true
                                          ? rstate.rentalPartyId
                                          : state.listOfRentalAgencies[0].sId,
                                      list: state.listOfRentalAgencies
                                          .map((e) => DropdownMenuItem(
                                                value: e.sId,
                                                child: SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.4, // Set a specific width here
                                                  child: Text(
                                                    e.name!,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                      onChanged: (val) {
                                        val != state.listOfRentalAgencies[0].sId
                                            ? context
                                                .read<GetRentalSuppliersBloc>()
                                                .add(GetRentalSuppliersEvent
                                                    .onRentalPartyChanged(
                                                        rentalParty: val))
                                            : {};
                                      },
                                      // ignore: body_might_complete_normally_nullable
                                      validator: (val) {
                                        if (val ==
                                            state.listOfRentalAgencies[0].sId) {
                                          return 'Please select one of the agency!';
                                        }
                                      },
                                    )
                                  : CustomDropDown(items: nameOfAgency);
                            },
                          );
                        }),
                        15.hx,
                        CustomDropDown(
                          initialValue:
                              widget.isUpdate == true ? state.unit : null,
                          items: unitOfRental,
                          onChanged: (val) {
                            context.read<AddRentalProductBloc>().add(
                                AddRentalProductEvent.onUnitChanged(
                                    unit: val ?? ""));
                          },
                        ),
                        15.hx,
                        MyCustomTextFormField(
                          controller: _materialNameController,
                          hintText: 'Rental Name',
                          maxLines: 1,
                          textInputType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (!ReusableFunctions.isValidInput(value ?? '')) {
                              return 'Enter rental name';
                            }
                          },
                        ),
                        15.hx,
                        MyCustomTextFormField(
                          controller: _quantityController,
                          hintText: 'Project Quantity',
                          maxLines: 1,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Enter project quantity';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Please enter valid digit!';
                            }
                            if (value.startsWith('-')) {
                              return 'Please enter valid digit!';
                            }
                          },
                        ),
                        15.hx,
                        MyCustomTextFormField(
                          controller: _pricePerUnitController,
                          hintText: 'Price Per Unit',
                          maxLines: 1,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Enter project quantity';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Please enter valid digit!';
                            }
                            if (value.startsWith('-')) {
                              return 'Please enter valid digit!';
                            }
                          },
                        ),
                        15.hx,
                        MyCustomTextFormField(
                          controller: _descriptionController,
                          hintText: 'Project Description',
                          maxLines: 3,
                          textInputType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (!ReusableFunctions.isValidInput(value ?? '')) {
                              return 'Enter destination';
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Gap(15.h),
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
                          Text(
                              "Date: ${ReusableFunctions.getFormattedDate(state.date)}"),
                          Icon(
                            Icons.calendar_month,
                            color: theme.canvasColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(20.h),
                  BlocListener<AddRentalProductBloc, AddRentalProductState>(
                    listener: (context, state) {
                      if (state.state.isLoaded) {
                        // context.read<AddRentalProductBloc>().add(
                        //     AddRentalProductEvent.fetchAllRental(
                        //         projectId: widget.projectId));

                        context.read<RentalByPartieIdBloc>().add(
                            RentalByPartieIdEvent.getRentalByPartie(
                                partieId: widget.material.partieId ?? ''));

                        context.read<GetRentalPartieProjectBloc>().add(
                            GetRentalPartieProjectEvent.fetchRentalParties(
                                projectId: widget.projectId));

                        context.pop();
                      }
                    },
                    child: BlocBuilder<AddRentalProductBloc,
                        AddRentalProductState>(
                      builder: (context, state) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: CustomElevatedButton(
                            isLoading: state.state.isLoading,
                            label:
                                widget.isUpdate == true ? 'Update' : 'Add Rent',
                            onTap: () async {
                              if (!_formKeyMaterial.currentState!.validate()) {
                              } else if (int.parse(_quantityController.text) <=
                                  0) {
                                showTopSnackBar(context, "Enter valid quantity",
                                    messageType: MessageType.warning);
                              } else {
                                debugPrint(
                                    "============== id: ${material.partieId} ==========");
                                context.read<AddRentalProductBloc>().add(
                                    AddRentalProductEvent.onAddRental(
                                        rentalProductId: material.sId ?? "",
                                        rentalPartyId: material.partieId ?? "",
                                        isUpdate: widget.isUpdate ?? false,
                                        projectId: widget.projectId,
                                        materialName:
                                            _materialNameController.text,
                                        quantity: _quantityController.text,
                                        pricePerUnit:
                                            _pricePerUnitController.text,
                                        description:
                                            _descriptionController.text));
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  20.hx,
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

List<String> unitOfRental = ["-- Select Unit --", "Hours", "Minutes"];
