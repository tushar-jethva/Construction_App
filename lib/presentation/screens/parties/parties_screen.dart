import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/data/datasource/agency_data_source.dart';
import 'package:construction_mate/data/datasource/work_types_source.dart';
import 'package:construction_mate/data/repository/agency_repository.dart';
import 'package:construction_mate/data/repository/work_type_repository.dart';
import 'package:construction_mate/logic/controllers/AgencyWorkTypeSelection/agency_work_types_selection_bloc.dart';
import 'package:construction_mate/logic/controllers/TotalAgencies/total_agencies_bloc.dart';
import 'package:construction_mate/presentation/widgets/common/shimmer_box.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/custom_button_widget.dart';
import 'package:construction_mate/presentation/widgets/parties_screen_widgets/add_agency_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class MyPartiesScreen extends StatefulWidget {
  const MyPartiesScreen({super.key});

  @override
  State<MyPartiesScreen> createState() => _MyPartiesScreenState();
}

class _MyPartiesScreenState extends State<MyPartiesScreen> {
  final TextEditingController _searchController = TextEditingController();

  late TotalAgenciesBloc _totalAgenciesBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _totalAgenciesBloc = BlocProvider.of<TotalAgenciesBloc>(context);
    _totalAgenciesBloc.add(LoadTotalAgencies());
  }

  Future<void> _refreshTotalAgencies() async {
    _searchController.text.isEmpty
        ? _totalAgenciesBloc.add(LoadTotalAgencies())
        : _totalAgenciesBloc.add(
            FetchTransactionByQueryTotalAgency(query: _searchController.text));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
  }

  openBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
        isScrollControlled: true,
        showDragHandle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return BlocProvider(
            create: (context) => AgencyWorkTypesSelectionBloc(
                agencyRepository: AgencyRepositoryImpl(
                    agencyDataSource: AgencyDataSourceDataSourceImpl()),
                workTypesRepository:
                    WorkTypesRepositoryImpl(WorkTypesDataSourceImpl())),
            child: const MyAddAgencyBottomSheetParties(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 30.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Agencies",
                  style: theme.textTheme.bodyMedium!.copyWith(fontSize: 17),
                ),
                MyCustomButton(
                    buttonName: '+ Add Agency',
                    color: transparent,
                    style: theme.textTheme.titleLarge!
                        .copyWith(color: purple, fontSize: 16),
                    onPressed: () {
                      openBottomSheet(context: context);
                    }),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 15.h, left: 15.w, bottom: 10.h, right: 15.w),
            child: TextField(
              controller: _searchController,
              maxLines: 1,
              onChanged: (value) {
                context.read<TotalAgenciesBloc>().add(
                    FetchTransactionByQueryTotalAgency(
                        query: _searchController.text));
              },
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              style: theme.textTheme.titleMedium,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: theme.canvasColor,
                ),
                hintStyle: theme.textTheme.titleMedium!.copyWith(color: grey),
                hintText: 'Search transactions',
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
          BlocBuilder<TotalAgenciesBloc, TotalAgenciesState>(
            builder: (context, state) {
              if (state is TotalAgenciesInitial) {
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
              if (state is TotalAgenciesLoadSuccess) {
                return Expanded(
                  child: RefreshIndicator(
                    onRefresh: _refreshTotalAgencies,
                    child: state.totalAgencies.isEmpty
                        ? Center(
                            child: Text(
                              'No agencies found!',
                              style: theme.textTheme.titleMedium,
                            ),
                          )
                        : ListView.builder(
                            itemCount: state.totalAgencies.length,
                            itemBuilder: (context, index) {
                              final agency = state.totalAgencies[index];
                              return GestureDetector(
                                onTap: () {
                                  context.pushNamed(
                                      RoutesName
                                          .transactionOfAgencyPartiesScreen,
                                      extra: agency);
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
                                        Text(
                                          agency.name!,
                                          style: theme.textTheme.titleMedium,
                                        ),
                                        Text(
                                          agency.totalAccount!.startsWith('-')
                                              ? agency.totalAccount!.substring(
                                                  1,
                                                  agency.totalAccount!.length)
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
                            },
                          ),
                  ),
                );
              }
              return const Expanded(
                child: Center(
                  child: Text("Something went wrong!"),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
