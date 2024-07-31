import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/ThemeBloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class MyHomeScreenAppBar extends StatelessWidget {
  const MyHomeScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.scaffoldBackgroundColor,
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 35.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/assets.png'),
              ),
              Gap(10.h),
              Text(
                "Tushar Jethva",
                style: theme.textTheme.titleMedium,
              )
            ],
          ),
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return InkWell(
                onTap: () {
                  context.read<ThemeBloc>().add(OnThemeChangeEvent());
                },
                child: state.themeData.scaffoldBackgroundColor == black
                    ? Icon(
                        Icons.sunny,
                        color: theme.canvasColor,
                      )
                    : Icon(
                        Icons.nights_stay,
                        color: theme.canvasColor,
                      ),
              );
            },
          )
        ],
      ),
    );
  }
}
