import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconCircleWidget extends StatelessWidget {
  double radius;
  bool isSvg;
  String svgpath;
  Color? svgColor;
  Widget? imagewidget;
  Size? size;
  EdgeInsetsGeometry? padding;
  Color? backgroundColor;
  Color? borderColor;

  IconCircleWidget(
      {super.key,
      required this.radius,
      this.svgpath = "",
      this.isSvg = false,
      this.imagewidget,
      this.svgColor,
      this.size,
      this.padding,
      this.backgroundColor,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size?.width,
      height: size?.height,
      decoration: BoxDecoration(
        color: backgroundColor ?? const Color(0xffFFF8DB),
        borderRadius: BorderRadius.circular(
          radius,
        ),
        border: Border.all(color: borderColor ?? Colors.transparent)
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(12.0),
        child: isSvg
            ? SvgPicture.asset(
                svgpath,
                color: svgColor,
              )
            : imagewidget,
      ),
    );
  }
}
