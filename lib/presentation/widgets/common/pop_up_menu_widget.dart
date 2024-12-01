import 'package:flutter/material.dart';

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
      icon: Icon(
        Icons.more_vert_rounded,
        color: theme.canvasColor,
      ),
      padding: EdgeInsets.zero,
    );
  }
}
