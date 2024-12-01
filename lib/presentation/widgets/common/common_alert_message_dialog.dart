import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/presentation/widgets/common/common_button.dart';
import 'package:construction_mate/presentation/widgets/common/common_icon_circle_widget.dart';
import 'package:flutter/material.dart';


class CommonAlertMessageDialog extends StatelessWidget {
  const CommonAlertMessageDialog(
      {super.key,
      this.icon = "assets/icons/warning.png",
      required this.title,
      required this.description,
      this.buttonText,
      this.iconHeight = 100,
      this.buttonColor,
      required this.action,
      this.cancelText,
      this.isBackButtonShow = true,
      required this.cancelAction,
      required this.theme,
      this.isLoading = false});

  final String title;
  final String icon;
  final String description;
  final String? buttonText;
  final String? cancelText;
  final double? iconHeight;
  final Color? buttonColor;
  final bool isBackButtonShow;
  final VoidCallback action;
  final VoidCallback cancelAction;
  final ThemeData theme;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconCircleWidget(
            radius: 50,
            isSvg: true,
            svgpath: icon,
            size: const Size(100, 100),
            svgColor: purple,
          ),
          const SizedBox(height: 20),
          Text(title,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineMedium
                  ?.copyWith(fontSize: 24, letterSpacing: 1.1)),
          const SizedBox(height: 15),
          Text(description,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.w400, fontSize: 14)),
          const SizedBox(height: 20),
          isBackButtonShow
              ? CustomElevatedButton(
                  label: cancelText ?? "Cancel",
                  backgroundColor: Colors.white,
                  borderColor: purple,
                  onTap: cancelAction,
                )
              : const SizedBox(),
          SizedBox(height: isBackButtonShow ? 10 : 0),
          CustomElevatedButton(
            isLoading: isLoading,
            label: buttonText ?? "Okay",
            onTap: action,
          )
        ],
      ),
    );
  }
}
