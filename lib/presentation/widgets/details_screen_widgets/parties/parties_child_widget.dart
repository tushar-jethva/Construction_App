import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/logic/controllers/AgencyWorkingInProject/agency_works_projects_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PartiesChildWidget extends StatefulWidget {
  const PartiesChildWidget({super.key});

  @override
  State<PartiesChildWidget> createState() => _PartiesChildWidgetState();
}

class _PartiesChildWidgetState extends State<PartiesChildWidget> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(top: 15.h, bottom: 10.h),
      child: TextField(
        controller: _searchController,
        maxLines: 1,
        onChanged: (value) {
          context.read<AgencyWorksProjectsBloc>().add(
              AgencyWorksProjectsEvent.onQueryChanged(
                  query: _searchController.text));
        },
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        style: theme.textTheme.titleMedium,
        decoration: InputDecoration(
          fillColor: theme.scaffoldBackgroundColor,
          filled: true,
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: grey,
          ),
          hintText: 'Search transactions',
          hintStyle: theme.textTheme.titleMedium!.copyWith(color: grey),
          contentPadding: EdgeInsets.symmetric(vertical: 5.h),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: grey, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: transparent, width: 1)),
        ),
      ),
    );
  }
}
