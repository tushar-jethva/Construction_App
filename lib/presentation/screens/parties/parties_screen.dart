import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/PerBuildingAgency/per_building_agencies_bloc.dart';
import 'package:construction_mate/logic/controllers/TotalAgencies/total_agencies_bloc.dart';
import 'package:construction_mate/presentation/widgets/common/shimmer_box.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/custom_button_widget.dart';
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
  late TotalAgenciesBloc _totalAgenciesBloc;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _totalAgenciesBloc = BlocProvider.of<TotalAgenciesBloc>(context);
    _totalAgenciesBloc.add(LoadTotalAgencies());
  }

  Future<void> _refreshTotalAgencies() async {
    _totalAgenciesBloc.add(LoadTotalAgencies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 30.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Agencies",
                  style: TextStyle(
                      color: black, fontWeight: FontWeight.w500, fontSize: 17),
                ),
                MyCustomButton(
                    buttonName: '+ Add Agency',
                    color: transparent,
                    style: const TextStyle(
                        fontSize: 16,
                        color: purple,
                        fontWeight: FontWeight.bold),
                    onPressed: () {}),
              ],
            ),
          ),
          BlocBuilder<TotalAgenciesBloc, TotalAgenciesState>(
              builder: (context, state) {
            if (state is TotalAgenciesInitial) {
              return Expanded(
                child: Shimmer(
                  gradient: LinearGradient(
                      colors: [baseColor, highlightColor],
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
                              color: greyLight,
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
            if (state is TotalAgenciesLoadSuccess) {
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
                          return InkWell(
                            onTap: () {
                              context.pushNamed(
                                  RoutesName.transactionOfAgencyPartiesScreen,
                                  extra: agency);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15, bottom: 10),
                              child: Container(
                                height: ReusableFunctions.getHeight(
                                    context: context, height: 0.08),
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: greyLight,
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
