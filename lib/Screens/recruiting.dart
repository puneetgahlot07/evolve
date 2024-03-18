import 'package:evolve/Screens/detail_screen.dart';
import 'package:evolve/common-widgets/custom_bottom_navigation2.dart';
import 'package:evolve/common-widgets/custom_button.dart';
import 'package:evolve/common-widgets/custom_icon_button_.dart';
import 'package:evolve/controllers/payroll_flow_chart_controller.dart';
import 'package:evolve/controllers/recruiting_controller.dart';
import 'package:evolve/resources/app_assets.dart';
import 'package:evolve/resources/app_color.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class RecruitingScreen extends StatefulWidget {
  const RecruitingScreen({super.key});

  @override
  State<RecruitingScreen> createState() => _RecruitingScreenState();
}

class _RecruitingScreenState extends State<RecruitingScreen> {

  final controller = Get.find<RecruitingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: RecruitingController(),
        // initState: (contr) {},
        builder: (contr) {
          return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                          height: 280.h,
                          child: ClipRRect(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                              child: Image.asset(AppAssets.appBarBg2,fit: BoxFit.cover,width: double.infinity,))),
                      Positioned(
                          top: 48.h,
                          left: 16.sp,
                          child:  GestureDetector(
                            onTap: (){Get.back();},
                            child: Container(
                              height: 40.h,
                              width: 40.h,
                              decoration: const BoxDecoration(
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
                        decoration: const BoxDecoration(
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
                    addRegularTxt('Recruiting',fontSize: 18,color: AppColors.primaryColor),
                    addRegularTxt('12 chapters',fontSize: 14,color: AppColors.txtFieldLabelColor)
                  ],
                ),
                const Spacer(),
                CustomButton(
                    radius: 10,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    text: 'Subscribe Now', onPressed: (){})
              ],
            ).marginSymmetric(horizontal: 16,vertical: 12),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xffF3F3F3),
                  borderRadius: BorderRadius.circular(15)

              ),
              child: TabBar(
                onTap: (int index) {
                   contr.selectedTabIndex = index;
                  contr.update();

                  // log('selectedTabIndex: ${yItemCtrl.selectedTabIndex}');
                },
                controller: contr.controller,
                tabs: contr.myTabs,
                labelStyle: TextStyle(),
                // remove to show magic
                unselectedLabelColor: AppColors.blackColor,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.primaryColor
                ),
                indicatorPadding: EdgeInsets.all(8),
              ),
            ).marginSymmetric(horizontal: 20),
            addHeight(20),

            // addHeight(20),
            if(contr.selectedTabIndex ==0)
            ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: ScrollPhysics(),
                itemCount: controller.recruitingList.length,
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
                              addBoldTxt('${controller.recruitingList[index]['title']}',
                                  maxLines: 1, overflow: TextOverflow.ellipsis,
                                  fontSize: 16,color: AppColors.primaryColor,fontWeight: FontWeight.w500),
                              addRegularTxt('${controller.recruitingList[index]['subTitle']}',
                                  maxLines: 1, overflow: TextOverflow.ellipsis,
                                  fontSize: 12,color: AppColors.greyColor1)
                            ],
                          ).paddingOnly(left: 20.sp),
                        ),
                        Spacer(),
                        if(controller.recruitingList[index]['isImage'])
                        Container(
                          height: 48.h,
                          child: SvgPicture.asset(AppAssets.pdfIcon).marginOnly(right: 16)),

                        if(controller.recruitingList[index]['isButton'])
                        CustomIconButton(icon: AppAssets.trolleyIcon, onPressed: () {  },).marginOnly(right: 8),
                        // CustomIconButton(text: "", onPressed: (){}, iconButton: Icon(Icons.shopping_cart))
                        // CustomButton(
                        //     radius: 10,
                        //     fontWeight: FontWeight.w400,
                        //     fontSize: 12,
                        //     text: 'Purchase Now', 
                        //     onPressed: (){
                        //       Get.to(DetailScreen(
                                
                        //       ));
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
                      // decoration: BoxDecoration(
                      //     border: Border.all(color: AppColors.greyColor),
                      //   shape: BoxShape.circle

                    ),
                  ),
                  Positioned( // star image
                    top: 0,
                    bottom: 0,
                    // left: 0,
                    child: SvgPicture.asset(controller.recruitingList[index]['isFav']==true?AppAssets.starFillIcon:AppAssets.starUnFillIcon),
                  ),
                ],
              ).marginOnly(left: 8,right: 16,bottom: 10.sp);
            }),
              if(contr.selectedTabIndex ==1)
            ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: ScrollPhysics(),
                itemCount: controller.recruitingList.length,
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
                              addBoldTxt('${controller.recruitingList[index]['title']}',
                                  maxLines: 1, overflow: TextOverflow.ellipsis,
                                  fontSize: 16,color: AppColors.primaryColor,fontWeight: FontWeight.w500),
                              addRegularTxt('${controller.recruitingList[index]['subTitle']}',
                                  maxLines: 1, overflow: TextOverflow.ellipsis,
                                  fontSize: 12,color: AppColors.greyColor1)
                            ],
                          ).paddingOnly(left: 20.sp),
                        ),
                        Spacer(),
                        if(controller.recruitingList[index]['isImage'])
                        Container(
                          height: 48.h,
                          child: SvgPicture.asset(AppAssets.pdfIcon).marginOnly(right: 16)),

                        if(controller.recruitingList[index]['isButton'])
                        CustomIconButton(icon: AppAssets.trolleyIcon, onPressed: () {  },).marginOnly(right: 8),
                        // CustomIconButton(text: "", onPressed: (){}, iconButton: Icon(Icons.shopping_cart))
                        // CustomButton(
                        //     radius: 10,
                        //     fontWeight: FontWeight.w400,
                        //     fontSize: 12,
                        //     text: 'Purchase Now', 
                        //     onPressed: (){
                        //       Get.to(DetailScreen(
                                
                        //       ));
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
                      // decoration: BoxDecoration(
                      //     border: Border.all(color: AppColors.greyColor),
                      //   shape: BoxShape.circle

                    ),
                  ),
                  Positioned( // star image
                    top: 0,
                    bottom: 0,
                    // left: 0,
                    child: SvgPicture.asset(controller.recruitingList[index]['isFav']==true?AppAssets.starFillIcon:AppAssets.starUnFillIcon),
                  ),
                ],
              ).marginOnly(left: 8,right: 16,bottom: 10.sp);
            }),
            // addHeight(20),
          ],
        ),
      ); 
        },
      )  ,
       bottomNavigationBar: NavBar2(),
    );
  }
}
