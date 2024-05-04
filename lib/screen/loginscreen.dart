import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vinnovatetest/data/service/auth.dart';
import 'package:vinnovatetest/provider/auth.dart';
import 'package:vinnovatetest/utils/constant.dart';
import 'package:vinnovatetest/utils/image.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:vinnovatetest/widgets/commonbutton.dart';
import 'package:vinnovatetest/widgets/commontextbutton.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vinnovatetest/widgets/commontextfield%20.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController password = TextEditingController();

  final TextEditingController mail = TextEditingController();
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  bool buttonenbale = false;
  final ValueNotifier<bool> buttonEnabled =
      ValueNotifier<bool>(false); // 1. Define ValueNotifier for buttonEnabled

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _loginKey,
        child: Padding(
          padding: EdgeInsets.only(left: 36.w, right: 36.w),
          child: ListView(
            children: [
              SizedBox(
                height: 50.h,
              ),
              SizedBox(
                  height: 200.h,
                  width: 250.w,
                  child: SvgPicture.asset(Images.login)),
              SizedBox(
                height: 12.h,
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                height: 81.h,
              ),
              CommonTextfield(
                onChanged: (data) {
                  buttonEnabled.value = data.isNotEmpty;
                },
                hintText: EngTitle.mail,
                controller: mail,
              ),
              SizedBox(
                height: 5.h,
              ),
              CommonTextfield(
                onChanged: (data) {
                  buttonEnabled.value = data.isNotEmpty;
                },
                hintText: EngTitle.password,
                controller: password,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CommonTextButton(
                    onPressed: () {},
                    title: EngTitle.forget,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Consumer(builder: (context, ref, child) {
                final authNotifier = ref.watch(authProvider.notifier);
                final authState = ref.watch(authProvider);
                return CommonButton(
                  onPressed: () {
                    authNotifier.login(mail.text.toString(),
                        password.text.toString(), context);
                  },
                  title: EngTitle.login,
                  isEnabled: true,
                );
              }),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(EngTitle.signup1),
                  CommonTextButton(
                    onPressed: () {},
                    title: EngTitle.signup2,
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
