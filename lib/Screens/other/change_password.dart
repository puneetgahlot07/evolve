import 'package:evolve/common-widgets/custom_appbar_one.dart';
import 'package:evolve/common-widgets/custom_button.dart';
import 'package:evolve/common-widgets/custom_textfield.dart';
import 'package:evolve/controllers/profile_controller.dart';
import 'package:evolve/resources/app_assets.dart';
import 'package:evolve/resources/app_color.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final controller = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
      appBar: CustomAppBarOne(
        title: 'Change Password',
        centerTitle: true,
        isAction: false,
        leadingOnTap: () {
          // Get.back();
        },

        // isAction: false,
      ),
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: GetBuilder<ProfileController>(
          // init: MyController(),
          // initState: (_) {},
          builder: (_) {
            return Form(
                key: controller.changePassKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                    children: [
                       addHeight(15.h),
                            Stack(
                              children: [
                                CustomTextField(
                                  // labelText: 'Password',
                                  controller: controller.passwordCtrl,
                                  obscureText: controller.obscureText,
                                  suffixIcon: SvgPicture.asset(controller.obscureText ?  AppAssets.eyeOff: AppAssets.eyeOpen).marginAll(14),
                                  onTapSuffixIcon: controller.onPassSuffixTap,
                                   validator: (value){
                                       // ignore: unnecessary_null_comparison
                                       if (value!.trim() == null || value.trim().isEmpty) {
                              return 'Password is Required*';
                            }
                            if(value.length < 6  && value.length > 17){
                              return "Minimum 6 - 16 characters";
                            }
                            // if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]{8,}$').hasMatch(value)) {
                            //   return 'Minimum 8 characters, at least 1 upper case, 1 lower case,1 number and 1 special character.'.tr;
                    // }
                    return null; // Return null if the password is valid.
                  
                            
                            },
                        ),
                        Positioned(
                            left: 12.sp,
                            top: 6.sp,
                            child: addBoldTxt('Password',height: 1.0,fontSize: 11,fontWeight: FontWeight.w500,color: AppColors.txtFieldLabelColor,)),
                      ],
                    ),
                    addHeight(15.h),
                    Stack(
                      children: [
                        CustomTextField(
                          // labelText: 'Password',
                          controller:  controller.confPasswordCtrl,
                          obscureText: controller.confObscureText,
                          suffixIcon: SvgPicture.asset(controller.obscureText ?  AppAssets.eyeOff: AppAssets.eyeOpen).marginAll(14),
                          onTapSuffixIcon: controller.confOnPassSuffixTap,
                           validator: (value){
                               // ignore: unnecessary_null_comparison
                               if (value!.trim() == null || value.trim().isEmpty) {
                      return 'Password is Required*';
                    }
                    if(controller.confPasswordCtrl.text.trim() != controller.passwordCtrl.text.trim() ){
                      return "Password Not Match";
                    }
                    if(value.length < 6  && value.length > 17){
                      return "Minimum 6 - 16 characters";
                    }
                    // if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]{8,}$').hasMatch(value)) {
                    //   return 'Minimum 8 characters, at least 1 upper case, 1 lower case,1 number and 1 special character.'.tr;
                    // }
                    return null; // Return null if the password is valid.
                  
                            
                            },
                        ),
                        Positioned(
                            left: 12.sp,
                            top: 6.sp,
                            child: addBoldTxt('Confirm Password',height: 1.0,fontSize: 11,fontWeight: FontWeight.w500,color: AppColors.txtFieldLabelColor,)),
                      ],
                    ),
                    addHeight(50.h),
                    CustomButton(
                      height: 52.h,
                        width: Get.width /1.3,
                        text: 'Change',
                        fontWeight: FontWeight.w400,
                        onPressed: (){
                             if(controller.changePassKey.currentState!.validate()){                                    
                                        controller.ChangePasswordApi();
                                      }
                        }),
            ],
                  ),
          )); 
          },
        )
      ),
      
    );
  }
}