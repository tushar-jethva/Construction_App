// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/logic/controllers/FloorNameAndFeet/floor_name_and_feet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class MyFootAndFloorScreen extends StatefulWidget {
  final FloorNameAndFeetBloc floorNameAndFeetBloc;
  const MyFootAndFloorScreen({super.key, required this.floorNameAndFeetBloc});

  @override
  State<MyFootAndFloorScreen> createState() => _MyFootAndFloorScreenState();
}

class _MyFootAndFloorScreenState extends State<MyFootAndFloorScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = widget.floorNameAndFeetBloc.state;
    print(state.floors);
    print(state.feets);
    final moneyAndFloor = List.generate(
        int.parse(state.floors),
        (index) =>
            {'floorName': 'Floor No. ${index + 1}', 'squreFeet': state.feets});
    widget.floorNameAndFeetBloc.add(
        FloorNameAndFeetChanged(listOfFloorNameAndFeetState: moneyAndFloor));
    return BlocProvider.value(
      value: widget.floorNameAndFeetBloc,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: theme.scaffoldBackgroundColor,
          iconTheme: IconThemeData(color: theme.canvasColor),
          title: Text(
            "Total Floors  ${state.floors}",
            style: theme.textTheme.titleLarge,
          ),
          actions: [
            InkWell(
              onTap: () {
                widget.floorNameAndFeetBloc.add(FloorNameAndFeetChanged(
                    listOfFloorNameAndFeetState: moneyAndFloor));
                context.pop();
              },
              child: Container(
                height: 40,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: green, borderRadius: BorderRadius.circular(12.r)),
                child: Text(
                  'Done',
                  style: theme.textTheme.titleMedium,
                ),
              ),
            )
          ],
        ),
        body: BlocBuilder<FloorNameAndFeetBloc, FloorNameAndFeetState>(
          builder: (context, state) {
            return ListView.builder(
                itemCount: int.parse(state.floors),
                itemBuilder: (context, index) {
                  final TextEditingController _footController =
                      TextEditingController();
                  _footController.text = state.feets;
                  final TextEditingController floorNameController =
                      TextEditingController();
                  floorNameController.text = "Floor No. ${index + 1}";
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: TextField(
                              style: theme.textTheme.titleMedium!
                                  .copyWith(fontSize: 17),
                              controller: floorNameController,
                              keyboardType: TextInputType.name,
                              onChanged: (value) {
                                moneyAndFloor[index]['floorName'] = value;
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                hintStyle: theme.textTheme.titleMedium!
                                    .copyWith(color: grey),
                                hintText: 'Floor Name',
                              ),
                              maxLines: 1,
                            )),
                        Gap(40.w),
                        Expanded(
                          flex: 1,
                          child: TextField(
                              style: theme.textTheme.titleMedium!
                                  .copyWith(fontSize: 17),
                              controller: _footController,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                moneyAndFloor[index]['squreFeet'] = value;
                              },
                              decoration: InputDecoration(
                                  hintStyle: theme.textTheme.titleMedium!
                                      .copyWith(color: grey),
                                  hintText: 'Foots',
                                  contentPadding: EdgeInsets.zero),
                              maxLines: 1),
                        )
                      ],
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
