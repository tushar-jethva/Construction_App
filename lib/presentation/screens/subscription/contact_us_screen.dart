// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:construction_mate/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/gen/assets.gen.dart';
import 'package:construction_mate/presentation/widgets/common/common_icon_circle_widget.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  Future<void> openWhatsApp(
      {required String phone, String message = ''}) async {
    final url = 'https://wa.me/$phone?text=${Uri.encodeComponent(message)}';

    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  void openLinkedIn() async {
    final Uri url = Uri.parse(
        "https://www.linkedin.com/company/106336077/admin/dashboard/"); // Change to your profile link
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch $url");
    }
  }

  /// Function to make a phone call
  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri.parse("tel:$phoneNumber");
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneUri';
    }
  }

  /// Function to send an email
  Future<void> sendEmail(String email,
      {String subject = '', String body = ''}) async {
    final Uri emailUri = Uri.parse(
        "mailto:$email?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}");
    await launchUrl(emailUri);
  }

  /// Function to open Google Maps with an address
  Future<void> openMapWithAddress(String address) async {
    final Uri googleMapsUri = Uri.parse(
        "https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(address)}");

    await launchUrl(googleMapsUri);
  }

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
              context.pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: theme.canvasColor,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            topTextSection(theme),
            30.hx,
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xffF3F4F7)),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Column(
                            children: [
                              Text(
                                "Contact Information",
                                style: theme.textTheme.titleLarge
                                    ?.copyWith(fontSize: 20, color: blue),
                              ),
                              20.hx,
                              GestureDetector(
                                onTap: () {
                                  makePhoneCall("7698886285");
                                },
                                child: Icon(
                                  Icons.call_sharp,
                                  color: blue,
                                ),
                              ),
                              5.hx,
                              Text(
                                "+91 7698886285",
                                style: theme.textTheme.titleSmall
                                    ?.copyWith(fontSize: 12, color: blue),
                              ),
                              20.hx,
                              GestureDetector(
                                onTap: () {
                                  sendEmail('ankurkapuriya2002@gmail.com');
                                },
                                child: Icon(
                                  Icons.email,
                                  color: blue,
                                ),
                              ),
                              5.hx,
                              Text(
                                "ankurkapuriya2002@gmail.com",
                                style: theme.textTheme.titleSmall
                                    ?.copyWith(fontSize: 12, color: blue),
                              ),
                              20.hx,
                              GestureDetector(
                                onTap: () {
                                  openMapWithAddress(
                                      "150, Santoshanagar, Lambe Hanuman Stree, Surat - 6, Gujarat");
                                },
                                child: Icon(
                                  Icons.location_on,
                                  color: blue,
                                ),
                              ),
                              5.hx,
                              Text(
                                "150, Santoshanagar, Lambe Hanuman Stree, Surat - 6, Gujarat",
                                textAlign: TextAlign.center,
                                style: theme.textTheme.titleSmall
                                    ?.copyWith(fontSize: 12, color: blue),
                              ),
                              80.hx,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconCircleWidget(
                                    isSvg: true,
                                    path: Assets.svg.twitterIcon.path,
                                    onTap: () {
                                      showTopSnackBar(context, "Coming soon");
                                    },
                                  ),
                                  IconCircleWidget(
                                    isSvg: true,
                                    path: Assets.svg.instagramIcon.path,
                                    onTap: () {
                                      showTopSnackBar(context, "Coming soon");
                                    },
                                  ),
                                  IconCircleWidget(
                                    isSvg: false,
                                    path: Assets.images.linkedin.path,
                                    onTap: openLinkedIn,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -80,
                      right: -120,
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff0E33F3),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      right: 30,
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xff0E33F3).withOpacity(0.5),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
          onTap: () {
            openWhatsApp(phone: "7698886285");
          },
          child: SvgPicture.asset(Assets.svg.wpIcon.path)),
    );
  }

  Widget topTextSection(ThemeData theme) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Contact Us",
            style: theme.textTheme.headlineMedium?.copyWith(fontSize: 24),
          ),
          5.hx,
          Text(
            'Any question or remarks?',
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium
                ?.copyWith(fontSize: 12, color: const Color(0xff717171)),
          ),
          Text(
            'Just write us a message!',
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium
                ?.copyWith(fontSize: 12, color: const Color(0xff717171)),
          )
        ],
      ),
    );
  }
}

class IconCircleWidget extends StatelessWidget {
  const IconCircleWidget(
      {Key? key, required this.isSvg, required this.path, required this.onTap})
      : super(key: key);

  final bool isSvg;
  final String path;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(shape: BoxShape.circle, color: blue),
          child: isSvg
              ? SvgPicture.asset(path)
              : Image.asset(
                  path,
                  color: white,
                  height: 15,
                ),
        ),
      );
    });
  }
}
