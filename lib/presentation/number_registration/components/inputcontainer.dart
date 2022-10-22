import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp/data/model/otpargument.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../resources/colormanager.dart';
import '../../../resources/routesmanager.dart';
import '../../../resources/stringmanager.dart';

class InputContainer extends StatefulWidget {
  const InputContainer({Key? key}) : super(key: key);

  @override
  State<InputContainer> createState() => _InputContainerState();
}

class _InputContainerState extends State<InputContainer> {
  var auth = FirebaseAuth.instance;
  bool loading = false;
  String? phoneNumber;
  String numbererror = '';
  String codeerror = '';

  final GlobalKey<FormState> formkey = GlobalKey();
  final TextEditingController countrycodecontroller = TextEditingController();
  final TextEditingController numbercontroller = TextEditingController();

  validateMobile(String? value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      setState(() {
        numbererror = 'Please enter mobile number';
      });
      return value;
    } else if (!regExp.hasMatch(value)) {
      setState(() {
        numbererror = 'Please enter valid mobile number';
      });
      return Container();
    }
    setState(() {
      numbererror = '';
    });
    return value;
  }

  Future<void> registeruser(String phoneNumber) async {
    if (formkey.currentState!.validate()) {
      await auth.verifyPhoneNumber(
          phoneNumber: "+ $phoneNumber",
          verificationCompleted: (_) {
            setState(() {
              loading = false;
            });
          },
          verificationFailed: (e) {
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
          },
          codeSent: (String verificationId, int? token) {
            Navigator.pushNamed(context, Routes.otpscreen,
                arguments: OtpArgument(verificationid: verificationId));
          },
          codeAutoRetrievalTimeout: (e) {
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
          });
    }
  }






  @override
  void initState() {
    countrycodecontroller.text = '92';
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.entermobile,
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            AppStrings.recieve,
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            height: 60.sm,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorManager.grey2,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextFormField(
                        readOnly: true,
                        controller: countrycodecontroller,
                        decoration: InputDecoration(
                            isDense: true,
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintStyle: Theme.of(context).textTheme.subtitle1,
                            prefixIcon: Icon(
                              Icons.add,
                              color: ColorManager.lightGrey,
                            ),
                            prefixIconConstraints:
                                BoxConstraints(maxWidth: 50.h)),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 7.0,
                  ),
                  child: Container(
                    color: ColorManager.lightGrey,
                    height: 30.h,
                    width: 1.w,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: TextFormField(
                    inputFormatters: [LengthLimitingTextInputFormatter(13)],
                    onChanged: ((value) => validateMobile(value)),
                    controller: numbercontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0.h),
                      isDense: true,
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Phone number",
                      hintStyle: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                )
              ],
            ),
          ),
          Text(
            numbererror,
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            width: double.infinity,
            height: 55.sm,
            child: ElevatedButton(
              style: Theme.of(context).elevatedButtonTheme.style,
              onPressed: () async {
                setState(() {
                  loading = true;
                  phoneNumber =
                      countrycodecontroller.text + numbercontroller.text;
                });
                return registeruser(phoneNumber!);
              },
              child: loading == false
                  ? const Text(
                      AppStrings.cont,
                    )
                  : const CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }
}
