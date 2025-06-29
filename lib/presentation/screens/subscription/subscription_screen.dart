// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/gen/assets.gen.dart';
import 'package:construction_mate/logic/controllers/SubscriptionBoxBloc/subsctiption_box_bloc.dart';
import 'package:construction_mate/logic/models/subscription_model.dart';
import 'package:construction_mate/presentation/widgets/common/common_button.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SubscriptionScreen extends StatelessWidget {
  final bool isExpired;
  const SubscriptionScreen({super.key, this.isExpired = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        surfaceTintColor: transparent,
        leading: IconButton(
            onPressed: () {
              isExpired
                  ? context.goNamed(RoutesName.signInScreen)
                  : context.pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: theme.canvasColor,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isExpired
                  ? Text(
                      "Your 7 days free trial has ended!",
                      style:
                          theme.textTheme.bodyMedium?.copyWith(fontSize: 14.sp),
                    )
                  : const SizedBox.shrink(),
              3.hx,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                child: Column(
                  children: [
                    Text(
                      "Get Premium",
                      style: theme.textTheme.headlineMedium
                          ?.copyWith(fontSize: 30.sp),
                    ),
                    10.hx,
                    Text(
                      "Unlock all the power of this mobile tool and enjoy digital experience like never before!",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              ),
              20.hx,
              Center(
                child: Lottie.asset(
                  height: 200,
                  width: 200,
                  Assets.json.subscription,
                  fit: BoxFit.cover,
                  repeat: true,
                ),
              ),
              20.hx,
              BlocBuilder<SubsctiptionBoxBloc, SubsctiptionBoxState>(
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SubscriptionBoxWidget(
                        theme: theme,
                        subscription: subscription[0],
                        isSelected: state.index == 0,
                        index: 0,
                      ),
                      SubscriptionBoxWidget(
                        theme: theme,
                        subscription: subscription[1],
                        index: 1,
                        isSelected: state.index == 1,
                      ),
                      SubscriptionBoxWidget(
                        theme: theme,
                        subscription: subscription[2],
                        index: 2,
                        isSelected: state.index == 2,
                      ),
                    ],
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

  Widget bottomBarWidget(ThemeData theme, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25.0.h, horizontal: 16.w),
      child: CustomElevatedButton(
        onTap: () {
          context.pushNamed(RoutesName.CONTACT_US_SCREEN_NAME);
        },
        label: 'Contact Us',
        radius: 10,
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
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 16.w),
          child: Container(
            padding: EdgeInsets.all(16.r),
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color(0xff092765).withOpacity(0.05),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                    color: isSelected ? purple : transparent, width: 2)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      subscription.title,
                      style: theme.textTheme.titleLarge?.copyWith(
                          fontSize: isSelected ? 16.sp : 14.sp, color: purple),
                    ),
                    index == 1
                        ? Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            decoration: BoxDecoration(
                                color: const Color(0xff26CB63),
                                borderRadius: BorderRadius.circular(12)),
                            child: Text(
                              "Best Value",
                              style: theme.textTheme.titleMedium
                                  ?.copyWith(fontSize: 8.sp, color: white),
                            ),
                          )
                        : const SizedBox.shrink()
                  ],
                ),
                5.hx,
                Text(
                  "First 7 days free - Then ${subscription.currentPrice}",
                  style: theme.textTheme.titleSmall?.copyWith(
                      fontSize: isSelected ? 12.sp : 11.sp, color: purple),
                ),
              ],
            ),
          ),
        ));
  }
}

List<SubscriptionModel> subscription = [
  SubscriptionModel(
      title: "Pro Plus",
      previousPrice: "₹ 19,999",
      currentPrice: "₹  9,999",
      validity: "6 Months"),
  SubscriptionModel(
      title: "Business",
      previousPrice: "₹33,999",
      currentPrice: "₹23,999",
      validity: "12 Months"),
  SubscriptionModel(
      title: "Ultra Plus ",
      previousPrice: "₹69,999",
      currentPrice: "₹ 59,999",
      validity: "18 Months"),
];
