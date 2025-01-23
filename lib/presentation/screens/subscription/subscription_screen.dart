// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/constants.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/gen/assets.gen.dart';
import 'package:construction_mate/logic/controllers/SubscriptionBoxBloc/subsctiption_box_bloc.dart';
import 'package:construction_mate/logic/models/subscription_model.dart';
import 'package:construction_mate/presentation/widgets/common/common_button.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:construction_mate/utilities/extension/toast_extenstion.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SubscriptionScreen extends StatelessWidget {
  final bool isExpired;
  const SubscriptionScreen({super.key, this.isExpired = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              50.hx,
              Center(
                child: Lottie.asset(
                  height: 200,
                  width: 200,
                  Assets.json.subscription,
                  fit: BoxFit.cover,
                  repeat: true,
                ),
              ),
              isExpired
                  ? Text(
                      "Your 7 days free trial has ended!",
                      style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14),
                    )
                  : const SizedBox.shrink(),
              3.hx,
              Text(
                "Upgrade Plan",
                style: theme.textTheme.titleLarge
                    ?.copyWith(fontSize: 16, color: Colors.yellow.shade800),
              ),
              20.hx,
              BlocBuilder<SubsctiptionBoxBloc, SubsctiptionBoxState>(
                builder: (context, state) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SubscriptionBoxWidget(
                          theme: theme,
                          subscription: subscription[0],
                          isSelected: state.index == 0,
                          index: 0,
                        ),
                        15.wx,
                        SubscriptionBoxWidget(
                          theme: theme,
                          subscription: subscription[1],
                          index: 1,
                          isSelected: state.index == 1,
                        ),
                        15.wx,
                        SubscriptionBoxWidget(
                          theme: theme,
                          subscription: subscription[2],
                          index: 2,
                          isSelected: state.index == 2,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomBarWidget(theme, context),
    );
  }

  Container bottomBarWidget(ThemeData theme, BuildContext context) {
    return Container(
      color: theme.cardColor,
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 15),
      child: Row(
        children: [
          Expanded(
            child: CustomElevatedButton(
              radius: 10,
              onTap: () {
                isExpired
                    ? context.replaceNamed(RoutesName.signInScreen)
                    : context.pop();
                isExpired
                    ? const TopSnackBar(message: "Free trial ended!")
                    : ();
              },
              label: 'Back',
              backgroundColor: white,
              labelColor: purple,
              borderColor: white,
            ),
          ),
          20.wx,
          Expanded(
            child: CustomElevatedButton(
              onTap: () {},
              label: 'Contact Us',
              radius: 10,
            ),
          )
        ],
      ),
    );
  }
}

class SubscriptionBoxWidget extends StatelessWidget {
  final SubscriptionModel subscription;
  final int index;
  final bool isSelected;
  const SubscriptionBoxWidget({
    super.key,
    required this.subscription,
    required this.index,
    this.isSelected = false,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          context
              .read<SubsctiptionBoxBloc>()
              .add(SubsctiptionBoxEvent.onSelectionChanged(index: index));
        },
        child: Container(
          height: isSelected
              ? MediaQuery.of(context).size.height * 0.20
              : MediaQuery.of(context).size.height * 0.19,
          width: MediaQuery.of(context).size.width * 0.32,
          decoration: BoxDecoration(
              color: isSelected ? purple : theme.cardColor,
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, right: 25, left: 25, bottom: 5),
                child: Text(
                  subscription.title,
                  style: theme.textTheme.titleLarge
                      ?.copyWith(fontSize: isSelected ? 14 : 12),
                ),
              ),
              SizedBox(
                  height: 1,
                  width: 95,
                  child: DottedLine(
                    dashLength: 5,
                    lineThickness: 2,
                    dashColor: isSelected ? Colors.grey.shade300 : grey,
                  )),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text(
                      subscription.previousPrice,
                      style: theme.textTheme.titleMedium?.copyWith(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 10,
                          color: isSelected ? Colors.grey.shade300 : grey),
                    ),
                    2.hx,
                    Text(
                      subscription.currentPrice,
                      style: theme.textTheme.titleLarge
                          ?.copyWith(fontSize: isSelected ? 15 : 13),
                    ),
                    7.hx,
                    Text(
                      subscription.validity,
                      style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 11,
                          color: isSelected ? Colors.grey.shade300 : grey),
                    ),
                    7.hx,
                    Icon(
                      Icons.mobile_friendly_outlined,
                      color: theme.canvasColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

List<SubscriptionModel> subscription = [
  SubscriptionModel(
      title: "Pro Plus",
      previousPrice: "INR 19,999",
      currentPrice: "INR 9,999",
      validity: "6 Months"),
  SubscriptionModel(
      title: "Business",
      previousPrice: "INR 33,999",
      currentPrice: "INR 23,999",
      validity: "12 Months"),
  SubscriptionModel(
      title: "Ultra Plus ",
      previousPrice: "INR 69,999",
      currentPrice: "INR 59,999",
      validity: "18 Months"),
];
