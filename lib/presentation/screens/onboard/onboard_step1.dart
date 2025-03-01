import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/gen/assets.gen.dart';
import 'package:construction_mate/logic/controllers/Onboard/onboard_bloc.dart';
import 'package:construction_mate/presentation/widgets/common/common_button.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OnboardStep1 extends StatefulWidget {
  const OnboardStep1({super.key});

  @override
  State<OnboardStep1> createState() => _OnboardStep1State();
}

class _OnboardStep1State extends State<OnboardStep1> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  context
                      .read<OnboardBloc>()
                      .add(OnboardEvent.onIndexChanged(index: value));
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(onboard[index].image),
                      20.hx,
                      Text(
                        onboard[index].title,
                        style: textTheme.titleLarge?.copyWith(fontSize: 18),
                      ),
                      5.hx,
                      Text(
                        onboard[index].desc,
                        style: textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: BlocBuilder<OnboardBloc, OnboardState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Centers the dots
                    children: List.generate(
                      3,
                      (index) => buildDot(isActive: index == state.index),
                    ),
                  );
                },
              ),
            ),
            15.hx,
            BlocBuilder<OnboardBloc, OnboardState>(
              builder: (context, state) {
                return CustomElevatedButton(
                  onTap: () {
                    if (state.index < 2) {
                      _pageController.animateToPage(
                        state.index + 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      context.pushReplacement(RoutesName.signInScreen);
                    }
                  },
                  label: state.index == 2 ? "Get Started" : "Next",
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildDot({required bool isActive}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 3,
      width: 20, // Dynamic width for active dot
      decoration: BoxDecoration(
        color: isActive ? purple : gray500,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

List<OnboardModel> onboard = [
  OnboardModel(
      image: Assets.images.onboard1.path,
      title: "Track Your Expenses",
      desc: "Easily monitor and manage your project expenses in real time."),
  OnboardModel(
      image: Assets.images.onboard2.path,
      title: "Stay Updated",
      desc: "Keep your project status updated with just a few taps."),
  OnboardModel(
      image: Assets.images.onboard3.path,
      title: "Easy to Track and Analize",
      desc: "Organize and oversee multiple ongoing projects with ease.")
];

class OnboardModel {
  final String image;
  final String title;
  final String desc;
  OnboardModel({required this.image, required this.title, required this.desc});
}
