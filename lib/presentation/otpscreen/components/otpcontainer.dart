// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fluttertoast/fluttertoast.dart';

import '../../../resources/colormanager.dart';
import '../../../resources/routesmanager.dart';
import '../../../resources/stringmanager.dart';

class OtpContainer extends StatefulWidget {
  String VerificationId;

  OtpContainer({
    Key? key,
    required this.VerificationId,
  }) : super(key: key);

  @override
  State<OtpContainer> createState() => _OtpContainerState();
}

class _OtpContainerState extends State<OtpContainer> {
  bool loading = false;

  FirebaseAuth auth = FirebaseAuth.instance;

  Future verifyotp(String otp) async {
    if (otp.length == 6) {
      final credential = PhoneAuthProvider.credential(
          verificationId: widget.VerificationId, smsCode: otp);

      try {
        await auth.signInWithCredential(credential);
        setState(() {
          loading = false;
        });
        Navigator.pushNamed(context, Routes.home);
      } catch (e) {
        Fluttertoast.showToast(
            msg: e.toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        setState(() {
          loading = false;
        });
      }
    } else {
      setState(() {
        loading = false;
      });
      Fluttertoast.showToast(
          msg: "Enter 6 digits code",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  String? _otp;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldfive = TextEditingController();
  final TextEditingController _fieldsix = TextEditingController();
  final FocusNode _focusDigit1 = FocusNode();
  final FocusNode _focusDigit2 = FocusNode();
  final FocusNode _focusDigit3 = FocusNode();
  final FocusNode _focusDigit4 = FocusNode();
  final FocusNode _focusDigit5 = FocusNode();
  final FocusNode _focusDigit6 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [_optfield()],
    );
  }

  Widget _optfield() {
    return Form(
        key: formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                AppStrings.entercode,
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(
                height: 15.sm,
              ),
              Text(
                AppStrings.sixdigit,
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: 20.sm,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Optinput(
                            controller: _fieldOne,
                            focusNode0: _focusDigit1,
                            focusNode1: _focusDigit1,
                          ),
                          Optinput(
                            controller: _fieldTwo,
                            focusNode0: _focusDigit1,
                            focusNode1: _focusDigit2,
                          ),
                          Optinput(
                            controller: _fieldThree,
                            focusNode0: _focusDigit2,
                            focusNode1: _focusDigit3,
                          ),
                          Optinput(
                            controller: _fieldFour,
                            focusNode0: _focusDigit3,
                            focusNode1: _focusDigit4,
                          ),
                          Optinput(
                            controller: _fieldfive,
                            focusNode0: _focusDigit4,
                            focusNode1: _focusDigit5,
                          ),
                          Optinput(
                            controller: _fieldsix,
                            focusNode0: _focusDigit5,
                            focusNode1: _focusDigit6,
                          ),
                        ]),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                width: double.infinity,
                height: 55.sm,
                child: ElevatedButton(
                  style: Theme.of(context).elevatedButtonTheme.style,
                  onPressed: () async {
                    setState(() {
                      loading = true;
                      _otp = _fieldOne.text +
                          _fieldTwo.text +
                          _fieldThree.text +
                          _fieldFour.text +
                          _fieldfive.text +
                          _fieldsix.text;
                    });
                    print("otpppp $_otp");
                    verifyotp(_otp!);
                  },
                  child: loading == false
                      ? const Text(
                          AppStrings.verify,
                        )
                      : const CircularProgressIndicator(),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(AppStrings.resendotp,
                          style: Theme.of(context).textTheme.overline)),
                ],
              ),
            ]));
  }
}

class Optinput extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode0;
  final FocusNode focusNode1;

  const Optinput({
    Key? key,
    required this.controller,
    required this.focusNode0,
    required this.focusNode1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 60.sm,
          width: 40.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: ColorManager.grey2,
          ),
          child: TextFormField(
            focusNode: focusNode1,
            style: Theme.of(context).textTheme.subtitle1,
            controller: controller,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              } else if (value.isEmpty) {
                FocusScope.of(context).requestFocus(focusNode0);
              }
            },
            textAlign: TextAlign.center,
            keyboardType: TextInputType.phone,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            decoration: InputDecoration(
              hintText: "*",
              hintStyle: TextStyle(color: ColorManager.lightGrey),
              enabledBorder: InputBorder.none,
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ));
  }
}
