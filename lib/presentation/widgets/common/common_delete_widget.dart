// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/gen/assets.gen.dart';
import 'package:construction_mate/presentation/widgets/common/common_button.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CommonDeleteWidget extends StatelessWidget {
  const CommonDeleteWidget(
      {Key? key,
      required this.title,
      required this.des,
      required this.onDeletePressed,
      required this.isLoading})
      : super(key: key);

  final String title;
  final String des;
  final void Function() onDeletePressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;

    return SimpleDialog(
      alignment: Alignment.center,
      backgroundColor: theme.scaffoldBackgroundColor,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleIconContainerWidget(
                path: Assets.svg.deleteIcon.path,
              ),
              Text(
                title,
                style: textTheme.titleLarge?.copyWith(fontSize: 18),
              ),
              5.hx,
              Text(
                des,
                style: textTheme.bodyMedium
                    ?.copyWith(color: const Color(0xff667085)),
              ),
              10.hx,
              Row(
                children: [
                  Expanded(
                      child: CustomElevatedButton(
                    onTap: () {
                      context.pop();
                    },
                    label: 'Cancel',
                    borderColor: borderColor,
                    backgroundColor: Colors.transparent,
                    labelColor: theme.canvasColor,
                  )),
                  20.wx,
                  Expanded(
                      child: CustomElevatedButton(
                    isLoading: isLoading,
                    onTap: onDeletePressed,
                    label: 'Delete',
                  ))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CircleIconContainerWidget extends StatelessWidget {
  const CircleIconContainerWidget(
      {super.key, required this.path, this.backgroundColor});

  final String path;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: backgroundColor ?? borderColor,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        path,
        height: 25,
      ),
    );
  }
}
