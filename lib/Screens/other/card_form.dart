import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:evolve/common-widgets/custom_appbar_one.dart';
import 'package:evolve/common-widgets/custom_bottom_navigation2.dart';
import 'package:evolve/common-widgets/custom_button.dart';
import 'package:evolve/common-widgets/custom_textfield.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:evolve/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../resources/app_color.dart';

class CardFormScreen extends StatefulWidget {
  const CardFormScreen({super.key});

  @override
  State<CardFormScreen> createState() => _CardFormScreenState();
}

class _CardFormScreenState extends State<CardFormScreen> {
  String? selectedIndex ;
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBarOne(
        title: "Credit & Debit Card",
        centerTitle: true,
        leadingOnTap: () {
          Get.back();
        },
        isAction: false,
        
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(12.0.h),
          child: Column(
            children: [
                // addHeight(400),
                 Stack(
                    children: [
                      CustomTextField(
                
                        // labelText: 'First Name',
                        // controller: controller.fNameCtrl,
                        // suffixIcon: SvgPicture.asset(AppAssets.userIcon).marginAll(
                            // 14),
                      ),
                      Positioned(
                          left: 12.sp,
                          top: 6.sp,
                          child: addBoldTxt('Card number',height: 1.0,fontWeight: FontWeight.w500,fontSize: 11,color: AppColors.txtFieldLabelColor)),
                    ],
                  ),
                 
                  addHeight(20.h),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child:  Stack(
                    children: [
                      CustomTextField(                     
                      ),
                      Positioned(
                          left: 12.sp,
                          top: 6.sp,
                          child: addBoldTxt('Expiration',height: 1.0,fontWeight: FontWeight.w500,fontSize: 11,color: AppColors.txtFieldLabelColor)),
                    ],
                  ),),
                  Spacer(),
                   Expanded(
                        flex: 4,
                        child:  Stack(
                    children: [
                      CustomTextField(                     
                      ),
                      Positioned(
                          left: 12.sp,
                          top: 6.sp,
                          child: addBoldTxt('CVC',height: 1.0,fontWeight: FontWeight.w500,fontSize: 11,color: AppColors.txtFieldLabelColor)),
                    ],
                  ),)
                    ],
                  ),
                  addHeight(20.h),
                  Container(
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: AppColors.txtFieldFillColor ,    
                       borderRadius: BorderRadius.circular(10.sp),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonFormField2(
                                                isExpanded: true,
                                                isDense: true,
                                                decoration: InputDecoration(                 
                                                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10.sp),
                                                    borderSide: BorderSide.none
                                                  ),
                                                  filled: true,
                                                  label: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: addBoldTxt('Country',fontWeight: FontWeight.w500,fontSize: 12.sp,color: AppColors.txtFieldLabelColor),
                                                  ),
                                                  fillColor: AppColors.txtFieldFillColor                                  
                                                ),
                                                onMenuStateChange: (val){                
                                                },
                                                value: selectedIndex ?? null,
                                                items: ['India', 'USA', 'Finland']                                            // Filter out null values
                                                .map((item) => DropdownMenuItem(
                                                value: item,
                                                child: addRegularTxt(item.toString(), fontSize: 14.sp,
                                                 color: AppColors.primaryColor),
                                                ))
                                                .toList(),                           
                                                // validator: (value) {
                                                //   // if (value == null) {
                                                //   //   return  "  "+'Shipment Weight Required'.tr;
                                                //   // }
                                                //   // return null;
                                                // },              
                                                onChanged: (value) {
                                                  setState(() {
                                                    selectedIndex = value;
                                                  });
                                                  // controller.FatchCostValueApi();
                                                  // controller.shipmentWeight = value;
                                      
                                                  // controller.update();
                                                },
                                                onSaved: (value) {
                                                 
                                                },
                                                buttonStyleData: const ButtonStyleData(
                                                  padding: EdgeInsets.only(right: 12),
                                                ),
                                               
                                                dropdownStyleData: const DropdownStyleData(                
                                                  decoration: BoxDecoration(
                                                    color: AppColors.txtFieldFillColor
                                                    // borderRadius: BorderRadius.circular(15),
                                                  ),
                                                ),
                                                menuItemStyleData: const MenuItemStyleData(
                                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                                ),
                                              ),
                    ),
                  ),
                  // Spacer()
                  
                  addHeight(120.h),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 120.h,
        width: Get.height,
        child: Column(children: [
      
                    addBoldTxt('Amount to pay: \$15', fontSize: 16, color: AppColors.primaryColor),
                    addHeight(20.h),
                    CustomButton(
                      height: 60.h,
                      width: Get.width /1.5,
                      text: 'Proceed to Payment', onPressed: (){
                        Get.toNamed(AppRoutes.paymentSuccessScreen);
                      }),
        ]),
      ),
      bottomNavigationBar: NavBar2(),
      );
      
  }
}