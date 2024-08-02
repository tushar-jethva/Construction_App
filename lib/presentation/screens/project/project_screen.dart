import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/logic/controllers/ProjectListBloc/project_bloc.dart';
import 'package:construction_mate/logic/controllers/TotalPaymentOutBloc/total_payment_out_bloc.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/all_projects_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/home_screen_app_bar.dart';
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
    // TODO: implement initState
    super.initState();
    _projectBloc = BlocProvider.of<ProjectBloc>(context);
    _totalPaymentOutBloc = BlocProvider.of<TotalPaymentOutBloc>(context);
    _totalPaymentOutBloc.add(FetchTotalPaymentOut());
    _projectBloc.add(LoadProjects());
  }

  Future<void> _refreshProjects() async {
    _projectBloc.add(LoadProjects());
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
                  expandedHeight: 40.h,
                  floating: true,
                  surfaceTintColor: Colors.transparent,
                  backgroundColor: theme.scaffoldBackgroundColor,
                  flexibleSpace: const MyHomeScreenAppBar(),
                ),
                const TransactionTopWidget(),
                SliverAppBar(
                  toolbarHeight: 20,
                  surfaceTintColor: Colors.transparent,
                  pinned: true,
                  backgroundColor: theme.scaffoldBackgroundColor,
                  flexibleSpace: Padding(
                    padding: EdgeInsets.only(left: 8.w, top: 12.h),
                    child: Row(
                      children: [
                        Text("All Projects",
                            style: theme.textTheme.titleLarge!
                                .copyWith(fontSize: 18)),
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
