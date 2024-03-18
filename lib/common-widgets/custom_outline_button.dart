
import 'package:evolve/resources/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomOutlineButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String text;
  final VoidCallback onPressed;
  final double? radius;
  final double? elevation;
  final Color? btnColor;
  final Color? btnTxtColor;
  final Color? btnBorder;
  double? fontSize;
  FontWeight? fontWeight;

  CustomOutlineButton({
    super.key,
    this.height,
    this.width,
    this.radius,
    this.btnColor,
    this.btnTxtColor,
    this.btnBorder,
    required this.text,
    required this.onPressed,
    this.elevation,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          // padding: MaterialStateProperty.all(EdgeInsets.zero),
          elevation: MaterialStateProperty.all(elevation ?? 0.sp),
          shadowColor: MaterialStateProperty.all(btnBorder),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 10.sp),
            ),
          ),
          side: MaterialStateProperty.all(
            BorderSide(
              color: AppColors.secondaryColor, // Outline color
              width: 1.0, // Outline thickness
            ),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            color: btnTxtColor ?? AppColors.secondaryColor, // Text color
            fontSize: fontSize?.sp??18.sp,
            fontWeight: fontWeight??FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
