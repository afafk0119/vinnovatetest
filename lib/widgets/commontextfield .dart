import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vinnovatetest/utils/colors.dart';
import 'package:vinnovatetest/utils/textstyle.dart';

class CommonTextfield extends StatelessWidget {
  final Widget? child;
  TextEditingController? controller;
  TextInputType? keyboardType;
  String? hintText;
  bool? errorr;
  String? errortext;
  void Function(String)? onChanged;
  FormFieldValidator<String>? validator;
  CommonTextfield(
      {Key? key,
      this.child,
      this.controller,
      this.validator,
      this.hintText,
      this.onChanged,
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.h),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
          width: size.width * 0.8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: TextFormField(
            onChanged: onChanged,
            validator: validator,
            style: TextStyle(color: ColorPalette.primaryColor),
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                labelStyle: FontStyles.labeltext),
          ),
        ),
        SizedBox(
            child: errorr == true
                ? Text(
                    errortext.toString(),
                    style: FontStyles.bule14w400,
                  )
                : null),
        // Text(
        //   "csdc",
        //   style: FontStyles.bule14w400,
        // )
      ],
    );
  }
}
