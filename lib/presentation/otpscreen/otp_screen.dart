// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_otp/presentation/otpscreen/components/otpcontainer.dart';

import '../../resources/colormanager.dart';
import 'components/otpscreenimage.dart';

class OtpScreen extends ConsumerStatefulWidget {
  String verificationid;

  OtpScreen({
    required this.verificationid,
  });

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 60.h,
              ),
              const OtpScreenImage(),
              SizedBox(
                height: 30.h,
              ),
              OtpContainer(VerificationId: widget.verificationid),
            ],
          ),
        ),
      ),
    );
  }
}
