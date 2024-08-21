import 'package:construction_mate/core/constants/colors.dart';
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
      margin: EdgeInsets.only(left: 10.h, right: 10.h, top: 30),
      color: theme.scaffoldBackgroundColor,
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
                child: state.themeData.scaffoldBackgroundColor ==
                        blackBackgroundColor
                    ? Icon(
                        Icons.sunny,
                        color: purple,
                      )
                    : const Icon(
                        Icons.nights_stay,
                        color: Color.fromARGB(255, 85, 85, 85),
                      ),
              );
            },
          )
        ],
      ),
    );
  }
}
