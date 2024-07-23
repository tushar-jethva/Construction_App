// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/logic/models/work_type_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:construction_mate/logic/controllers/AddAgencyDropDowns/add_agency_drop_downs_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDropDownFormField extends StatelessWidget {
  final List<WorkTypeModel> items;
  final Function(String val) event;
  const MyDropDownFormField({
    super.key,
    required this.items,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(7),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10.r,
          ),
          borderSide: const BorderSide(color: grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            5.r,
          ),
          borderSide: const BorderSide(color: grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10.r,
          ),
          borderSide: const BorderSide(color: purple),
        ),
      ),
      value: items[0].sId,
      items: items
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
        context.read<AddAgencyDropDownsBloc>().add(event(val.toString()));
      },
      validator: (value) {
        if (value == items[0].sId) {
          return 'Please select one of the names!';
        }
      },
    );
  }
}
