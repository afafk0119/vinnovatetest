import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vinnovatetest/utils/textstyle.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final double? height;
  final double? width;
  final Color? color;
  final TextStyle? textStyle;
  final bool isEnabled;
  const CommonButton(
      {Key? key,
      this.onPressed,
      required this.title,
      this.height,
      this.width,
      this.textStyle,
      this.color,
      required this.isEnabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: 299.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: isEnabled
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color(0xFF020C5A),
                    Color(0xFF000178),
                  ],
                )
              : LinearGradient(colors: [
                  Color(0xFFD9D9D9),
                  Color(0xFFD9D9D9),
                ])),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.transparent,
              // backgroundColor: isEnabled ?ColorPalette.primaryColor :HexColor('B2B2B2'),
              // fixedSize: Size(width ??271.w, height ?? 42.h),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23.r))),
          onPressed: onPressed,
          child: Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textStyle ?? FontStyles.buttontext,
          )),
    );
  }
}
