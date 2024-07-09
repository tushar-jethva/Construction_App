// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/SelectFloorsBloc/select_floors_bloc.dart';
import 'package:construction_mate/logic/models/building_model.dart';

class MySelectFloorsScreen extends StatefulWidget {
  final BuildingModel buildingModel;
  final SelectFloorsBloc selectFloorsBloc;
  const MySelectFloorsScreen({
    Key? key,
    required this.buildingModel,
    required this.selectFloorsBloc,
  }) : super(key: key);

  @override
  State<MySelectFloorsScreen> createState() => _MySelectFloorsScreenState();
}

class _MySelectFloorsScreenState extends State<MySelectFloorsScreen> {
  List<int> list = [1, 2, 3, 4];
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.selectFloorsBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Select Floors"),
        ),
        body: BlocBuilder<SelectFloorsBloc, SelectFloorsState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  itemCount: widget.buildingModel.noOfFloors,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.w,
                      mainAxisSpacing: 20.w,
                      mainAxisExtent: 125),
                  itemBuilder: (context, index) {
                    if (list.contains(index + 1)) {
                      return GestureDetector(
                        onTap: () {
                          ReusableFunctions.showSnackBar(
                              context: context, content: "Already given!");
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: grey,
                          ),
                          child: Text(
                            "${index + 1} floor",
                            style: const TextStyle(
                                color: white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ),
                      );
                    }
                    if (state.floorList.contains(index + 1)) {
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<SelectFloorsBloc>()
                              .add(RemoveFloorEvent(floor: index + 1));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: green,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Text(
                            "${index + 1} floor",
                            style: const TextStyle(
                                color: white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ),
                      );
                    }
                    return GestureDetector(
                      onTap: () {
                        context
                            .read<SelectFloorsBloc>()
                            .add(AddFloorEvent(floor: index + 1));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: greyLight,
                        ),
                        child: Text(
                          "${index + 1} floor",
                          style: const TextStyle(
                              color: black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ),
                    );
                  }),
            );
          },
        ),
      ),
    );
  }
}
