import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/SiteProgressAgencyUpdate/site_progress_agency_update_bloc.dart';
import 'package:construction_mate/logic/models/floor_site_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompletedAgencies extends StatelessWidget {
  final FloorSiteModel floor;
  const CompletedAgencies({super.key, required this.floor});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return allAgenciesSection(floor, theme);
  }

  BlocBuilder<SiteProgressAgencyUpdateBloc, SiteProgressAgencyUpdateState>
      allAgenciesSection(FloorSiteModel floor, ThemeData theme) {
    return BlocBuilder<SiteProgressAgencyUpdateBloc,
        SiteProgressAgencyUpdateState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            !state.isLoading
                ? state.selectedAgencies.isNotEmpty
                    ? ListView.builder(
                        itemCount: state.selectedAgencies.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return state.selectedAgencies[index].isSelected!
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    horizontalTitleGap: 0,
                                    leading: Checkbox(
                                      value: true,
                                      onChanged: (val) {
                                        // context
                                        //     .read<
                                        //         SiteProgressAgencyUpdateBloc>()
                                        //     .add(ToggleAgencySelection(
                                        //         index: index));
                                      },
                                      activeColor: purple,
                                    ),
                                    title: Text(
                                      "${state.selectedAgencies[index].workTypeName}",
                                      style: theme.textTheme.titleLarge
                                          ?.copyWith(fontSize: 18),
                                    ),
                                    trailing: Text(
                                      "${state.selectedAgencies[index].agencyName}",
                                      style: theme.textTheme.titleLarge
                                          ?.copyWith(fontSize: 18),
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink();
                        },
                      )
                    : const Text("No agency founds!")
                : SizedBox(
                    height: 100,
                    child: Center(
                      child: ReusableFunctions.loader(),
                    ),
                  ),
          ],
        );
      },
    );
  }
}
