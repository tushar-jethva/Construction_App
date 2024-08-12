// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/presentation/widgets/common/custom_textfield.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class MyFootAndFloorScreen extends StatefulWidget {
  final int floors;
  final double foots;
  const MyFootAndFloorScreen(
      {Key? key, required this.floors, required this.foots})
      : super(key: key);

  @override
  State<MyFootAndFloorScreen> createState() => _MyFootAndFloorScreenState();
}

class _MyFootAndFloorScreenState extends State<MyFootAndFloorScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    List<dynamic> money = List.generate(widget.floors, (index) => widget.foots);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: theme.canvasColor),
        title: Text(
          "Total Floors  ${widget.floors}",
          style: theme.textTheme.titleLarge,
        ),
        actions: [
          InkWell(
            onTap: () {
              print(money);
            },
            child: Container(
              height: 40,
              width: 70,
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
      body: ListView.builder(
          itemCount: widget.floors,
          itemBuilder: (context, index) {
            final TextEditingController _footController =
                TextEditingController();
            _footController.text = widget.foots.toString();
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Text(
                        "Floor No. ${index + 1}",
                        style:
                            theme.textTheme.titleMedium!.copyWith(fontSize: 16),
                      )),
                  const Gap(20),
                  Expanded(
                    flex: 1,
                    child: TextField(
                        style:
                            theme.textTheme.titleMedium!.copyWith(fontSize: 17),
                        controller: _footController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          money[index] = value;
                        },
                        decoration: InputDecoration(
                            hintText: '\$',
                            prefix: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.currency_rupee_sharp,
                                color: theme.canvasColor,
                                size: 20,
                              ),
                            ),
                            contentPadding: EdgeInsets.zero),
                        maxLines: 1),
                  )
                ],
              ),
            );
          }),
    );
  }
}
