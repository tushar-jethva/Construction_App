// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/data/datasource/site_progress_data_source.dart';
import 'package:construction_mate/data/repository/site_progress_repository.dart';
import 'package:construction_mate/logic/controllers/SiteProgressAgencyUpdate/site_progress_agency_update_bloc.dart';
import 'package:construction_mate/logic/controllers/SiteProgressFloorBloc/site_progress_floors_bloc.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';

import 'package:construction_mate/logic/models/floor_site_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MySiteProgressDetailsWidget extends StatefulWidget {
  final FloorSiteModel floorSiteModel;
  final SiteProgressAgencyUpdateBloc siteProgressAgencyUpdateBloc;
  const MySiteProgressDetailsWidget(
      {Key? key,
      required this.floorSiteModel,
      required this.siteProgressAgencyUpdateBloc})
      : super(key: key);

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
    // TODO: implement initState
    super.initState();
    widget.siteProgressAgencyUpdateBloc.add(
        FetchAlreadySelectedAgencies(floorSiteModel: widget.floorSiteModel));
  }

  @override
  Widget build(BuildContext context) {
    final floor = widget.floorSiteModel;
    return BlocProvider.value(
      value: widget.siteProgressAgencyUpdateBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Floor ${floor.floorIndex.toString()}"),
        ),
        body: BlocBuilder<SiteProgressAgencyUpdateBloc,
            SiteProgressAgencyUpdateState>(
          builder: (context, state) {
            return Column(
              children: [
                Text(
                  "Working agency on floor No. ${floor.floorIndex}",
                  style: TextStyle(fontSize: 15),
                ),
                ListTile(
                  leading: Checkbox(
                    value: state.selectAll,
                    onChanged: (bool? value) {
                      context
                          .read<SiteProgressAgencyUpdateBloc>()
                          .add(ToggleSelectAll());
                    },
                  ),
                  title: const Text('Select All'),
                ),
                !state.isLoading
                    ? state.selectedAgencies.isNotEmpty
                        ? Expanded(
                            child: ListView.builder(
                              itemCount: floor.workStatus!.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Checkbox(
                                    value: state
                                        .selectedAgencies[index].isSelected,
                                    onChanged: (bool? value) {
                                      context
                                          .read<SiteProgressAgencyUpdateBloc>()
                                          .add(ToggleAgencySelection(
                                              index: index));
                                    },
                                  ),
                                  title:
                                      Text(floor.workStatus![index].agencyId!),
                                );
                              },
                            ),
                          )
                        : Text("No agency founds!")
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 15.h),
                  child: MyCustomButton(
                      buttonName: 'Update',
                      color: green,
                      style: TextStyle(color: white),
                      onPressed: () async {
                        final selectedAgencies = context
                            .read<SiteProgressAgencyUpdateBloc>()
                            .state
                            .selectedAgencies;

                        print(selectedAgencies.map((e) => e.agencyId));
                        await siteProgressRepository.siteProgressUpdateAgency(
                            projectId: floor.projectId!,
                            buildingId: floor.buildingId!,
                            workTypeIds: selectedAgencies
                                .map((e) => e.workTypeId!)
                                .toList(),
                            floorIndex: floor.floorIndex.toString());

                        context.pop();
                        // context.read<SiteProgressAgencyUpdateBloc>().add(
                        //     OnUpdateButtonPressed(
                        //         listOfSiteProgresssAgencyUpdate:
                        //             selectedAgencies));
                      }),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
