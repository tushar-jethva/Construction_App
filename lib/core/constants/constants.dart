import 'package:construction_mate/gen/assets.gen.dart';
import 'package:construction_mate/presentation/widgets/details_screen_widgets/building/building_child_widget.dart';
import 'package:construction_mate/presentation/widgets/details_screen_widgets/building/building_widget.dart';
import 'package:construction_mate/presentation/widgets/details_screen_widgets/material/material_child_widget.dart';
import 'package:construction_mate/presentation/widgets/details_screen_widgets/material/material_widget.dart';
import 'package:construction_mate/presentation/widgets/details_screen_widgets/parties/parties_child_widget.dart';
import 'package:construction_mate/presentation/widgets/details_screen_widgets/parties/parties_n_widget.dart';
import 'package:construction_mate/presentation/widgets/details_screen_widgets/transaction/transaction_child_widget.dart';
import 'package:construction_mate/presentation/widgets/details_screen_widgets/transaction/transaction_widget.dart';
import 'package:flutter/material.dart';

class Menus {
  final String menuName;
  final Widget? childWidget;
  final Widget? widget;

  Menus({required this.menuName, this.widget, this.childWidget});
}

List<Menus> menus = [
  Menus(
      menuName: "Parties", childWidget: childWidget[0], widget: mainWidget[0]),
  Menus(
      menuName: "Buildings",
      childWidget: childWidget[1],
      widget: mainWidget[1]),
  Menus(
      menuName: "Material", childWidget: childWidget[2], widget: mainWidget[2]),
  Menus(
      menuName: "Transactions",
      childWidget: childWidget[3],
      widget: mainWidget[3]),
];

List<Widget> childWidget = [
  const PartiesChildWidget(),
  const BuildingChildWidget(),
  const MaterialChildWidget(),
  TransactionChildWidget(),
];

List<Widget> mainWidget = const [
  PartiesNWidget(),
  MyBuildingWidget(),
  MaterialWidget(),
  TransactionWidget()
];

//-------------------------- building icons --------
List<String> buildIcons = [
  Assets.svg.build1.path,
  Assets.svg.build2.path,
  Assets.svg.build3.path
];

//---------------------------- user icons -----------------
List<String> userIcons = [
  Assets.svg.user1.path,
  Assets.svg.user2.path,
  Assets.svg.user3.path,
];

//---------------- top snackbar ---------------------
void showTopSnackBar(BuildContext context, String message,
    {Color backgroundColor = Colors.blue}) {
  final overlay = Overlay.of(context);
  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).padding.top + 10,
      left: 20,
      right: 20,
      child: TopSnackBar(
        message: message,
        backgroundColor: backgroundColor,
      ),
    ),
  );

  overlay.insert(overlayEntry);

  // Remove the snackbar after a delay
  Future.delayed(const Duration(seconds: 3), () {
    overlayEntry.remove();
  });
}

class TopSnackBar extends StatefulWidget {
  final String message;
  final Color backgroundColor;

  const TopSnackBar({
    super.key,
    required this.message,
    this.backgroundColor = Colors.blue,
  });

  @override
  State<TopSnackBar> createState() => _TopSnackBarState();
}

class _TopSnackBarState extends State<TopSnackBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            widget.message,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
