import 'package:evolve/common-widgets/custom_appbar_one.dart';
import 'package:evolve/common-widgets/custom_bottom_navigation2.dart';
import 'package:evolve/controllers/choose_category_controller.dart';
import 'package:evolve/resources/app_assets.dart';
import 'package:evolve/resources/app_color.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:evolve/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChooseCategory extends StatefulWidget {
  const ChooseCategory({super.key});

  @override
  State<ChooseCategory> createState() => _ChooseCategoryState();
}

class _ChooseCategoryState extends State<ChooseCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarOne(
        isAction: false,
        leadingOnTap: () {
          Get.back();
        },
      ),
      backgroundColor: AppColors.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          addBoldTxt('Choose Categories', fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor),
          addHeight(30),
          GetBuilder<ChooseCategoryController>(builder: (catCtrl) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: GestureDetector(
                    onTap: (){
                      catCtrl.selectedCat=0;
                      catCtrl.update();
                      // Get.toNamed(AppRoutes.yourItemsScreen);
                    },
                    child: Container(

                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          // boxShadow: [
                          //   BoxShadow(
                          //       color: Colors.black.withOpacity(0.2),
                          //       spreadRadius: 0.5.sp,
                          //       blurRadius: 4.sp)
                          // ],
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: catCtrl.selectedCat==0?AppColors.primaryColor:AppColors.greyColor
                          )
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          SizedBox(

                              height: 70.h,
                              width: 70.h,
                              child: SvgPicture.asset(AppAssets.pdfIcon2)),
                          addRegularTxt(
                              'Trainings',fontSize: 15, color: AppColors.primaryColor)
                        ],
                      ).marginSymmetric(vertical: 22, horizontal: 28),
                    ),
                  ),
                ),
                // addWidth(width)
                Flexible(
                  child: GestureDetector(
                    onTap: (){
                      catCtrl.selectedCat=1;
                      catCtrl.update();
                      Get.toNamed(AppRoutes.payrollFlowChartScreen);
                    },
                    child: Container(

                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          // boxShadow: [
                          //   BoxShadow(
                          //       color: Colors.black.withOpacity(0.2),
                          //       spreadRadius: 0.5.sp,
                          //       blurRadius: 4.sp)
                          // ],
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: catCtrl.selectedCat==1?AppColors.primaryColor:AppColors.greyColor
                          )
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          SizedBox(
                              height: 70.h,
                              width: 70.h,
                              child: SvgPicture.asset(AppAssets.cateIcon2)),
                          addRegularTxt('Process Flows', fontSize: 15,
                              color: AppColors.primaryColor,
                              textAlign: TextAlign.center)
                        ],
                      ).marginSymmetric(vertical: 22, horizontal: 12),
                    ),
                  ),
                ),
              ],
            );
          })

        ],
      ),
       bottomNavigationBar: NavBar2(),
    );
  }
}
