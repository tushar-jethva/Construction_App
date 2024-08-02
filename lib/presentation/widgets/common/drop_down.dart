import 'package:construction_mate/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({super.key, required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DropdownButtonFormField(
      dropdownColor: theme.scaffoldBackgroundColor,
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
          borderSide:  BorderSide(color: purple),
        ),
      ),
      value: items[0],
      items: items
          .map((e) => DropdownMenuItem(
                value: e,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.4, // Set a specific width here
                  child: Text(
                    e,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ))
          .toList(),
      onChanged: (val) {},
      validator: (value) {
        if (value == items[0]) {
          return 'Please select one of the names!';
        }
      },
    );
  }
}
