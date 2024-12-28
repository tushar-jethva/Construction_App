import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/logic/controllers/Gst/gst_bloc.dart';
import 'package:construction_mate/logic/controllers/ProjectListBloc/project_bloc.dart';
import 'package:construction_mate/logic/controllers/TotalPaymentOutBloc/total_payment_out_bloc.dart';
import 'package:construction_mate/logic/controllers/OtherExpenseBloc/other_expense_bloc.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:construction_mate/presentation/widgets/common/common_icon_circle_widget.dart';
import 'package:construction_mate/presentation/widgets/common/draggable_scrollable_sheet.dart';
import 'package:construction_mate/presentation/widgets/common/transaction_total_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/all_projects_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/home_screen_app_bar.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/project_add_bottom_sheet_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/transaction_bottom_widget.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/controllers/Tds/tds_bloc.dart';

/* Created By: Tushar Jethva
*/
class MyProjectScreen extends StatefulWidget {
  final Function()? onTapProfile;
  const MyProjectScreen({super.key, required this.onTapProfile});

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
    context.read<TdsBloc>().add(const TdsEvent.fetchTds());
    context.read<GstBloc>().add(const GstEvent.fetchGst());
    context
        .read<OtherExpenseBloc>()
        .add(const OtherExpenseEvent.fetchOtherExpenses());
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
          return MyProjectAddBottomSheet(
            project: ProjectModel(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.cardColor,
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
          preferredSize:
              Size(double.infinity, MediaQuery.of(context).size.height * 0.1),
          child: MyHomeScreenAppBar(onTap: widget.onTapProfile)),
      body: Stack(
        children: [
          const TransactionsTotalWidget(),
          scrollableSheetWidget(context, theme),
          const TransactionBottomWidget(),
        ],
      ),
    );
  }

  DraggableScrollableSheetCommonComp scrollableSheetWidget(
      BuildContext context, ThemeData theme) {
    return DraggableScrollableSheetCommonComp(
      draggableScrollableController: DraggableScrollableController(),
      stops: const [0.73, 0.98],
      initialSize: 0.73,
      minChildSize: 0.73,
      radius: 20,
      widget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            addProjectTextWidget(context, theme),
            const AllProjectsWidget(),
            90.hx,
          ],
        ),
      ),
    );
  }

  GestureDetector addProjectTextWidget(BuildContext context, ThemeData theme) {
    return GestureDetector(
        onTap: () {
          openBottomSheet(context: context);
        },
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14), color: darkBlue),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconCircleWidget(
                  radius: 5,
                  padding: const EdgeInsets.all(2),
                  imagewidget: const Icon(
                    Icons.add,
                    size: 14,
                    color: black,
                  ),
                  backgroundColor: greyLight,
                ),
                5.wx,
                Text(
                  " Project",
                  style: theme.textTheme.titleLarge!
                      .copyWith(color: white, fontSize: 12.5),
                ),
              ],
            ),
          ),
        ));
  }
}
