// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:construction_mate/core/constants/constants.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/logic/models/total_agency_model.dart';
import 'package:construction_mate/presentation/widgets/common/common_icon_circle_widget.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/logic/controllers/AgencyWorkingInProject/agency_works_projects_bloc.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyPartiesProjectScreen extends StatefulWidget {
  final ProjectModel project;
  final ScrollController scrollController;
  const MyPartiesProjectScreen(
      {super.key, required this.project, required this.scrollController});

  @override
  State<MyPartiesProjectScreen> createState() => _MyPartiesProjectScreenState();
}

class _MyPartiesProjectScreenState extends State<MyPartiesProjectScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // context.read<AgencyWorksProjectsBloc>().add(
    //     AgencyWorksProjectsEvent.fetchAgencies(projectId: widget.project.sId!));
  }

  Future<void> _refreshTotalAgencies() async {
    final query = context.read<AgencyWorksProjectsBloc>().state.query;
    if (query.isNotEmpty) {
      context
          .read<AgencyWorksProjectsBloc>()
          .add(AgencyWorksProjectsEvent.onQueryChanged(query: query));
    } else {
      context.read<AgencyWorksProjectsBloc>().add(
          AgencyWorksProjectsEvent.fetchAgencies(
              projectId: widget.project.sId!));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<AgencyWorksProjectsBloc, AgencyWorksProjectsState>(
        builder: (context, state) {
      if (state.state.isLoading) {
        return Skeletonizer(
          enabled: true,
          child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return agencyWidget(
                    theme,
                    TotalAgencyModel(name: "Agency", totalAccount: "1000"),
                    index);
              }),
        );
      }
      if (state.state.isLoaded) {
        return RefreshIndicator(
          onRefresh: _refreshTotalAgencies,
          color: purple,
          child: state.totalAgencies.isEmpty
              ? SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: const Center(
                        child: Text("No agencies found!"),
                      ),
                    ),
                  ),
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height * 0.73,
                  child: ListView.builder(
                      itemCount: state.totalAgencies.length,
                      // primary: false,
                      controller: widget.scrollController, 
                      // physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final agency = state.totalAgencies[index];
                        return agencyWidget(theme, agency, index);
                      }),
                ),
        );
      }
      return const SizedBox(
          height: 500,
          child: Center(
            child: Text("Something went wrong!"),
          ));
    });
  }

  Widget agencyWidget(ThemeData theme, TotalAgencyModel agency, int index) {
    return GestureDetector(
      onTap: () {
        context.push(RoutesName.transactionIndividualScreen, extra: {
          "agencyId": agency.sId,
          "projectId": widget.project.sId,
          "agencyName": agency.name
        });
      },
      child: Padding(
        padding:
            const EdgeInsets.only(left: 15.0, right: 15, bottom: 10, top: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconCircleWidget(
                      radius: 10,
                      isSvg: true,
                      svgpath: userIcons[index % userIcons.length],
                      backgroundColor: theme.cardColor,
                    ),
                    10.wx,
                    Text(
                      agency.name ?? "",
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Text(
                  agency.totalAccount!.startsWith('-')
                      ? "₹ ${agency.totalAccount!.substring(1, agency.totalAccount!.length)}"
                      : "₹ ${agency.totalAccount ?? 0}",
                  style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: 16,
                      color:
                          agency.totalAccount!.startsWith('-') ? red : green),
                )
              ],
            ),
            5.hx,
            const Divider()
          ],
        ),
      ),
    );
  }
}
