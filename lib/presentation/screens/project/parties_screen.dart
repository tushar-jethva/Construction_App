// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/AgencyWorkingInProject/agency_works_projects_bloc.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:construction_mate/presentation/widgets/common/shimmer_box.dart';

class MyPartiesProjectScreen extends StatefulWidget {
  final ProjectModel project;
  const MyPartiesProjectScreen({
    super.key,
    required this.project,
  });

  @override
  State<MyPartiesProjectScreen> createState() => _MyPartiesProjectScreenState();
}

class _MyPartiesProjectScreenState extends State<MyPartiesProjectScreen> {
  final TextEditingController _searchController = TextEditingController();

  late AgencyWorksProjectsBloc _totalAgenciesProjectBloc;

  @override
  void initState() {
    super.initState();
    _totalAgenciesProjectBloc =
        BlocProvider.of<AgencyWorksProjectsBloc>(context);
    _totalAgenciesProjectBloc
        .add(LoadTotalProjectAgencies(projectId: widget.project.sId!));
  }

  Future<void> _refreshTotalAgencies() async {
    _searchController.text.isEmpty
        ? _totalAgenciesProjectBloc
            .add(LoadTotalProjectAgencies(projectId: widget.project.sId!))
        : _totalAgenciesProjectBloc.add(FetchTransactionByQueryProjectAgency(
            query: _searchController.text));
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: 15.h, left: 15.w, bottom: 10.h, right: 15.w),
            child: TextField(
              controller: _searchController,
              maxLines: 1,
              onChanged: (value) {
                context.read<AgencyWorksProjectsBloc>().add(
                    FetchTransactionByQueryProjectAgency(
                        query: _searchController.text));
              },
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              style: theme.textTheme.titleMedium,
              decoration: InputDecoration(
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
                    borderSide: const BorderSide(color: grey, width: 1)),
              ),
            ),
          ),
          BlocBuilder<AgencyWorksProjectsBloc, AgencyWorksProjectsState>(
              builder: (context, state) {
            if (state is AgencyWorksProjectsInitial) {
              return Expanded(
                child: Shimmer(
                  gradient: LinearGradient(
                      colors: [theme.hoverColor, theme.cardColor],
                      stops: const [0.1, 0.8]),
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15, bottom: 10),
                          child: Container(
                            height: ReusableFunctions.getHeight(
                                context: context, height: 0.08),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: theme.cardColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ShimmerBox(height: 10, width: 150),
                                ShimmerBox(height: 10, width: 50)
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              );
            }
            if (state is AgencyWorksProjectsSuccess) {
              return Expanded(
                  child: RefreshIndicator(
                onRefresh: _refreshTotalAgencies,
                child: state.totalAgencies.isEmpty
                    ? const Center(
                        child: Text('No agencies found!'),
                      )
                    : ListView.builder(
                        itemCount: state.totalAgencies.length,
                        itemBuilder: (context, index) {
                          final agency = state.totalAgencies[index];
                          return GestureDetector(
                            onTap: () {
                              context.push(
                                  RoutesName.transactionIndividualScreen,
                                  extra: {
                                    "agencyId": agency.sId,
                                    "projectId": widget.project.sId,
                                    "agencyName": agency.name
                                  });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15, bottom: 10),
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: theme.cardColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(agency.name!),
                                    Text(
                                      agency.totalAccount!.startsWith('-')
                                          ? agency.totalAccount!.substring(
                                              1, agency.totalAccount!.length)
                                          : agency.totalAccount.toString(),
                                      style: TextStyle(
                                          color: agency.totalAccount!
                                                  .startsWith('-')
                                              ? red
                                              : green),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
              ));
            }
            return const Expanded(
                child: Center(
              child: Text("Something went wrong!"),
            ));
          })
        ],
      ),
    );
  }
}
