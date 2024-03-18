import 'package:evolve/common-widgets/custom_appbar_one.dart';
import 'package:evolve/common-widgets/custom_bottom_navigation2.dart';
import 'package:evolve/common-widgets/custom_button.dart';
import 'package:evolve/resources/app_assets.dart';
import 'package:evolve/resources/app_color.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:evolve/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarOne(
        isAction: false,
        leadingOnTap: (){
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addHeight(20),
            addHeadingTxt('Recruiting',fontSize: 20,fontWeight: FontWeight.w600,color: AppColors.primaryColor),
            addHeight(20),
            addRegularTxt('It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.',
            letterSpacing: 1.7,
            height: 1.6,
            fontSize: 14),
            addHeight(20),
            Container(
                height: 230.h,
                width: double.infinity,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(AppAssets.planBGImg))),
            addHeight(20),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                Row(
                  children: [
                    // Tips and Tricks Ask to help desk questions
                    Icon(Icons.check,size: 14,color: AppColors.primaryColor,),
                    addWidth(12.h),
                    addRegularTxt('Process Flow',fontSize: 14)
                  ],
                ),
                addHeight(16),
                Row(
                  children: [
                    // Tips and Tricks Ask to help desk questions
                    Icon(Icons.check,size: 14,color: AppColors.primaryColor,),
                    addWidth(12.h),
                    addRegularTxt('Tips and Tricks',fontSize: 14)
                  ],
                ),
                addHeight(16),
                Row(
                  children: [
                    // Tips and Tricks Ask to help desk questions
                    Icon(Icons.check,size: 14,color: AppColors.primaryColor,),
                    addWidth(12.h),
                    addRegularTxt('Ask to help desk questions',fontSize: 14)
                  ],
                ),
              ],
            ),
            addHeight(24),
            Divider(),
             addHeight(10),
            Center(child: addBoldTxt('Price: \$15',color: AppColors.primaryColor, fontSize: 16)),
            addHeight(20),
            Center(child: CustomButton(
                radius: 20,
                height: 52.h,
                width: Get.width*0.8,
                text: 'Subscribe to Recruiting', onPressed: (){
                  Get.toNamed(AppRoutes.paymentSuccessScreen);
            })),
            addHeight(20),
          ],
        ).marginSymmetric(horizontal: 20),
      ),
       bottomNavigationBar: NavBar2(),
    );
  }
}
