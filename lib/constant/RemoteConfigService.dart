// import 'package:firebase_remote_config/firebase_remote_config.dart';

// const String _BOOLEAN_VALUE = 'isAndroidAppUpdateForcefully';
// const String _INT_VALUE = 'iAndroidAppVersion';
// const String _STRING_VALUE = 'vServerVersion';

// class RemoteConfigService {
//   final FirebaseRemoteConfig _remoteConfig;
//   RemoteConfigService({required FirebaseRemoteConfig remoteConfig})
//       : _remoteConfig = remoteConfig;

//   final defaults = <String, dynamic>{
//     _BOOLEAN_VALUE: false,
//     _INT_VALUE: -1,
//     _STRING_VALUE: "Flutter Firebase",
//   };

//   static RemoteConfigService? _instance;
//   static Future<RemoteConfigService?> getInstance() async {
//     _instance ??= RemoteConfigService(
//         remoteConfig: await FirebaseRemoteConfig.instance,
//       );
//     return _instance;
//   }

//   bool get getBoolValue => _remoteConfig.getBool(_BOOLEAN_VALUE);
//   int get getIntValue => _remoteConfig.getInt(_INT_VALUE);
//   String get getStringValue => _remoteConfig.getString(_STRING_VALUE);

//   Future initialize() async {
//     try {
//       await _remoteConfig.setConfigSettings(RemoteConfigSettings(
//         fetchTimeout: const Duration(minutes: 1),
//         minimumFetchInterval: const Duration(hours: 1),
//       ));

//       await _remoteConfig.setDefaults(defaults);
//       await _fetchAndActivate();
//     }  catch (e) {
//       print("Unable to fetch remote config. Default value will be used");
//     }
//   }

//   Future _fetchAndActivate() async {
//     await _remoteConfig.fetchAndActivate();
//     print("boolean::: $getBoolValue");
//     print("int::: $getIntValue");
//     print("string::: $getStringValue");
//   }
// }