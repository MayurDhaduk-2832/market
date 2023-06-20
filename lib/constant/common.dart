import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class UpDownPageLimit {
  final int upLimit;
  final int downLimit;

  const UpDownPageLimit(this.upLimit, this.downLimit);
}

class UpDownButtonEnableState {
  final bool upState;
  final bool downState;

  const UpDownButtonEnableState(this.upState, this.downState);
}

int typecast(Map<String, dynamic> json, String key) {
  return json.containsKey(key) && json[key] != null
      ? json[key] is int
          ? json[key]
          : int.parse(json[key])
      : 0;
}

// Future<Locale> getLocale() async {
//   var isLanguage = PreferenceManager.getString(PreferenceManager.KEY_LANGUAGE);
//   if (isLanguage != null) {
//     switch (isLanguage) {
//       case LocalUtils.vLanguageEnglish:
//         return const Locale(LocalUtils.vLanguageEnglish, 'US');
//       case LocalUtils.vLanguageGujarati:
//         return const Locale(LocalUtils.vLanguageGujarati, 'IN');
//       case LocalUtils.vLanguageHindi:
//         return const Locale(LocalUtils.vLanguageHindi, 'IN');
//     }
//   }
//   return const Locale(LocalUtils.vLanguageEnglish, 'US');
// }

// AppDatabase? appDatabase;

// Future<AppDatabase> databaseInitialise() async {
// appDatabase ??=
// await $FloorAppDatabase.databaseBuilder('24_wings.db').build();
// return appDatabase!;
// }

void flutterToastTop(String errorMessage) {
  Fluttertoast.showToast(
      msg: errorMessage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

void flutterToastBottom(errorMessage) {
  Fluttertoast.showToast(
      msg: errorMessage ?? "",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

void flutterToastBottomGreen(errorMessage) {
  Fluttertoast.showToast(
      msg: errorMessage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}

// Container backgroundContainer() {
//   return Container(
//     alignment: Alignment.bottomLeft,
//     margin: const EdgeInsets.only(right: 100),
//     child: Image.asset(ImageConstant.imgBackground),
//     // CustomImageView(
//     //   svgPath: ImageConstant.imgBackground,color: Colors.black.withOpacity(0.02),colorBlendMode: BlendMode,
//     // ),
//   );
// }

int daysBetween(DateTime to) {
  var from = DateTime.now().toUtc();

  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}

Future<void> launchPhone(_url) async {
  if (!await launch(_url)) {
    throw 'Could not launch $_url';
  }
}

// Future<void> infoContactPermission(context,VoidCallback onAcceptClick) {
//   return showModalBottomSheet<void>(
//     context: context,
//     isScrollControlled: true,
//     enableDrag: false,
//     isDismissible: true,
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(
//         top: Radius.circular(20),
//       ),
//     ),
//     clipBehavior: Clip.antiAliasWithSaveLayer,
//     builder: (BuildContext context) {

//       return Container(
//           height: MediaQuery.of(context).size.height/3.9,
//           width: double.infinity,
//           color: greyBackground,
//           child: Padding(
//             padding: getPadding(
//               all: 15.w,
//             ),
//             child: Column(children: [
//               Text(
//                 "JoSo needs your contacts access to make you more comfortable to choose name and mobile number from your contacts conveniently. This information is not shared anywhere else. So are you okay with this?",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 15.sp,
//                   fontFamily: 'Roboto',
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               15.sbh,
//               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                 Expanded(
//                   child: CustomButton(
//                     height: 39.h,
//                     width: Get.width,
//                     text: "Decline",
//                     margin: EdgeInsets.only(left: 0.w, right: 10.w),
//                     variant: ButtonVariant.OutlineGray90026,
//                     padding: ButtonPadding.PaddingAll10,
//                     fontStyle: ButtonFontStyle.RobotoRomanSemiBold18,
//                     alignment: Alignment.bottomCenter,
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ),
//                 Expanded(
//                     child: CustomButton(
//                       height: 39.h,
//                       width: Get.width,
//                       text: "Accept",
//                       margin: EdgeInsets.only(left: 10.w, right: 0.w),
//                       variant: ButtonVariant.OutlinePink8004c,
//                       padding: ButtonPadding.PaddingAll10,
//                       fontStyle: ButtonFontStyle.RobotoRomanSemiBold18,
//                       alignment: Alignment.bottomCenter,
//                       onTap: onAcceptClick
//                       //     () async{
//                       //   Navigator.pop(context);
//                       //   return onAcceptClick;
//                       // },
//                     ),
//                 ),
//               ])
//             ]),
//           ));
//     },
//   );
// }
