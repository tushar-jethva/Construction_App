import 'package:construction_mate/logic/controllers/Building-by-id/building_by_id_bloc.dart';
import 'package:construction_mate/logic/controllers/DateBloc/date_bloc_bloc.dart';
import 'package:construction_mate/presentation/screens/project/project_screen.dart';
import 'package:construction_mate/presentation/screens/project/task/add_task_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/add_material_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../logic/models/material/all_material_model.dart';

class TaskChildScreen extends StatelessWidget {
  const TaskChildScreen({super.key});

  openBottomSheetOfTask(
      {required BuildContext context,
      required Details material,
      bool? isUpdate,
      required String partieId}) {
    showModalBottomSheet(
      isScrollControlled: true,
      showDragHandle: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      context: context,
      builder: (context) {
        return const AddTaskWidget();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: CommonButton2(
        buttonName: 'Tasks',
        onTap: () {
          context.read<DateBlocBloc>().add(const DateBlocEvent.initalize());
          openBottomSheetOfTask(
              context: context,
              isUpdate: false,
              material: Details(),
              partieId: '');
        },
      ),
    );
  }
}
