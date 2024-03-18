import 'dart:io';

import 'package:evolve/common-widgets/custom_appbar_one.dart';
import 'package:evolve/common-widgets/custom_button.dart';
import 'package:evolve/common-widgets/custom_textfield.dart';
import 'package:evolve/controllers/profile_controller.dart';
import 'package:evolve/resources/app_assets.dart';
import 'package:evolve/resources/app_color.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
 final controller = Get.find<ProfileController>(); 
  @override
  Widget build(BuildContext context) {
    return  GetBuilder(
      init: ProfileController(),
      initState: (_) {},
      builder: (_) {
        return 
    Scaffold(
      appBar: CustomAppBarOne(
        title: 'Edit Profile',
        centerTitle: true,
        isAction: false,
        leadingOnTap: () {
          Get.back();
        },

        // isAction: false,
      ),
      backgroundColor: AppColors.whiteColor,
        body:Center(
          child: SingleChildScrollView(
              child: Form(
                key: controller.editProfileKey,
                child: Padding(
                  padding:  EdgeInsets.symmetric(
                    horizontal: 14.h,
                    vertical: 10.h
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Stack(
                      alignment: Alignment.center,
                         children: [
                      
                       Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,                       
                          ),
                         
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 140.h,
                              width: 150.h,
                              decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                image: DecorationImage(image: controller.profilePhotoPath != "" ? FileImage(File(controller.profilePhotoPath)) : NetworkImage(controller.profileData.data!.image!) as ImageProvider ) 
                              ),                            
                              // child: ,
                              // controller.profilePhotoPath != "" ? Image.file(File(controller.profilePhotoPath)) :  Image.network(controller.profileData.data!.image!)
                            ),
                          ),
                         ),
                         Positioned(
                          bottom: 5,
                          right: 0,
                          left: 110.h,
                          child: InkWell(
                            onTap: (){
                              _addPictureSheetItem(context);
                            },
                            child: SvgPicture.asset(AppAssets.editIcon,height: 40.h,)))
                       ],
                     ),
                     addHeight(20.h),
                       Stack(
                        children: [
                          CustomTextField(
                           
                            controller: controller.fNameCtrl,
                            suffixIcon: SvgPicture.asset(AppAssets.signupUserIcon).marginAll(
                                14),
                                validator: (val){
                                  if(val!.trim().isEmpty){
                                    return "First Name Requried*";
                                  }
                                  else if(val.length < 3){
                                      return "Enter Valid Name*";
                                  }
                                  return null;
                                },
                          ),
                          Positioned(
                              left: 12.sp,
                              top: 6.sp,
                              child: addBoldTxt('First Name',height: 1.0,fontWeight: FontWeight.w500,fontSize: 11,color: AppColors.txtFieldLabelColor)),
                        ],
                      ),
                      addHeight(15.h),
                      Stack(
                        children: [
                          CustomTextField(
                            // labelText: 'Last Name',
                            controller: controller.lNameCtrl,
                            suffixIcon: SvgPicture.asset(AppAssets.signupUserIcon).marginAll(
                                14),
                                validator: (val){
                                  if(val!.trim().isEmpty){
                                    return "Last Name Requried*";
                                  }
                                  else if(val.length < 3){
                                      return "Enter Valid Name*";
                                  }
                                  return null;
                                },
                                
                          ),
                          Positioned(
                              left: 12.sp,
                              top: 6.sp,
                              child: addBoldTxt('Last Name',height: 1.0,fontWeight: FontWeight.w500,fontSize: 11,color: AppColors.txtFieldLabelColor)),
                        ],
                      ),
                      addHeight(15.h),
                        Stack(
                      children: [
                        CustomTextField(
                          // labelText: 'Company',
                          controller: controller.companyCtrl,
                             validator: (val){
                                if(val!.trim().isEmpty){
                                  return "Company Name Requried*";
                                }
                               
                                return null;
                              },
                        ),
                        Positioned(
                            left: 12.sp,
                            top: 6.sp,
                            child: addBoldTxt('Company',height: 1.0,fontWeight: FontWeight.w500,fontSize: 11,color: AppColors.txtFieldLabelColor)),
                      ],
                    ),
                    addHeight(15.h),
                    Stack(
                      children: [
                        CustomTextField(
                          // labelText: '',
                          controller: controller.businessCtrl,
                             validator: (val){
                                if(val!.trim().isEmpty){
                                  return "Business Title Name Requried*";
                                }
                               
                                return null;
                              },                        
                        ),
                        Positioned(
                            left: 12.sp,
                            top: 6.sp,
                            child: addBoldTxt('Business Title',height: 1.0,fontWeight: FontWeight.w500,fontSize: 11,color: AppColors.txtFieldLabelColor)),
                      ],
                    ),
                    addHeight(40.h),
                    CustomButton(
                      width: Get.width / 1.3,
                      height: 50.h,
                      text: "Save", onPressed: (){
                          if(controller.editProfileKey.currentState!.validate()){
                            controller.EditProfileApi();  
                          }
                      })
                
                    ],
                  ),
                ),
              ),
          ),
        )
        );});
  }



  void _addPictureSheetItem(BuildContext context) {
    final controller = Get.find<ProfileController>();
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title:  Text('Add Picture'.tr, style: TextStyle(
          fontWeight: FontWeight.w700,
        ),),
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancel'.tr,
           
          ),
        ),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            onPressed: () async {
              Navigator.of(context).pop();
               Future.delayed(Duration.zero, () async {
                 final res =  await controller.getVideoToGallery();
                                              if(res != null){                                                                                                                                            
                                                controller.profilePhotoPath = res.path;                                                 
                                                controller.update(); 
                                                
                                  }                               
             });
            //  Navigator.pop(context); 
              
             
            },
            child: addBoldTxt(
              'Choose Form Gallery'.tr,
              fontSize: 18
              // style: HeadingCustom(color: Colors.blue),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {
             Navigator.pop(context);
             Future.delayed(Duration.zero, () async {
               final res = await controller.getImageToCamera();
                                             if(res != null){
              //                                 controller.shipingitemPhotoCtrl.text = res.name;
                                              controller.profilePhotoPath = res.path;  
              //                                 controller.photo_of_item_file_type =  "image";   
              //                                 controller.update(); 
               Navigator.pop(context);
                                             }
                     
             });            
            },
            child: addBoldTxt('Take a Picture'.tr,
            fontSize: 18
                // style: HeadingCustom(color: Colors.blue)
              ),
          ),
        ],
      ),
    );
}

}