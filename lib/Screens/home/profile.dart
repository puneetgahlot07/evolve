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
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final profile = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return 
     GetBuilder(
      init: ProfileController(),
      initState: (_) {},
      builder: (_) {
        return 
    Scaffold(
      appBar: CustomAppBarOne(
        title: 'My Profile',
        centerTitle: true,
        isAction: false,
        leadingOnTap: () {
          // Get.back();
        },

        // isAction: false,
      ),
      backgroundColor: AppColors.whiteColor,
        body:SingleChildScrollView(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // addHeight(50.h),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     addHeadingTxtMedium('My Profile', fontSize: 18.sp, fontWeight: FontWeight.w700, color: AppColors.primaryColor ),
              //   ],
              // ),
               addHeight(30.h),
               Stack(
                alignment: Alignment.center,
        
                 children: [
                   Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                     color: AppColors.borderColor,
                     width: 2.sp
                      )
                    ),
                    // radius: 90,                
                    // backgroundColor: Colors.black12,
                    child:   Container(
                              height: 140.h,
                              width: 150.h,
                              decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                image: DecorationImage(image: profile.profileData.data!.image != null || profile.profileData.data!.image != "" ? NetworkImage(profile.profileData.data!.image!) : AssetImage(AppAssets.profileUserIcon) as ImageProvider ) 
                              ),    ),
                   ),
                   Positioned(
                    bottom: 5,
                    right: 0,
                    left: 110.h,
                    child: InkWell(
                        onTap: (){
                      Get.to(EditProfile());
                    },
                      child: SvgPicture.asset(AppAssets.editIcon,height: 40.h,)))
                 ],
               ),
               addHeight(20.h),
               addBoldTxt(profile.profileData.data!.name ?? "", color: AppColors.primaryColor, fontSize: 18.sp),
                addHeight(10.h),
               addRegularTxt(profile.profileData.data!.email ??  "", color: AppColors.greyColor2, fontSize: 14.sp),
                addHeight(20.h),
                Padding(
                  padding:  EdgeInsets.symmetric(
                    horizontal: 12.h
                  ),
                  child: Container(                    
                    // height: 300.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.h),
                      border: Border.all(
                        color: AppColors.borderColor,
                      )                      
                    ),
                    child:                     
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      Container(
                          height: 45.h,
                          decoration: BoxDecoration(
                             borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.h),
                              topRight: Radius.circular(20.h)
                             ),
                            color: AppColors.greyColor3,
                          ),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              addWidth(20.h),
                              addRegularTxt('General Settings', fontSize: 14.sp, color: AppColors.blackColor2),
                              
                            ],
                          ),
                      ),                                                                                                              
                      addHeight(10),
                      subScreen("About Me", () {
                        Get.to(AboutMe());
                       }),
                      subScreen("Change Password", () { 
                        Get.to(ChangePassword());
                      }),
                      subScreen("Purchased Items ", () { }),
                      subScreen("Manage Subscription", () { 
                        Get.toNamed(AppRoutes.subscriptionScreen);
                      }, divide: false),
                      addHeight(10.h),
                    ]),
                  ),
                ),
                addHeight(30.sp),
                 Padding(
                  padding:  EdgeInsets.symmetric(
                    horizontal: 12.h
                  ),
                  child: Container(                    
                    // height: 300.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.h),
                      border: Border.all(
                        color: AppColors.borderColor,
                      )                      
                    ),
                    child:                     
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      Container(
                          height: 45.h,
                          decoration: BoxDecoration(
                             borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.h),
                              topRight: Radius.circular(20.h)
                             ),
                            color: AppColors.greyColor3,
                          ),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              addWidth(20.h),
                              addRegularTxt('Information', fontSize: 14.sp, color: AppColors.blackColor2),
                              
                            ],
                          ),
                      ),                                                                                                              
                      addHeight(10),
                      // subScreen("About Me", () { }),
                      subScreen("Terms & Conditions", () { }),
                      subScreen("Privacy Policy", () { 
                        
                      }),
                       subScreen("All Purchases ", () { 
                        Get.toNamed(AppRoutes.helpDeskScreen);
                      }),
                       subScreen("Helpdesk", () { 
                        Get.toNamed(AppRoutes.helpDeskScreen);
                      }),
                      
                      subScreen("Share This App", () { }, divide: false),
                      addHeight(10.h),
                    ]),
                  ),
                ),
                addHeight(20.h),
                CustomButton(
                  width: Get.width /1.3,
                  height: 50.h,
                  text: 'Logout', onPressed: (){
                    globalToken = "";
                    clearLocalStorage();
                    Get.offAllNamed(AppRoutes.loginScreen);
                  }),
                addHeight(20.h),
            ],
          ),
         
       
    ));} 
    );
      
  }


  subScreen(
    String title,
    void Function() onTap,
    {bool divide = true}
  ){
    return InkWell(
      onTap: onTap,
      child: Padding(
                          padding:  EdgeInsets.symmetric(
                            vertical: 12.sp,
                            horizontal: 6.sp
                          ),
                          child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [                                
                                    Expanded(child: addHeadingTxtMedium(title,
                                        // maxLines: 2,
                                        color: AppColors.primaryColor,
                                        overflow: TextOverflow.ellipsis,fontSize: 16.sp)),
                                         SvgPicture.asset(AppAssets.rightArrowIcon),   
                        
                                  ],
                                ),
                                addHeight(5),
                                if(divide)
                                Divider(color: AppColors.greyColor,)
                        
                              ],
                            ).marginSymmetric(horizontal: 16),
                        ),
    );
  }
}
