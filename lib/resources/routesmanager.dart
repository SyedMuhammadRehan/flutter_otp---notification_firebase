import 'package:flutter/material.dart';
import 'package:flutter_otp/data/model/otpargument.dart';
import 'package:flutter_otp/presentation/homepage.dart';
import 'package:flutter_otp/presentation/number_registration/mobile_registration.dart';
import 'package:flutter_otp/presentation/otpscreen/otp_screen.dart';

import 'stringmanager.dart';

class Routes {
  static const String mobilescreen = '/';
  static const String otpscreen = 'otpscreen';
  static const String home = 'home';
}

class RoutGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case Routes.mobilescreen:
        return MaterialPageRoute(builder: (_) => const MobileRegistration());
      case Routes.otpscreen:
        return MaterialPageRoute(builder: (_) {
          OtpArgument argument = args as OtpArgument;
          return OtpScreen(verificationid: args.verificationid);
        });
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return undefinedNameRoute();
    }
  }

  static Route<dynamic> undefinedNameRoute() {
    return MaterialPageRoute(
        builder: (_) => const Scaffold(
              body: Text(AppStrings.noRoute),
            ));
  }
}
