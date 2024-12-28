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
  PartiesChildWidget(),
  BuildingChildWidget(),
  MaterialChildWidget(),
  TransactionChildWidget(),
];

List<Widget> mainWidget = [
  PartiesNWidget(),
  MyBuildingWidget(),
  MaterialWidget(),
  TransactionWidget()
];
