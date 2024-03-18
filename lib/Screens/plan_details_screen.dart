import 'package:evolve/common-widgets/custom_appbar_one.dart';
import 'package:evolve/common-widgets/custom_bottom_navigation2.dart';
import 'package:evolve/common-widgets/custom_button.dart';
import 'package:evolve/controllers/discover_controller.dart';
import 'package:evolve/resources/app_assets.dart';
import 'package:evolve/resources/app_color.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:evolve/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PlanDetailsScreen extends StatefulWidget {
  const PlanDetailsScreen({super.key});

  @override
  State<PlanDetailsScreen> createState() => _PlanDetailsScreenState();
}

class _PlanDetailsScreenState extends State<PlanDetailsScreen> {
  final controller = Get.find<DiscoverController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarOne(
        isAction: false,
        leadingOnTap: (){
          Get.back();
        },
      ),
      body: GetBuilder(
        init: DiscoverController(),
        initState: (_) {},
        builder: (_) {
          return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addHeadingTxt(controller.planSeletedIndex['title']!.toString(),fontSize: 20,fontWeight: FontWeight.w600,color: AppColors.primaryColor),
                  addHeight(10),
                  addRegularTxt(controller.planSeletedIndex['des']!.toString(),
                  height: 1.8,
                  letterSpacing: 0.4,

                  
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
                    children: List.generate(controller.planSeletedIndex['data']!.length, (index) {
                    return   Row(
                  children: [
                    // Tips and Tricks Ask to help desk questions
                    Icon(Icons.check,size: 14,color: AppColors.primaryColor,),
                    addWidth(12.h),
                    addRegularTxt(controller.planSeletedIndex['data'][index],fontSize: 14)
                  ],
                ).marginOnly(
                  bottom: 16.h
                );
                // addHeight(16),
                    }),
                    ),
            //   children: [
               
            //     Row(
            //       children: [
            //         // Tips and Tricks Ask to help desk questions
            //         Icon(Icons.check,size: 14,color: AppColors.primaryColor,),
            //         addWidth(12.h),
            //         addRegularTxt('Tips and Tricks',fontSize: 14)
            //       ],
            //     ),
            //     addHeight(16),
            //     Row(
            //       children: [
            //         // Tips and Tricks Ask to help desk questions
            //         Icon(Icons.check,size: 14,color: AppColors.primaryColor,),
            //         addWidth(12.h),
            //         addRegularTxt('Ask to help desk questions',fontSize: 14)
            //       ],
            //     ),
            //   ],
            // ),
            // addHeight(24),
            // Divider(),
            // Center(child: addRegularTxt('Price: \$15',color: AppColors.primaryColor)),
            addHeight(20),
            Center(child: CustomButton(
                radius: 20,
                height: 52.h,
                width: Get.width*0.8,
                text: 'Join Now', onPressed: (){
                  Get.toNamed(AppRoutes.paymentSuccessScreen);
            })),
            addHeight(20),
          ],
        ).marginSymmetric(horizontal: 20),
      ); 
        },
      ),
      bottomNavigationBar: NavBar2(),
    );
  }
}
