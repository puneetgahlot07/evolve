import 'package:evolve/controllers/bottom_bar_controller.dart';
import 'package:evolve/resources/app_assets.dart';
import 'package:evolve/resources/app_color.dart';
import 'package:evolve/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NavBar2 extends StatefulWidget {
  const NavBar2({super.key});

  @override
  State<NavBar2> createState() => _NavBar2State();
}

class _NavBar2State extends State<NavBar2> {
  //  final controller = Get.put(BottomBarController());
  final  controller = Get.find<BottomBarController>();
  @override
  Widget build(BuildContext context) {
    return Container(
          height: Get.height / 10,
          // color: Colors.amber,
          child: 
            Center(
              child: Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: 8.sp,
                  vertical: 6
                ),
                child: Container(
                  height: Get.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.sp),
                    color: AppColors.primaryColor
                     

                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(
                      horizontal: 16.sp
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: (){
                               controller.selectedIndex = 0;
                               controller.update();
                               Future.delayed(Duration(), (){
                                 Get.offAllNamed(AppRoutes.bottomNav);
                               });
                              
                          },
                        child:
                        // controller.selectedIndex == 0 ? 
                        // IntrinsicHeight(
                        //   child: Row(                          
                        //     children: [
                        //       SvgPicture.asset(
                        //       AppAssets.discoverIcon,height: 28.sp,width: 28.sp,
                        //       // color: AppColors,
                        //     ),
                        //     addWidth(10.sp),
                        //     addLightTxt('Discover', 
                        //     fontSize: 14.sp,
                        //     color: AppColors.whiteColor),
                        //      addWidth(10.sp),
                        //   VerticalDivider(
                        //     // indent: 2,
                        //     // endIndent: 1,
                        //     // thickness: 0.9,
                        //     width: 5,
                        //     color: AppColors.whiteColor,
                        //   )
                        //     ],
                        //   ),
                        // ):
                           SvgPicture.asset(
                              AppAssets.discoverIcon,height: 28.sp,width: 28.sp,
                              // color: AppColors,
                            ),
                        ),
                              InkWell(
                          onTap: (){
                               
                               Get.offAllNamed(AppRoutes.bottomNav);
                               
                               Future.microtask(() {
                               Get.find<BottomBarController>().initialized;

                               });

                               Future.delayed(Duration(microseconds: 500),(){

                               Get.find<BottomBarController>().selectedIndex = 1;
                               Get.find<BottomBarController>().update(); 
                               });
                          },
                        child: 
                        //   controller.selectedIndex == 1 ? 
                        // IntrinsicHeight(
                        //   child: Row(                          
                        //     children: [
                        //       SvgPicture.asset(
                        //       AppAssets.cartIcon,height: 28.sp,width: 28.sp,
                        //       // color: AppColors,
                        //     ),
                        //     addWidth(10.sp),
                        //     addLightTxt('Cart', 
                        //     fontSize: 14.sp,
                        //     color: AppColors.whiteColor),
                        //      addWidth(10.sp),
                        //   VerticalDivider(
                        //     // indent: 2,
                        //     // endIndent: 1,
                        //     // thickness: 0.9,
                        //     width: 5,
                        //     color: AppColors.whiteColor,
                        //   )
                        //     ],
                        //   ),
                        // ):
                        SvgPicture.asset(
                                AppAssets.cartIcon,height: 28.sp,width: 28.sp,
                                // color: AppColors,
                            ),
                             ),

                             InkWell(
                              onTap: (){
 Get.offAllNamed(AppRoutes.bottomNav);
                               
                               Future.microtask(() {
                               Get.find<BottomBarController>().initialized;

                               });

                              //  Future.delayed(Duration(microseconds: 500),(){

                               Get.find<BottomBarController>().selectedIndex = 2;
                               Get.find<BottomBarController>().update(); 
                              //  });
                              },
                               child: 
                        //          controller.selectedIndex == 2 ? 
                        // IntrinsicHeight(
                        //   child: Row(                          
                        //     children: [
                        //       SvgPicture.asset(
                        //       AppAssets.favouriteIcon,height: 28.sp,width: 28.sp,
                        //       // color: AppColors,
                        //     ),
                        //     addWidth(10.sp),
                        //     addLightTxt('Favourite', 
                        //     fontSize: 14.sp,
                        //     color: AppColors.whiteColor),
                        //      addWidth(10.sp),
                        //   VerticalDivider(
                        //     // indent: 2,
                        //     // endIndent: 1,
                        //     // thickness: 0.9,
                        //     width: 5,
                        //     color: AppColors.whiteColor,
                        //   )
                        //     ],
                        //   ),
                        // ):
                               SvgPicture.asset(
                                AppAssets.favouriteIcon,height: 28.sp,width: 28.sp,
                                // color: AppColors,
                                                         ),
                             ),
                          InkWell(
                          onTap: (){
                               controller.selectedIndex = 3;
                               controller.update();
                               Get.offAllNamed(AppRoutes.bottomNav);
                          },
                        child:
                        // controller.selectedIndex == 3 ? 
                        // IntrinsicHeight(
                        //   child: Row(                          
                        //     children: [
                        //       SvgPicture.asset(
                        //       AppAssets.userIcon,height: 28.sp,width: 28.sp,
                        //       // color: AppColors,
                        //     ),
                        //     addWidth(10.sp),
                        //     addLightTxt('Profile', 
                        //     fontSize: 14.sp,
                        //     color: AppColors.whiteColor),
                        //      addWidth(10.sp),
                        //   // VerticalDivider(
                        //   //   // indent: 2,
                        //   //   // endIndent: 1,
                        //   //   // thickness: 0.9,
                        //   //   width: 5,
                        //   //   color: AppColors.whiteColor,
                        //   // )
                        //     ],
                        //   ),
                        // ): 
                        SvgPicture.asset(
                                AppAssets.userIcon,height: 28.sp,width: 28.sp,
                                // color: AppColors,
                                                         ),
                             ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        );
  }
}