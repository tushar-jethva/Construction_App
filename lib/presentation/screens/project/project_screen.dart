import 'package:construction_mate/presentation/widgets/homescreen_widgets/all_projects_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/home_screen_app_bar.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/transaction_bottom_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/transaction_top_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* Created By: Tushar Jethva
*/
class MyProjectScreen extends StatefulWidget {
  const MyProjectScreen({super.key});

  @override
  State<MyProjectScreen> createState() => _MyProjectScreenState();
}

class _MyProjectScreenState extends State<MyProjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 40.h,
                floating: true,
                surfaceTintColor: Colors.transparent,
                flexibleSpace: const MyHomeScreenAppBar(),
              ),
              const TransactionTopWidget(),
              const AllProjectsWidget(),
              SliverToBoxAdapter(
                child: SizedBox(height: 50.h), // Spacer for bottom bar
              ),
            ],
          ),
          TransactionBottomWidget(),
        ],
      ),
    );
  }
}
