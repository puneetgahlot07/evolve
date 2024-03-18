

import 'package:action_slider/action_slider.dart';
import 'package:evolve/controllers/splash_controller.dart';
import 'package:evolve/resources/app_assets.dart';
import 'package:evolve/resources/app_color.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:evolve/resources/utils.dart';
import 'package:evolve/routers/app_routers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Image.asset(AppAssets.splashBg,fit: BoxFit.cover,height: MediaQuery.of(context).size.height*0.40,width: double.infinity,),
            addHeight(10.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppAssets.splashLogo, height: MediaQuery.of(context).size.height*0.20),
                addHeight(30.h),
                addBoldTxt('Evolving for the future',fontSize: 24),
                addHeight(80.h),
                Container(
                  // height: 45.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.splashBtnBorder
                  ),
                  child: ActionSlider.standard(
                    width: MediaQuery.of(context).size.width * 52 / 100,
                    height: 43.h,
                    sliderBehavior: SliderBehavior.move,
                    actionThreshold: 0.4,
                    // reverseSlideAnimationCurve: Curves.linear,
                    backgroundColor: AppColors.primaryColor,
                    icon: SvgPicture.asset(AppAssets.fwdIconSplash),
                    toggleColor: Colors.white,
                    actionThresholdType: ThresholdType.release,
                    child: addRegularTxt('Get Started',textAlign: TextAlign.center,color: AppColors.whiteColor),
                    action: (controller) async {
                      Get.offAllNamed(AppRoutes.loginScreen);

                    },
                  ).marginAll(2),
                ),

              ],
            ).marginSymmetric(horizontal: 20.sp)
          ],
        ),
      ),
    );
  }
}