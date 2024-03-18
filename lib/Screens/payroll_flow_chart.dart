import 'package:evolve/Screens/other/methodology_details.dart';
import 'package:evolve/common-widgets/custom_bottom_navigation2.dart';
import 'package:evolve/common-widgets/custom_button.dart';
import 'package:evolve/common-widgets/custom_icon_button_.dart';
import 'package:evolve/controllers/payroll_flow_chart_controller.dart';
import 'package:evolve/resources/app_assets.dart';
import 'package:evolve/resources/app_color.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:evolve/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'subscription_screen.dart';


class PayrollFlowChart extends StatefulWidget {
  const PayrollFlowChart({super.key});

  @override
  State<PayrollFlowChart> createState() => _PayrollFlowChartState();
}

class _PayrollFlowChartState extends State<PayrollFlowChart> {

  final controller = Get.find<PayRollFlowChartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    height: 280.h,
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                        child: Image.asset(AppAssets.appBarBg,fit: BoxFit.cover,width: double.infinity,))),
                Positioned(
                    top: 48.h,
                    left: 16.sp,
                    child:  GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.whiteColor
                          // border: Border.all(color: AppColors.greyColor)
                        ),
                        child: SvgPicture.asset(AppAssets.popIcon,).marginAll(8),
                      ),
                    )),
                Positioned(
                    top: 48.h,
                    right: 16.sp,
                    child:  GestureDetector(
                      onTap: (){},
                      child: Container(
                        height: 40.h,
                        width: 40.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.whiteColor
                          // border: Border.all(color: AppColors.greyColor)
                        ),
                        child: SvgPicture.asset(AppAssets.searchIcon,).marginAll(8),
                      ),
                    )),
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addRegularTxt('Payroll - Flow Chart',fontSize: 18,color: AppColors.primaryColor),
                    addRegularTxt('8 flow charts',fontSize: 14,color: AppColors.txtFieldLabelColor)
                  ],
                ),
                Spacer(),
                CustomButton(
                    radius: 10,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    text: 'Subscribe Now', onPressed: (){
                      
                })
              ],
            ).marginSymmetric(horizontal: 16,vertical: 12),
            addHeight(20),
            ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: ScrollPhysics(),
                itemCount: controller.payRollFlowList.length,
                itemBuilder: (context,int index){
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      // color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.greyColor)
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 60,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              addBoldTxt('${controller.payRollFlowList[index]['title']}',
                                  maxLines: 1, overflow: TextOverflow.ellipsis,
                                  fontSize: 16,color: AppColors.primaryColor,fontWeight: FontWeight.w500),
                                  addRegularTxt('${controller.payRollFlowList[index]['subTitle']}',
                                  maxLines: 1, overflow: TextOverflow.ellipsis,
                                  fontSize: 12,color: AppColors.greyColor1)
                            ],
                          ).paddingOnly(left: 20.sp),
                        ),
                        Spacer(),
                        if(controller.payRollFlowList[index]['isImage'])
                        Container(
                          height: 48.h,
                          child: SvgPicture.asset(AppAssets.img2).marginOnly(right: 16)),

                        if(controller.payRollFlowList[index]['isButton'])
                         CustomIconButton(icon: AppAssets.trolleyIcon, onPressed: () {  
                          Get.to(MethodologyDetailScreen()); 
                          },).marginOnly(right: 8),
                        // CustomButton(
                        //     radius: 10,
                        //     fontWeight: FontWeight.w400,
                        //     fontSize: 12,
                        //     text: 'Purchase Now', onPressed: (){
                        //       Get.to(MethodologyDetailScreen());
                        // }).marginOnly(right: 16),
                      ],
                    ).paddingSymmetric(vertical: 4),
                  ).marginOnly(left: 8),

                  Positioned(
                    top: 0,
                    bottom: 0,
                    // left: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 24.h,
                        width: 24.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: AppColors.greyColor),
                            shape: BoxShape.circle

                        ),
                        // child: SvgPicture.asset(AppAssets.starFillIcon),
                      ),
                    ),
                  ),
                  Positioned( // ho hide shape
                    top: 0,
                    bottom: 0,
                    // left: 0,
                    child: Container(
                      height: 20.h,
                      width: 8.h,
                      color: Colors.white,                     
                    ),
                  ),
                  Positioned( // star image
                    top: 0,
                    bottom: 0,
                    // left: 0,
                    child: SvgPicture.asset(controller.payRollFlowList[index]['isFav']==true?AppAssets.starFillIcon:AppAssets.starUnFillIcon),
                  ),
                ],
              ).marginOnly(left: 8,right: 16,bottom: 10.sp);
            }),
            addHeight(20),
          ],
        ),
      ),
       bottomNavigationBar: NavBar2(),
    );
  }
}
