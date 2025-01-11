import 'package:construction_mate/common/common_alery_message_dialog.dart';
import 'package:construction_mate/common/enter_otp_widget.dart';
import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/gen/assets.gen.dart';
import 'package:construction_mate/logic/controllers/Authentication/SignIn/sign_in_bloc.dart';
import 'package:construction_mate/logic/controllers/BottomBarBloc/bottom_bar_bloc.dart';
import 'package:construction_mate/presentation/router/go_router.dart';
import 'package:construction_mate/presentation/screens/bills/bills_screen.dart';
import 'package:construction_mate/presentation/screens/parties/parties_screen.dart';
import 'package:construction_mate/presentation/screens/project/project_screen.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/home_screen_app_bar.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:construction_mate/utilities/extension/toast_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({super.key});

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Screens for your BottomNavigationBar
  final screens = <Widget>[];

  @override
  void initState() {
    super.initState();
    // Add screens with specific callbacks (e.g., onTapProfile for MyProjectScreen)
    screens.addAll([
      const MyPartiesScreen(),
      MyProjectScreen(onTapProfile: () {
        _scaffoldKey.currentState
            ?.openDrawer(); // Open the drawer when profile is tapped
      }),
      const MyBillScreen(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocConsumer<BottomBarBloc, BottomBarState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: PreferredSize(
              preferredSize: Size(
                  double.infinity, MediaQuery.of(context).size.height * 0.1),
              child: MyHomeScreenAppBar(onTap: () {
                _scaffoldKey.currentState?.openDrawer();
              })),
          drawer: drawer(context: context),
          body: screens[state.tabIndex],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              splashFactory:
                  NoSplash.splashFactory, // Disable the splash effect
              highlightColor:
                  Colors.transparent, // Disable the highlight effect
            ),
            child: BottomNavigationBar(
                backgroundColor: theme.scaffoldBackgroundColor,
                unselectedItemColor: grey,
                selectedItemColor: purple,
                unselectedIconTheme: IconThemeData(color: grey),
                selectedIconTheme: IconThemeData(color: purple),
                elevation: 0,
                currentIndex: state.tabIndex,
                onTap: (value) {
                  context
                      .read<BottomBarBloc>()
                      .add(TabChangeEvent(tabIndex: value));
                },
                items: [
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        Assets.svg.partiesIcon.path,
                        color: state.tabIndex == 0 ? purple : grey,
                      ),
                      label: 'Parties'),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        Assets.svg.projectIcon.path,
                        color: state.tabIndex == 1 ? purple : grey,
                      ),
                      label: "Projects"),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        Assets.svg.billIcon.path,
                        color: state.tabIndex == 2 ? purple : grey,
                      ),
                      label: "Bills"),
                ]),
          ),
        );
      },
    );
  }
}

Widget drawer({required BuildContext context}) {
  final theme = Theme.of(context);
  return Drawer(
    backgroundColor: theme.scaffoldBackgroundColor,
    child: Column(
      children: [
        Container(
          color: theme.cardColor,
          width: double.infinity,
          padding: const EdgeInsets.only(top: 45, bottom: 10),
          child: Column(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundColor: white,
                child: Image.asset(
                  Assets.logos.s2p.path,
                  fit: BoxFit.contain,
                  height: 40,
                ),
              ),
              10.hx,
              Text(
                "S2P",
                style: theme.textTheme.titleLarge?.copyWith(fontSize: 18),
              ),
              10.hx,
            ],
          ),
        ),
        ListTile(
          leading: Lottie.asset(
            height: 35,
            width: 35,
            Assets.json.subscription,
            fit: BoxFit.fitWidth,
            repeat: false,
          ),
          title: Text(
            "Upgrade",
            style: theme.textTheme.bodyMedium
                ?.copyWith(fontSize: 16, color: Colors.yellow.shade800),
          ),
          onTap: () {
            context.pushNamed(RoutesName.subscriptionScreen, extra: false);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.account_circle,
            color: theme.canvasColor,
          ),
          title: Text(
            "Profile",
            style: theme.textTheme.bodyMedium?.copyWith(fontSize: 16),
          ),
          onTap: () {
            context.pushNamed(RoutesName.editProfileScreen);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.book,
            color: theme.canvasColor,
          ),
          title: Text(
            "TDS",
            style: theme.textTheme.bodyMedium?.copyWith(fontSize: 16),
          ),
          onTap: () {
            context.pushNamed(RoutesName.tdsScreen);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.book,
            color: theme.canvasColor,
          ),
          title: Text(
            "GST",
            style: theme.textTheme.bodyMedium?.copyWith(fontSize: 16),
          ),
          onTap: () {
            context.pushNamed(RoutesName.gstScreen);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.book,
            color: theme.canvasColor,
          ),
          title: Text(
            "Other expense",
            style: theme.textTheme.bodyMedium?.copyWith(fontSize: 16),
          ),
          onTap: () {
            context.pushNamed(RoutesName.otherExpensesScreen);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.logout,
            color: theme.canvasColor,
          ),
          title: Text(
            "Logout",
            style: theme.textTheme.bodyMedium?.copyWith(fontSize: 16),
          ),
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return CommonAlertMessageDialog(
                    cancelAction: () {
                      context.pop();
                    },
                    theme: Theme.of(context),
                    title: "Logout",
                    icon: Assets.svg.logout.path,
                    description: "Are you sure want to Logout?",
                    buttonText: "Logout",
                    action: () async {
                      context.pushReplacementNamed(RoutesName.signInScreen);
                      context
                          .read<SignInBloc>()
                          .add(const SignInEvent.logout());
                      "Logout Successfully".showToast(
                          context: context,
                          typeOfToast: ShortToastType.success);
                    },
                  );
                });
          },
        ),
        const Spacer(),
        Text("🧡"),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "Built with pride in",
              style: theme.textTheme.titleMedium?.copyWith(fontSize: 16)),
          TextSpan(
            text: " Gujarat",
            style: theme.textTheme.titleLarge?.copyWith(fontSize: 18),
          )
        ])),
        Text(
          'Builders Everywhere',
          textAlign: TextAlign.center,
          style: theme.textTheme.titleMedium?.copyWith(fontSize: 16),
        ),
        10.hx,
      ],
    ),
  );
}
