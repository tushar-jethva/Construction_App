import 'package:flutter/material.dart';

class DraggableScrollableSheetCommonComp extends StatelessWidget {
  const DraggableScrollableSheetCommonComp(
      {super.key,
      required DraggableScrollableController draggableScrollableController,
      this.widget,
      required this.stops,
      this.minChildSize,
      this.initialSize,
      this.isDraggerShow = true,
      this.radius,
      this.newWidget})
      : _draggableScrollableController = draggableScrollableController;

  final DraggableScrollableController _draggableScrollableController;
  final Widget? widget;
  final List<double> stops;
  final double? initialSize;
  final double? minChildSize;
  final double? radius;
  final bool isDraggerShow;
  final Widget Function(BuildContext, ScrollController)? newWidget;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DraggableScrollableSheet(
      controller: _draggableScrollableController,
      initialChildSize: initialSize ?? stops[1],
      minChildSize: minChildSize ?? 0.18,
      maxChildSize: stops.last,
      expand: true,
      snap: true,
      snapSizes: stops,
      builder: newWidget ??
          (BuildContext context, ScrollController scrollController) {
            return Container(
              decoration: BoxDecoration(
                  color: theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(radius ?? 40),
                      topRight: Radius.circular(radius ?? 40))),
              child: ListView(
                controller: scrollController,
                children: [
                  isDraggerShow
                      ? const BottomSheetDraggerWidget()
                      : const SizedBox.shrink(),
                  widget ?? SizedBox.shrink(),
                ],
              ),
            );
          },
    );
  }
}

class BottomSheetDraggerWidget extends StatelessWidget {
  const BottomSheetDraggerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Center(
        child: Container(
          width: 50,
          height: 5,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 208, 208, 208),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
