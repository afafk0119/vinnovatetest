import 'package:flutter/material.dart';
import 'package:vinnovatetest/utils/textstyle.dart';

class CommonTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final Color? color;
  final TextStyle? textStyle;
  const CommonTextButton({
    Key? key,
    this.onPressed,
    required this.title,
    this.textStyle,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        maxLines: 1,
        style: textStyle ?? FontStyles.textbutton,
      ),
    );
  }
}
