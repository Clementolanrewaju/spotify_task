import 'package:flutter/material.dart';

import '../../../utils/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final bool expanded;
  final String text;
  final Color? color;
  final BorderRadius? radius;
  final Border? border;
  final VoidCallback onPressed;
  final Color? textColor;
  final EdgeInsets? padding;
  final bool Function()? validator;
  final double? width;
  final AppColor appColor;

  const CustomButton({
    Key? key,
    this.expanded = false,
    required this.text,
    required this.appColor,
    this.color,
    required this.onPressed,
    this.textColor,
    this.padding,
    this.validator,
    this.radius,
    this.border,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? (expanded ? double.maxFinite : null),
      decoration: BoxDecoration(
        borderRadius: radius,
        border: border,
      ),
      child: ElevatedButton(
        onPressed: (validator == null ? true : validator!()) ? onPressed : null,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
          ),
          elevation: MaterialStateProperty.all(0.0),
          backgroundColor: (validator == null ? true : validator!())
              ? MaterialStateProperty.all(color ?? appColor.primaryColor)
              : MaterialStateProperty.all(
                  (color ?? appColor.primaryColor).withOpacity(0.5),
                ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
