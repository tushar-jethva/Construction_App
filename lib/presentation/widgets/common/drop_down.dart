import 'package:construction_mate/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown(
      {super.key, required this.items, this.onChanged, this.initialValue, this.validator});

  final List<String> items;
  final Function(String?)? onChanged;
  final String? initialValue;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DropdownButtonFormField(
      dropdownColor: theme.scaffoldBackgroundColor,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(7),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: purple),
        ),
      ),
      value: initialValue ?? items[0],
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
                    style: theme.textTheme.titleMedium,
                  ),
                ),
              ))
          .toList(),
      onChanged: onChanged,
      // ignore: body_might_complete_normally_nullable
      validator: validator,
    );
  }
}
