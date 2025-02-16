import 'dart:io';
import 'package:construction_mate/presentation/widgets/common/show_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

class CommonAssets {
  static String defaultImage = "assets/logo/logo.png";

  static Widget getAssetsSvgImage(String imagePath,
      {double height = 40, double width = 40, Color? color}) {
    return SvgPicture.asset(
      imagePath,
      height: height,
      width: width,
      fit: BoxFit.cover,
      color: color,
    );
  }

  static Widget getAssetsImage(
      {String imagePath = "",
      double height = 40,
      double width = 40,
      BoxFit fit = BoxFit.cover,
      Color? color}) {
    return Image.asset(
      imagePath.isEmpty ? defaultImage : imagePath,
      height: height,
      width: width,
      fit: fit,
      color: color,
    );
  }

  static Widget getNetworkImage(String imageUrl,
      {String defaultImage = "assets/logo/logo.png",
      double height = 90,
      double width = 90,
      BoxFit fit = BoxFit.cover}) {
    return imageUrl.isNotEmpty
        ? CachedNetworkImage(
            imageUrl: imageUrl,
            height: height,
            width: width,
            fit: fit,
            filterQuality: FilterQuality.medium,
            errorWidget:
                (BuildContext context, String exception, dynamic stackTrace) {
              return getAssetsImage(height: height, width: width);
            },
          )
        : getAssetsImage(height: height, width: width);
  }

  static void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  static Decoration containerDecoration({
    required BuildContext context,
    double borderRadius = 20,
    Color? bgColor,
    bool isShadow = false,
  }) {
    return BoxDecoration(
      color: bgColor ?? Theme.of(context).scaffoldBackgroundColor,
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(color: Colors.black12),
      boxShadow: isShadow
          ? [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 4,
                // offset: const Offset(2, 4),
              ),
            ]
          : [],
    );
  }

  static Decoration containerDecoration1(
      {required BuildContext context,
      double borderRadius = 20,
      Color? bgColor,
      bool isShadow = false,
      BoxBorder? borderstyle}) {
    return BoxDecoration(
      color: bgColor ?? Theme.of(context).scaffoldBackgroundColor,
      borderRadius: BorderRadius.circular(borderRadius),
      border: borderstyle,
      boxShadow: isShadow
          ? [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 4,
                // offset: const Offset(2, 4),
              ),
            ]
          : [],
    );
  }

  static BoxDecoration containerDecorationwithShadow(
      {required BuildContext context}) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return BoxDecoration(
      color: isDarkMode ? null : Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: isDarkMode ? Border.all(color: Colors.white30) : null,
      boxShadow: isDarkMode
          ? []
          : [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
    );
  }

  static Decoration containerGreyDecoration() {
    return BoxDecoration(
        color: const Color(0xffF2F4F5), borderRadius: BorderRadius.circular(8));
  }

  static List<String> monthList = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  static String timestampToDate(int timestamp) {
    // Create a DateTime object from the timestamp
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

    // Define months array
    List<String> months = [
      "",
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];

    // Extract day, month, and year from the DateTime object
    int day = dateTime.day;
    int month = dateTime.month;
    int year = dateTime.year;

    // Format the date string
    String formattedDate = '$day ${months[month]} $year';

    return formattedDate;
  }

  static bool validatePassword(String password) {
    // Regex pattern for password validation
    String pattern = r'^.{6,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(password);
  }

  static String getFirstName(String displayName) {
    List<String> names = displayName.split(" ");
    return names.isNotEmpty ? names[0] : " ";
  }

  static String getLastName(String displayName) {
    List<String> names = displayName.split(" ");
    return names.length > 1 ? names[1] : " ";
  }
}

void getMultipleMediaFile(
    {Function(List<XFile>)? onCallBack, int? isNumber, context}) async {
  final ImagePicker picker = ImagePicker();
  List<XFile>? imageFiles;
  imageFiles = await picker.pickMultiImage(
    imageQuality: 50,
    maxHeight: 480,
    maxWidth: 640,
  );

  if (onCallBack != null) {
    onCallBack(imageFiles);
  }
}

