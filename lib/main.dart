import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp/FCMServices/fcm_services.dart';
import 'package:flutter_otp/firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'app/myapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  await ScreenUtil.ensureScreenSize();

  // FCM init
  FCMServices.getToken();
  FCMServices.subscribeToTopic(topicName: "users");
  FCMServices.fcmListen();
  FirebaseMessaging.onBackgroundMessage(FCMServices.backgroundMessage);

  runApp(const ProviderScope(child: MyApp()));
}
