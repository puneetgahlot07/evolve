import 'package:evolve/resources/app_color.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/bottom_bar_controller.dart';

// import '../resources/local_storage.dart';
// import '../resources/utils.dart';
import '../controllers/your_items_controller.dart';
import '../resources/app_assets.dart';

class CustomBottomNav extends StatelessWidget {
  CustomBottomNav({Key? key}) : super(key: key);

  // final GlobalKey<ScaffoldState> key = GlobalKey();
  final controller = Get.find<BottomBarController>();

  //  String token = getValue(LocalStorage.TOKEN);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomBarController>(builder: (controller) {
      // if()
      return Scaffold(
        backgroundColor: AppColors.whiteColor,        
        body: controller.widgetOptions.elementAt(controller.selectedIndex),
        bottomNavigationBar: SizedBox(
          height: Get.height / 10,
          // color: Colors.amber,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 6),
              child: Container(
                height: Get.height,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.sp),
                    color: AppColors.primaryColor),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.selectedIndex = 0;
                          controller.update();
                        },
                        child: controller.selectedIndex == 0
                            ? IntrinsicHeight(
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppAssets.discoverIcon, height: 28.sp,
                                      width: 28.sp,
                                      // color: AppColors,
                                    ),
                                    addWidth(10.sp),
                                    addLightTxt('Discover',
                                        fontSize: 14.sp,
                                        color: AppColors.whiteColor),
                                    addWidth(10.sp),
                                    const VerticalDivider(
                                      // indent: 2,
                                      // endIndent: 1,
                                      // thickness: 0.9,
                                      width: 5,
                                      color: AppColors.whiteColor,
                                    )
                                  ],
                                ),
                              )
                            : SvgPicture.asset(
                                AppAssets.discoverIcon, height: 28.sp,
                                width: 28.sp,
                                // color: AppColors,
                              ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.selectedIndex = 1;
                          controller.update();
                        },
                        child: controller.selectedIndex == 1
                            ? IntrinsicHeight(
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppAssets.cartIcon, height: 28.sp,
                                      width: 28.sp,
                                      // color: AppColors,
                                    ),
                                    addWidth(10.sp),
                                    addLightTxt('Cart',
                                        fontSize: 14.sp,
                                        color: AppColors.whiteColor),
                                    addWidth(10.sp),
                                    const VerticalDivider(
                                      // indent: 2,
                                      // endIndent: 1,
                                      // thickness: 0.9,
                                      width: 5,
                                      color: AppColors.whiteColor,
                                    )
                                  ],
                                ),
                              )
                            : SvgPicture.asset(
                                AppAssets.cartIcon, height: 28.sp, width: 28.sp,
                                // color: AppColors,
                              ),
                      ),
                      InkWell(
                        onTap: () {
                          if(controller.selectedIndex != 2){
                            final yourItemController = Get.find<YourItemsController>();
                            yourItemController.selectedTabIndex = 0;
                            yourItemController.controller.animateTo(0);
                          }
                          controller.selectedIndex = 2;
                          controller.update();
                        },
                        child: controller.selectedIndex == 2
                            ? IntrinsicHeight(
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppAssets.favouriteIcon, height: 28.sp,
                                      width: 28.sp,
                                      // color: AppColors,
                                    ),
                                    addWidth(10.sp),
                                    addLightTxt('Favourite',
                                        fontSize: 14.sp,
                                        color: AppColors.whiteColor),
                                    addWidth(10.sp),
                                    const VerticalDivider(
                                      // indent: 2,
                                      // endIndent: 1,
                                      // thickness: 0.9,
                                      width: 5,
                                      color: AppColors.whiteColor,
                                    )
                                  ],
                                ),
                              )
                            : SvgPicture.asset(
                                AppAssets.favouriteIcon, height: 28.sp,
                                width: 28.sp,
                                // color: AppColors,
                              ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.selectedIndex = 3;
                          controller.update();
                        },
                        child: controller.selectedIndex == 3
                            ? IntrinsicHeight(
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppAssets.userIcon, height: 28.sp,
                                      width: 28.sp,
                                      // color: AppColors,
                                    ),
                                    addWidth(10.sp),
                                    addLightTxt('Profile',
                                        fontSize: 14.sp,
                                        color: AppColors.whiteColor),
                                    addWidth(10.sp),
                                    // VerticalDivider(
                                    //   // indent: 2,
                                    //   // endIndent: 1,
                                    //   // thickness: 0.9,
                                    //   width: 5,
                                    //   color: AppColors.whiteColor,
                                    // )
                                  ],
                                ),
                              )
                            : SvgPicture.asset(
                                AppAssets.userIcon, height: 28.sp, width: 28.sp,
                                // color: AppColors,
                              )
                      )
                    ]
                  )
                )
              )
            )
          )
        )
      );
    });
  }
}