selectProfile(BuildContext context,
    {Function(XFile?)? onCallBack, int? isNumnber}) {
  ShowSheet(
      context,
      bgcolor: Theme.of(context).cardColor,
      Wrap(
        children: [
          GestureDetector(
            onTap: () async {
              context.pop();
              if (Platform.isAndroid) {
                permission(
                    status: Permission.camera.request(),
                    onTap: () async {
                      getMediaFile(false,
                          onCallBack: onCallBack, isNumber: isNumnber);
                    },
                    onTapShowDialog: () {
                      showDialogCameraPermission(context: context);
                    });
              } else {
                if (await checkCameraPermission()) {
                  getMediaFile(false,
                      onCallBack: onCallBack, isNumber: isNumnber);
                }
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.camera_alt_rounded,
                    color: Theme.of(context).canvasColor),
                title: Text('Camera',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 18)),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              context.pop();
              final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
              if (Platform.isAndroid) {
                final AndroidDeviceInfo androidInfo =
                    await deviceInfo.androidInfo;
                permission(
                    status: Platform.isAndroid
                        ? ((androidInfo.version.sdkInt) >= 33)
                            ? Permission.photos.request()
                            : Permission.storage.request()
                        : Permission.photos.request(),
                    onTap: () async {
                      getMediaFile(true,
                          onCallBack: onCallBack, isNumber: isNumnber);
                    },
                    onTapShowDialog: () {
                      showDialogGalleryPermission(context: context);
                    });
              } else {
                if (await checkMediaPermission()) {
                  getMediaFile(true,
                      onCallBack: onCallBack, isNumber: isNumnber);
                }
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(
                  Icons.photo,
                  color: Theme.of(context).canvasColor,
                ),
                title: Text('Gallery',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 18)),
              ),
            ),
          ),
        ],
      ));
  // return showModalBottomSheet(
  //   backgroundColor: Colors.white,
  //   shape: const RoundedRectangleBorder(
  //     borderRadius: BorderRadius.only(
  //       topLeft: Radius.circular(15.0),
  //       topRight: Radius.circular(15.0),
  //     ),
  //   ),
  //   context: context,
  //   builder: (context) {
  //     return
  //   },
  // );
}

showDialogCameraPermission({String? subTitle, required BuildContext context}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const SizedBox(
            // width: 300,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Allow Camera access',
                  ),
                ],
              ),
            ),
          ),
          content: Text(
            subTitle ??
                'If you want to use the QR code scanner, click on the below button to go to the app setting and allow camera access to',
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Cancel'),
              ),
              onPressed: () {
                context.pop();
              },
            ),
            CupertinoDialogAction(
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Go to Setting'),
              ),
              onPressed: () {
                context.pop();
                openAppSettings();
              },
            ),
          ],
        );
      });
}

showDialogGalleryPermission({String? subTitle, required BuildContext context}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const SizedBox(
            // width: 300,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Allow Gallery access',
                  ),
                ],
              ),
            ),
          ),
          content: Text(
            subTitle ??
                "If you want to use the Upload Photo, click on the below button to go to the app setting and allow Photo Gallery access to",
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Cancel'),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Go to Setting'),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                openAppSettings();
              },
            ),
          ],
        );
      });
}

PermissionStatus? status;

permission(
    {required Future<PermissionStatus> status,
    required Function onTap,
    required Function onTapShowDialog}) async {
  if ((await status) == PermissionStatus.granted) {
    onTap();
    if (kDebugMode) {
      print('isGranted');
    }
  } else if ((await status) == PermissionStatus.denied) {
    if (kDebugMode) {
      print('isDenied');
    }
  } else if ((await status) == PermissionStatus.permanentlyDenied) {
    if (kDebugMode) {
      print('isPermanentlyDenied');
    }
    onTapShowDialog();
  } else if ((await status) == PermissionStatus.limited) {
    onTap();
    if (kDebugMode) {
      print(
          'isLimited Selected ${(await status) == PermissionStatus.limited},');
    }
  }
}

void getMediaFile(bool isGallery,
    {Function(XFile)? onCallBack, int? isNumber, context}) async {
  final ImagePicker picker = ImagePicker();
  XFile? imageFile;
  if (isGallery) {
    imageFile = await picker.pickImage(
      imageQuality: 50,
      maxHeight: 480,
      maxWidth: 640,
      source: ImageSource.gallery,
    );
  } else {
    imageFile = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxHeight: 480,
      maxWidth: 640,
    );
  }

  if (imageFile != null) {
    if (isNumber == 1) {}
    if (onCallBack != null) {
      onCallBack(imageFile);
    }
  }
}

Future<bool> checkMediaPermission() async {
  return checkPermission([Permission.photos]);
}

Future<bool> checkCameraPermission() async {
  return checkPermission([Permission.camera]);
}

Future<bool> checkPermission(List<Permission> list) async {
  if (Platform.isAndroid) {
    for (int i = 0; i < list.length; i++) {
      if (await list[i].status == PermissionStatus.granted) {
        list.removeAt(i);
      }
    }
    if (list.isNotEmpty) {
      Map<Permission, PermissionStatus> permission = await list.request();
      bool isGranted = true;
      for (int i = 0; i < list.length; i++) {
        if (permission[list[i]] != PermissionStatus.granted) {
          isGranted = false;
        }
      }
      return isGranted;
    } else {
      return true;
    }
  } else {
    return true;
  }
}
