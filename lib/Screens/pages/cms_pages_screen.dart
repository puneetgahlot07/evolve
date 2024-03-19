import 'dart:io';

import 'package:evolve/Screens/other/about_me.dart';
import 'package:evolve/Screens/other/change_password.dart';
import 'package:evolve/Screens/other/edit_profile.dart';
import 'package:evolve/common-widgets/custom_appbar_one.dart';
import 'package:evolve/common-widgets/custom_button.dart';
import 'package:evolve/controllers/profile_controller.dart';
import 'package:evolve/main.dart';
import 'package:evolve/resources/app_assets.dart';
import 'package:evolve/resources/app_color.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:evolve/resources/utils.dart';
import 'package:evolve/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CMSPagesScreen extends StatefulWidget {
  const CMSPagesScreen({super.key});

  @override
  State<CMSPagesScreen> createState() => _CMSPagesScreenState();
}

class _CMSPagesScreenState extends State<CMSPagesScreen> {
  final controller = Get.find<ProfileController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getCMSPagesApi(slug: Get.arguments['slug']);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.htmlText.value = '';
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: CustomAppBarOne(
          title: '${Get.arguments['cmsPagesTitle']}',
          centerTitle: true,
          isAction: false,
          leadingOnTap: () {
            Get.back();
          },
        ),
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(2),
              child: Html(data: controller.htmlText.value, style: {
                "body": Style(
                  color: AppColors.blackColor,
                  fontSize: FontSize(15.0.sp),
                  fontWeight: FontWeight.w500,
                ),
              })),
        )));
  }

  subScreen(String title, void Function() onTap, {bool divide = true}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 6.sp),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: addHeadingTxtMedium(title,
                        // maxLines: 2,
                        color: AppColors.primaryColor,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16.sp)),
                SvgPicture.asset(AppAssets.rightArrowIcon),
              ],
            ),
            addHeight(5),
            if (divide)
              Divider(
                color: AppColors.greyColor,
              )
          ],
        ).marginSymmetric(horizontal: 16),
      ),
    );
  }
}
