import 'package:construction_mate/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PopUpMenuWidget extends StatelessWidget {
  final Function()? onUpdateButtonPressed;
  final Function()? onDeleteButtonPressed;

  const PopUpMenuWidget(
      {super.key,
      required this.theme,
      this.onUpdateButtonPressed,
      this.onDeleteButtonPressed});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      menuPadding: EdgeInsets.zero,
      color: theme.scaffoldBackgroundColor,
      itemBuilder: (context) => [
        PopupMenuItem(
            child: TextButton(
                onPressed: onUpdateButtonPressed,
                child: Text(
                  "Update",
                  style: theme.textTheme.titleMedium!.copyWith(fontSize: 14),
                ))),
        PopupMenuItem(
            child: TextButton(
                onPressed: onDeleteButtonPressed,
                child: Text(
                  "Delete",
                  style: theme.textTheme.titleMedium!.copyWith(fontSize: 14),
                )))
      ],
      icon: SvgPicture.asset(Assets.svg.moreVert.path),
      padding: EdgeInsets.zero,
    );
  }
}
