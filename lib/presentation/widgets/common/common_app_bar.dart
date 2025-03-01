import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool isCenterTitle;
  final bool isBackButtonShow;
  final Function()? onTap;
  final Color? backgroundColor;
  final Widget? titleWidget;
  const CustomAppBar({
    super.key,
    this.title,
    this.isCenterTitle = true,
    this.isBackButtonShow = true,
    this.backgroundColor,
    this.onTap,
    this.titleWidget
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      backgroundColor: backgroundColor ?? theme.scaffoldBackgroundColor,
      scrolledUnderElevation: 0,
      leading: isBackButtonShow
          ? GestureDetector(
              onTap: onTap,
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: theme.canvasColor,
              ),
            )
          : const SizedBox(),
      centerTitle: isCenterTitle,
      title: titleWidget ?? Text(
        title ?? "",
        style: theme.textTheme.titleLarge?.copyWith(fontSize: 18),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 40);
}
