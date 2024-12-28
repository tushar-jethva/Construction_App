// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:construction_mate/logic/controllers/MenuBloc/menu_bloc.dart';
import 'package:construction_mate/presentation/screens/project/project_screen.dart';
import 'package:flutter/material.dart';

import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/constants.dart';
import 'package:construction_mate/presentation/widgets/common/common_app_bar.dart';
import 'package:construction_mate/presentation/widgets/common/draggable_scrollable_sheet.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectDetailsNScreen extends StatelessWidget {
  const ProjectDetailsNScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: CustomAppBar(
        titleWidget: BlocBuilder<MenuBloc, MenuState>(
          builder: (context, state) {
            return Text(
              menus[state.index].menuName,
              style: theme.textTheme.titleLarge?.copyWith(fontSize: 18),
            );
          },
        ),
      ),
      body: Stack(
        children: [
          topAmountAndWidgetSection(theme),
          scrollableSheetWidget(context, theme)
        ],
      ),
    );
  }

  DraggableScrollableSheetCommonComp scrollableSheetWidget(
      BuildContext context, ThemeData theme) {
    return DraggableScrollableSheetCommonComp(
        draggableScrollableController: DraggableScrollableController(),
        stops: const [0.8, 0.98],
        initialSize: 0.8,
        minChildSize: 0.8,
        radius: 20,
        isDraggerShow: false,
        newWidget: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                topAllMenusSections(context, theme),
                menuFullDetailsWidgetSection(scrollController)
              ],
            ),
          );
        });
  }

  BlocBuilder<MenuBloc, MenuState> menuFullDetailsWidgetSection(
      ScrollController scrollController) {
    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {
        return Expanded(
          child: ListView(
            controller: scrollController,
            children: [menus[state.index].widget!],
          ),
        );
      },
    );
  }

  Widget topAllMenusSections(BuildContext context, ThemeData theme) {
    return Column(
      children: [
        BlocBuilder<MenuBloc, MenuState>(
          builder: (context, state) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: menus.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return MenuWidget(
                      name: menus[index].menuName,
                      index: index,
                      isSelected: state.index == index,
                    );
                  }),
            );
          },
        )
      ],
    );
  }

  Padding topAmountAndWidgetSection(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: TopAmountWidget(
                theme: theme,
                title: "Amount Received",
                amount: "1000",
                color: green,
              )),
              20.wx,
              Expanded(
                  child: TopAmountWidget(
                theme: theme,
                title: "Amount Received",
                amount: "2000",
                color: red,
              )),
            ],
          ),
          20.hx,
          BlocBuilder<MenuBloc, MenuState>(
            builder: (context, state) {
              return Align(
                  alignment: Alignment.centerRight,
                  child: menus[state.index].childWidget ??
                      const SizedBox.shrink());
              ;
            },
          )
        ],
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  final String name;
  final bool isSelected;
  final int index;
  const MenuWidget({
    Key? key,
    required this.name,
    required this.isSelected,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        context.read<MenuBloc>().add(MenuEvent.onIndexChanged(index: index));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? darkBlue : theme.cardColor,
        ),
        child: Text(
          menus[index].menuName,
          style: theme.textTheme.titleLarge
              ?.copyWith(fontSize: 12, color: isSelected ? white : black),
        ),
      ),
    );
  }
}

class TopAmountWidget extends StatelessWidget {
  const TopAmountWidget(
      {super.key,
      required this.theme,
      required this.title,
      required this.amount,
      required this.color});

  final ThemeData theme;
  final String title;
  final String amount;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(fontSize: 12),
          ),
          10.hx,
          Text(
            "₹ $amount",
            style: theme.textTheme.titleLarge
                ?.copyWith(fontSize: 16, color: color),
          )
        ],
      ),
    );
  }
}
