// import 'dart:convert';
// import 'dart:io';

// // import 'package:firebase_messaging/firebase_messaging.dart'
//     // show FirebaseMessaging, RemoteMessage;
// import 'package:flutter/widgets.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import '../../main.dart';
// // import '../widget/preference_manager.dart';
// import 'FirebaseService.dart';
// import 'constant.dart';

// class FCMProvider with ChangeNotifier {
//   static BuildContext? _context;

//   static void setContext(BuildContext context) {
//     FCMProvider._context = context;
//     if (isFromNotification) {
//       var isLogin = PreferenceManager.getBool(PreferenceManager.KEY_IS_LOGIN);
//       if (isLogin == true) {
//         var jsonPayload = jsonDecode(selectedNotificationPayload ?? "{}");
//         if (jsonPayload.containsKey("vRouteName")) {
//           debugPrint("dashboard notification received");
//           Get.toNamed(jsonPayload["vRouteName"] ?? "/dashboard");
//           debugPrint("dashboard notification received");
//         }
//       }
//     }
//   }

//   /// when app is in the foreground
//   static Future<void> onTapNotification(NotificationResponse? response) async {
//     if (/*FCMProvider._context == null || */ response?.payload == null) return;

//     var isLogin = PreferenceManager.getBool(PreferenceManager.KEY_IS_LOGIN);
//     if (isLogin == true) {
//       Constant.eventBus.fire(response);
//     }
//   }

//   static Future<void> onMessage() async {
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       // if (FCMProvider._refreshNotifications != null) await FCMProvider._refreshNotifications!(true);
//       // if this is available when Platform.isIOS, you'll receive the notification twice
//       if (Platform.isAndroid) {
//         // await FirebaseService.localNotificationsPlugin.show(
//         //   10,
//         //   "Title",
//         //   "Body",
//         //   FirebaseService.platformChannelSpecifics,
//         //   payload: message.data.toString(),
//         // );
//         var notification = message.data;
//         if (notification.isNotEmpty) {
//           await FirebaseService.localNotificationsPlugin.show(
//             notification.hashCode,
//             notification["vTitle"],
//             notification["vBody"],
//             FirebaseService.platformChannelSpecifics,
//             payload: jsonEncode(message.data),
//           );
//         }
//       }
//     });

//     final NotificationAppLaunchDetails? notificationAppLaunchDetails =
//         await FirebaseService.localNotificationsPlugin
//             .getNotificationAppLaunchDetails();

//     if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
//       selectedNotificationPayload =
//           notificationAppLaunchDetails!.notificationResponse?.payload;

//       isFromNotification = true;
//       selectedNotificationScreen = Routes.DASHBOARD;
//     }
//   }

//   static Future<void> onMessageOpenedApp() async {
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
//       if (Platform.isAndroid) {}
//     });
//   }

//   static Future<void> backgroundHandler(RemoteMessage message) async {
//     if (Platform.isAndroid) {
//       var notification = message.data;
//       if (notification.isNotEmpty) {
//         await FirebaseService.localNotificationsPlugin.show(
//           notification.hashCode,
//           notification["vTitle"],
//           notification["vBody"],
//           FirebaseService.platformChannelSpecifics,
//           payload: jsonEncode(message.data),
//         );
//       }
//     }
//   }
// }
