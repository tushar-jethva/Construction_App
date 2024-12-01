// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/data/datasource/site_progress_data_source.dart';
import 'package:construction_mate/data/repository/site_progress_repository.dart';
import 'package:construction_mate/logic/controllers/SiteProgressAgencyUpdate/site_progress_agency_update_bloc.dart';
import 'package:construction_mate/presentation/widgets/common/common_button.dart';
import 'package:construction_mate/presentation/widgets/common/custom_button_with_widget.dart';
import 'package:flutter/material.dart';
import 'package:construction_mate/logic/models/floor_site_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MySiteProgressDetailsWidget extends StatefulWidget {
  final FloorSiteModel floorSiteModel;
  const MySiteProgressDetailsWidget({
    super.key,
    required this.floorSiteModel,
  });

  @override
  State<MySiteProgressDetailsWidget> createState() =>
      _MySiteProgressDetailsWidgetState();
}

class _MySiteProgressDetailsWidgetState
    extends State<MySiteProgressDetailsWidget> {
  final SiteProgressRepository siteProgressRepository =
      SiteProgressRepositoryImpl(
          siteProgressDataSource: SiteProgressDataSourceImpl());
  @override
  void initState() {
    super.initState();
    context.read<SiteProgressAgencyUpdateBloc>().add(
        FetchAlreadySelectedAgencies(
            projectId: widget.floorSiteModel.projectId!,
            buildingId: widget.floorSiteModel.buildingId!,
            floorIndex: widget.floorSiteModel.floorName.toString()));
  }

  @override
  Widget build(BuildContext context) {
    final floor = widget.floorSiteModel;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: theme.canvasColor),
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Text(
          floor.floorName.toString(),
          style: theme.textTheme.titleMedium!.copyWith(fontSize: 20),
        ),
      ),
      body: BlocBuilder<SiteProgressAgencyUpdateBloc,
          SiteProgressAgencyUpdateState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Working agency on ${floor.floorName}",
                style: const TextStyle(fontSize: 15),
              ),
              ListTile(
                leading: Checkbox(
                  side: const BorderSide(color: grey),
                  value: state.selectAll,
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
              !state.isLoading
                  ? state.selectedAgencies.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                            itemCount: floor.workStatus!.length,
                            itemBuilder: (context, index) {
                              return state.selectedAgencies[index].isSelected!
                                  ? Text(
                                      "${state.selectedAgencies[index].agencyName} task is Already completed!")
                                  : ListTile(
                                      leading: Checkbox(
                                        side: const BorderSide(color: grey),
                                        value: state
                                            .currentSelectedAgencies[index]
                                            .isSelected,
                                        onChanged: (bool? value) {
                                          context
                                              .read<
                                                  SiteProgressAgencyUpdateBloc>()
                                              .add(ToggleAgencySelection(
                                                  index: index));
                                        },
                                      ),
                                      title: Text(
                                        floor.workStatus![index].agencyName!,
                                        style: theme.textTheme.titleMedium,
                                      ),
                                    );
                            },
                          ),
                        )
                      : const Text("No agency founds!")
                  : Center(
                      child: ReusableFunctions.loader(),
                    ),
              BlocListener<SiteProgressAgencyUpdateBloc,
                  SiteProgressAgencyUpdateState>(
                listener: (context, state) {
                  if (state is SiteProgressAgencyUpdateSuccessState) {
                    Navigator.pop(context);
                    ReusableFunctions.showSnackBar(
                        context: context,
                        content: "Agency updated successfully!");
                  }
                },
                child: BlocBuilder<SiteProgressAgencyUpdateBloc,
                    SiteProgressAgencyUpdateState>(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: CustomElevatedButton(
                        isLoading:
                            state is SiteProgressAgencyUpdateLoadingState,
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
              ),
            ],
          );
        },
      ),
    );
  }
}
