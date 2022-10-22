import 'package:flutter/material.dart';
import 'package:flutter_otp/FCMServices/fcm_services.dart';
import 'package:flutter_otp/presentation/number_registration/components/inputcontainer.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/mobilescreen_image.dart';

class MobileRegistration extends ConsumerStatefulWidget {
  const MobileRegistration({Key? key}) : super(key: key);

  @override
  ConsumerState<MobileRegistration> createState() => _MobileRegistrationState();
}

class _MobileRegistrationState extends ConsumerState<MobileRegistration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 90.h,
              ),
              const MobileScreenImage(),
              SizedBox(
                height: 30.h,
              ),
              const InputContainer(),
              SizedBox(
                height: 30.h,
              ),
              ElevatedButton(
                  onPressed: () {
                    FCMServices.sendNotification(
                        to: "/topics/users",
                        title: "New Notification",
                        body: "Your order successfully Completed");
                  },
                  child: const Text("Send Notification")),
            ],
          ),
        ),
      ),
    );
  }
}
