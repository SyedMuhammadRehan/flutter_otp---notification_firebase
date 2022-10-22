import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/assets.dart';

class OtpScreenImage extends StatelessWidget {
  const OtpScreenImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(ImageAssets.rcv),
          SizedBox(
            height: 30.sm,
          ),
        ],
      ),
    );
  }
}
