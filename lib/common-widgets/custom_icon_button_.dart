
import 'package:evolve/resources/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconButton extends StatelessWidget {

  double ? height;
  double ? width;
  // final String text;
  final VoidCallback onPressed;
  double ? radius;
  double ? elevation;
  Color ? btnColor;
  // Color ? btnTxtColor;
  Color ? btnShadow;
  final String icon;

  CustomIconButton({super.key,
    this.height,
    this.width,
    this.radius,
    this.btnColor,
    // this.btnTxtColor,
    this.btnShadow,
    // required this.text,
    required this.onPressed, 
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: btnColor ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(radius ?? 10),
    
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8
          ),
          child: Center(
            child: SvgPicture.asset(icon),
          ),
        ),
        
      ),
    );
  }
}