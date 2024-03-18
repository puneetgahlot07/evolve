import 'package:evolve/resources/app_assets.dart';
import 'package:evolve/resources/app_color.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData leadingIcon;
  final VoidCallback leadingOnPressed;
  final IconData trailingIcon;
  final VoidCallback trailingOnPressed;
  final bool? centerTitle;
  final bool? isAction;

  CustomAppBar({
    required this.title,
    required this.leadingIcon,
    required this.leadingOnPressed,
    required this.trailingIcon,
    required this.trailingOnPressed,
    this.centerTitle,
    this.isAction = true
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      centerTitle: centerTitle??false,
      leading: IconButton(
        visualDensity: const VisualDensity(horizontal: -4),
        padding: EdgeInsets.zero,
        onPressed: leadingOnPressed,
        icon: Icon(
          leadingIcon,
          color: AppColors.blackColor,
        ),
      ),
      titleSpacing: 0,
      title: addHeadingTxt(title, fontSize: 16, color: AppColors.blackColor),
      // actions: isAction==true?[
      //   IconButton(
      //     padding: EdgeInsets.zero,
      //     onPressed: trailingOnPressed,
      //     icon: SvgPicture.asset(
      //       AppAssets.notificationIcon,height: 22.sp,width: 22.sp,
      //       color: AppColors.blackColor,
      //     ),
      //   ),
      // ]:[],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

