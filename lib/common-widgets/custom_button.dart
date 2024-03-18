
import 'package:evolve/resources/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {

  double ? height;
  double ? width;
  final String text;
  final VoidCallback onPressed;
  double ? radius;
  double ? elevation;
  Color ? btnColor;
  Color ? btnTxtColor;
  Color ? btnShadow;
  double? fontSize;
  FontWeight? fontWeight;

  CustomButton({super.key,
    this.height,
    this.width,
    this.radius,
    this.elevation,
    this.btnColor,
    this.fontSize,
    this.fontWeight,
    this.btnTxtColor,
    this.btnShadow,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(elevation??0.sp),
          shadowColor: MaterialStateProperty.all(btnShadow),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius??16.sp),
          )),
          backgroundColor: MaterialStateProperty.all(btnColor??AppColors.buttonColor),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: btnTxtColor ?? AppColors.whiteColor,
            fontSize: fontSize?.sp??16.sp,
            fontWeight: fontWeight??FontWeight.w700
          ),
        ),
      ),
    );
  }
}