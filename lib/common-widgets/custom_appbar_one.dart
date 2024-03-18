import 'package:evolve/resources/app_assets.dart';
import 'package:evolve/resources/app_color.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomAppBarOne extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final double? toolbarHeight;
  void Function()? leadingOnTap;
  void Function()? trailingOnTap;
  final bool? centerTitle;
  final String? title;
  final bool? isAction;

  // final IconData leadingIcon;
  // final VoidCallback leadingOnPressed;
  // final IconData trailingIcon;
  // final VoidCallback trailingOnPressed;

  CustomAppBarOne({
    this.toolbarHeight = 90,
    this.backgroundColor,
    this.leadingOnTap,
    this.trailingOnTap,
    this.centerTitle,
    this.title = '',
    this.isAction = true

    // required this.leadingIcon,
    // required this.leadingOnPressed,
    // required this.trailingIcon,
    // required this.trailingOnPressed,
    // this.centerTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: toolbarHeight,
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: 0,
      centerTitle: centerTitle??false,
      leading: GestureDetector(
        onTap: leadingOnTap,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.greyColor)
          ),
          child: SvgPicture.asset(AppAssets.popIcon,).marginAll(8),
        ),
      ).paddingOnly(left: 16),
      // titleSpacing: 0,
      title: addHeadingTxtMedium(title!, fontSize: 18, color: AppColors.primaryColor,fontWeight: FontWeight.w500),
      actions: isAction==true?[
        GestureDetector(
          onTap: trailingOnTap,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.greyColor)
            ),
            child: SvgPicture.asset(AppAssets.searchIcon,).marginAll(8),
          ),
        ).paddingOnly(left: 8,right: 16)
      ]:[],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

