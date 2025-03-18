import 'package:construction_mate/gen/assets.gen.dart';
import 'package:construction_mate/presentation/widgets/details_screen_widgets/building/building_child_widget.dart';
import 'package:construction_mate/presentation/widgets/details_screen_widgets/building/building_widget.dart';
import 'package:construction_mate/presentation/widgets/details_screen_widgets/material/material_child_widget.dart';
import 'package:construction_mate/presentation/widgets/details_screen_widgets/material/material_widget.dart';
import 'package:construction_mate/presentation/widgets/details_screen_widgets/parties/parties_child_widget.dart';
import 'package:construction_mate/presentation/widgets/details_screen_widgets/parties/parties_n_widget.dart';
import 'package:construction_mate/presentation/widgets/details_screen_widgets/rental/material_child_widget.dart';
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
  Menus(menuName: "Rental", childWidget: childWidget[3], widget: mainWidget[3]),
  Menus(
      menuName: "Transactions",
      childWidget: childWidget[4],
      widget: mainWidget[3]),
];

List<Widget> childWidget = [
  const PartiesChildWidget(),
  const BuildingChildWidget(),
  const MaterialChildWidget(),
  const RentalChildWidget(),
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

//---------------storage
const String IS_FIRST_TIME = 'is_first_time';

//------------ image --------
const alteranateUrl =
    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fin.pinterest.com%2Fpin%2F634655772464432888%2F&psig=AOvVaw2DdCy8iLtwxA-Z7cEjEWLP&ust=1736861970026000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCPDYzqDp8ooDFQAAAAAdAAAAABAJ";
