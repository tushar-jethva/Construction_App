import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/AddMaterialBloc/add_material_bloc.dart';
import 'package:construction_mate/logic/controllers/DateBloc/date_bloc_bloc.dart';
import 'package:construction_mate/logic/controllers/ProjectListBloc/project_bloc.dart';
import 'package:construction_mate/logic/controllers/TotalPaymentOutBloc/total_payment_out_bloc.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/add_material_bottom_sheet.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/all_projects_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/home_screen_app_bar.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/project_add_bottom_sheet_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/transaction_bottom_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/transaction_top_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* Created By: Tushar Jethva
*/
class MyProjectScreen extends StatefulWidget {
  const MyProjectScreen({super.key});

  @override
  State<MyProjectScreen> createState() => _MyProjectScreenState();
}

class _MyProjectScreenState extends State<MyProjectScreen> {
  late ProjectBloc _projectBloc;
  late TotalPaymentOutBloc _totalPaymentOutBloc;

  @override
  void initState() {
    super.initState();
    _projectBloc = BlocProvider.of<ProjectBloc>(context);
    _totalPaymentOutBloc = BlocProvider.of<TotalPaymentOutBloc>(context);
    _totalPaymentOutBloc.add(FetchTotalPaymentOut());
    _projectBloc.add(LoadProjects());
  }

  Future<void> _refreshProjects() async {
    _projectBloc.add(LoadProjects());
    _totalPaymentOutBloc.add(FetchTotalPaymentOut());
  }

  openBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
        isScrollControlled: true,
        showDragHandle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return const MyProjectAddBottomSheet();
        });
  }

  openBottomSheetOfMaterial({required BuildContext context}) {
    showModalBottomSheet(
        isScrollControlled: true,
        showDragHandle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return BlocProvider(
            create: (context) => DateBlocBloc(),
            child: const MyMaterialAddBottomSheet(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: _refreshProjects,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  surfaceTintColor: Colors.transparent,
                  backgroundColor: theme.scaffoldBackgroundColor,
                  flexibleSpace: const MyHomeScreenAppBar(),
                ),
                const TransactionTopWidget(),
                SliverAppBar(
                  toolbarHeight: ReusableFunctions.getHeight(
                      context: context, height: 0.015),
                  surfaceTintColor: Colors.transparent,
                  pinned: true,
                  backgroundColor: theme.scaffoldBackgroundColor,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Text("All Projects",
                        //     style: theme.textTheme.titleLarge!
                        //         .copyWith(fontSize: 18)),
                        TextButton(
                            onPressed: () {
                              context
                                  .read<AddMaterialBloc>()
                                  .add(AddMaterialEvent());
                              openBottomSheetOfMaterial(context: context);
                            },
                            child: Text(
                              "+ Add Material",
                              style: theme.textTheme.titleLarge!
                                  .copyWith(color: purple, fontSize: 16.5),
                            )),
                        TextButton(
                            onPressed: () {
                              openBottomSheet(context: context);
                            },
                            child: Text(
                              "+ Add Project",
                              style: theme.textTheme.titleLarge!
                                  .copyWith(color: purple, fontSize: 16.5),
                            ))
                      ],
                    ),
                  ),
                ),
                const AllProjectsWidget(),
                SliverToBoxAdapter(
                  child: SizedBox(height: 50.h), // Spacer for bottom bar
                ),
              ],
            ),
          ),
          const TransactionBottomWidget(),
        ],
      ),
    );
  }
}
