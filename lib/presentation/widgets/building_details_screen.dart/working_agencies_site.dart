import 'dart:math';

import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/constants.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/SiteProgressAgencyUpdate/site_progress_agency_update_bloc.dart';
import 'package:construction_mate/logic/models/floor_site_model.dart';
import 'package:construction_mate/presentation/widgets/common/common_button.dart';
import 'package:construction_mate/presentation/widgets/common/common_error_and_notfound_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class WorkingAgenciesSite extends StatelessWidget {
  final FloorSiteModel floor;
  const WorkingAgenciesSite({super.key, required this.floor});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return allAgenciesSection(floor, theme);
  }

  Widget updateButton(FloorSiteModel floor) {
    return BlocListener<SiteProgressAgencyUpdateBloc,
        SiteProgressAgencyUpdateState>(
      listener: (context, state) {
        if (state is SiteProgressAgencyUpdateSuccessState) {
          // Navigator.pop(context);
          showTopSnackBar(context, "Agency updated successfully");

          context.read<SiteProgressAgencyUpdateBloc>().add(
              FetchAlreadySelectedAgencies(
                  projectId: floor.projectId!,
                  buildingId: floor.buildingId!,
                  floorIndex: floor.floorName.toString()));

          context.pop();
        }
      },
      child: BlocBuilder<SiteProgressAgencyUpdateBloc,
          SiteProgressAgencyUpdateState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: CustomElevatedButton(
              isLoading: state.isLoading,
              label: 'Update',
              onTap: () {
                final currentSelectedAgencies = context
                    .read<SiteProgressAgencyUpdateBloc>()
                    .state
                    .currentSelectedAgencies
                    .where((element) => element.isSelected! == true)
                    .toList();
                if (currentSelectedAgencies.isNotEmpty) {
                  context
                      .read<SiteProgressAgencyUpdateBloc>()
                      .add(OnUpdateButtonPressed(floor: floor));
                }
              },
            ),
          );
        },
      ),
    );
  }

  BlocBuilder<SiteProgressAgencyUpdateBloc, SiteProgressAgencyUpdateState>
      allAgenciesSection(FloorSiteModel floor, ThemeData theme) {
    return BlocBuilder<SiteProgressAgencyUpdateBloc,
        SiteProgressAgencyUpdateState>(
      builder: (context, state) {
        final selectedLen =
            state.selectedAgencies.where((s) => s.isSelected ?? false).toList();
        return !state.isLoading
            ? selectedLen.length != state.selectedAgencies.length
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Checkbox(
                          side: const BorderSide(color: grey),
                          value: state.selectAll,
                          activeColor: purple,
                          onChanged: (bool? value) {
                            context
                                .read<SiteProgressAgencyUpdateBloc>()
                                .add(ToggleSelectAll());
                          },
                        ),
                        title: Text(
                          'Select All',
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: floor.workStatus?.length ?? 0,
                          itemBuilder: (context, index) {
                            return state.selectedAgencies[index].isSelected ??
                                    false
                                ? const SizedBox.shrink()
                                : ListTile(
                                    leading: Checkbox(
                                      side: const BorderSide(color: grey),
                                      value: state
                                          .currentSelectedAgencies[index]
                                          .isSelected,
                                      activeColor: purple,
                                      onChanged: (bool? value) {
                                        context
                                            .read<
                                                SiteProgressAgencyUpdateBloc>()
                                            .add(ToggleAgencySelection(
                                                index: index));
                                      },
                                    ),
                                    title: Text(
                                      floor.workStatus![index].workTypeName!,
                                      style: theme.textTheme.titleMedium,
                                    ),
                                    trailing: Text(
                                      state.currentSelectedAgencies[index]
                                              .agencyName ??
                                          '',
                                      style: theme.textTheme.titleLarge
                                          ?.copyWith(fontSize: 16),
                                    ),
                                  );
                          },
                        ),
                      ),
                      updateButton(floor)
                    ],
                  )
                : const ErrorAndNotFoundWidget(text: 'No working agency found!')
            : SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Center(
                  child: ReusableFunctions.loader(),
                ),
              );
      },
    );
  }
}
