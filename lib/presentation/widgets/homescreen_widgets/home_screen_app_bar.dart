import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/gen/assets.gen.dart';
import 'package:construction_mate/logic/controllers/Authentication/SignIn/sign_in_bloc.dart';
import 'package:construction_mate/logic/controllers/Profile/user-watcher/user_watcher_bloc.dart';
import 'package:construction_mate/logic/controllers/ThemeBloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class MyHomeScreenAppBar extends StatelessWidget {
  final Function()? onTap;
  const MyHomeScreenAppBar({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding:
          EdgeInsets.only(left: 10.w, right: 10.w, top: 40.h, bottom: 10.h),
      color: theme.scaffoldBackgroundColor,
      child: BlocBuilder<UserWatcherBloc, UserWatcherState>(
        builder: (context, state) {
          final user = state.profile;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocConsumer<SignInBloc, SignInState>(
                    listener: (context, state) {
                      if (state.state1.isLoaded) {
                        context.replaceNamed(RoutesName.signInScreen);
                      }
                    },
                    builder: (context, state) {
                      return BlocBuilder<SignInBloc, SignInState>(
                        builder: (context, state) {
                          return GestureDetector(
                            onTap: onTap,
                            child: CircleAvatar(
                              backgroundImage: user?.logo == null
                                  ? AssetImage(
                                      Assets.images.user1.path,
                                    ) as ImageProvider
                                  : NetworkImage(user?.logo ?? ''),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  Gap(10.w),
                  Text(
                    "Hello, ${user?.name ?? ""} 👋",
                    style: theme.textTheme.titleMedium?.copyWith(fontSize: 14),
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
          );
        },
      ),
    );
  }
}
