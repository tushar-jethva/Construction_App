import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/constants.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/data/datasource/agency_data_source.dart';
import 'package:construction_mate/data/datasource/work_types_source.dart';
import 'package:construction_mate/data/repository/agency_repository.dart';
import 'package:construction_mate/data/repository/work_type_repository.dart';
import 'package:construction_mate/gen/assets.gen.dart';
import 'package:construction_mate/logic/controllers/AgencyWorkTypeSelection/agency_work_types_selection_bloc.dart';
import 'package:construction_mate/logic/controllers/StartAndEndDateBloc/start_and_end_date_bloc.dart';
import 'package:construction_mate/logic/controllers/TotalAgencies/total_agencies_bloc.dart';
import 'package:construction_mate/logic/models/total_agency_model.dart';
import 'package:construction_mate/presentation/screens/project/project_screen.dart';
import 'package:construction_mate/presentation/widgets/common/common_error_and_notfound_widget.dart';
import 'package:construction_mate/presentation/widgets/common/common_icon_circle_widget.dart';
import 'package:construction_mate/presentation/widgets/common/draggable_scrollable_sheet.dart';
import 'package:construction_mate/presentation/widgets/common/shimmer_box.dart';
import 'package:construction_mate/presentation/widgets/parties_screen_widgets/add_agency_bottom_sheet.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      backgroundColor: theme.cardColor,
      body: Stack(
        children: [
          searchWidget(context, theme),
          scrollableSheetWidget(context, theme)
        ],
      ),
    );
  }

  BlocBuilder<TotalAgenciesBloc, TotalAgenciesState> allAgenciesWidget(
      ThemeData theme) {
    return BlocBuilder<TotalAgenciesBloc, TotalAgenciesState>(
      builder: (context, state) {
        if (state is TotalAgenciesInitial) {
          return Shimmer(
            gradient: LinearGradient(
                colors: [theme.hoverColor, theme.cardColor],
                stops: const [0.1, 0.8]),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
          );
        }
        if (state is TotalAgenciesLoadSuccess) {
          return RefreshIndicator(
            onRefresh: _refreshTotalAgencies,
            child: state.totalAgencies.isEmpty
                ? const ErrorAndNotFoundWidget(
                    text: "No agencies found!",
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.totalAgencies.length,
                    itemBuilder: (context, index) {
                      final agency = state.totalAgencies[index];
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<StartAndEndDateBloc>()
                              .add(const StartAndEndDateEvent.initalize());
                          context.pushNamed(
                              RoutesName.transactionOfAgencyPartiesScreen,
                              extra: agency);
                        },
                        child: agenyOneWidget(theme, agency, index),
                      );
                    },
                  ),
          );
        }
        return const ErrorAndNotFoundWidget(
          text: "Something went wrong!",
        );
      },
    );
  }

  Padding agenyOneWidget(ThemeData theme, TotalAgencyModel agency, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              IconCircleWidget(
                radius: 10,
                isSvg: true,
                svgpath: userIcons[index % userIcons.length],
                backgroundColor: theme.cardColor,
              ),
              10.wx,
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      agency.name ?? "",
                      style: theme.textTheme.titleLarge,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(Assets.svg.remaining.path),
                        5.wx,
                        Text(
                          "Remaining: ",
                          style: theme.textTheme.titleMedium
                              ?.copyWith(color: grey, fontSize: 14),
                        ),
                        Text(
                          "₹ ${agency.totalAccount!.startsWith('-') ? agency.totalAccount!.substring(1, agency.totalAccount!.length) : agency.totalAccount.toString()}",
                          style: theme.textTheme.titleLarge?.copyWith(
                              color: agency.totalAccount!.startsWith('-')
                                  ? red
                                  : green,
                              fontSize: 16),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          10.hx,
          const Divider()
        ],
      ),
    );
  }

  Padding addAgencyWidget(ThemeData theme, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 30.h, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CommonButton2(
              buttonName: 'Agency',
              onTap: () {
                openBottomSheet(context: context);
              }),
        ],
      ),
    );
  }

  Padding searchWidget(BuildContext context, ThemeData theme) {
    return Padding(
      padding:
          EdgeInsets.only(top: 15.h, left: 15.w, bottom: 10.h, right: 15.w),
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
          fillColor: theme.scaffoldBackgroundColor,
          filled: true,
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
              borderSide: const BorderSide(color: transparent, width: 1)),
        ),
      ),
    );
  }

  DraggableScrollableSheetCommonComp scrollableSheetWidget(
      BuildContext context, ThemeData theme) {
    return DraggableScrollableSheetCommonComp(
      draggableScrollableController: DraggableScrollableController(),
      stops: const [0.85, 0.98],
      initialSize: 0.85,
      minChildSize: 0.85,
      radius: 20,
      newWidget: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Column(
            children: [
              addAgencyWidget(theme, context),
              Expanded(
                  child: SingleChildScrollView(
                controller: scrollController,
                child: allAgenciesWidget(theme),
              ))
            ],
          ),
        );
      },
    );
  }
}
