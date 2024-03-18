import 'package:evolve/common-widgets/custom_appbar_one.dart';
import 'package:evolve/common-widgets/custom_bottom_navigation2.dart';
import 'package:evolve/common-widgets/custom_button.dart';
import 'package:evolve/controllers/discover_controller.dart';
import 'package:evolve/resources/app_color.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:evolve/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final controller = Get.find<DiscoverController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarOne(
        title: 'Subscription',
        centerTitle: true,
        isAction: false,
        leadingOnTap: () {
          Get.back();
        },

        // isAction: false,
      ),
      body: GetBuilder(
        init: DiscoverController(),
        initState: (_) {},
        builder: (_) {
          return Container(
              // width: double.infinity,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  addHeight(60),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.h),
                    child: addBoldTxt('Continue your journey with Unlimited Workstream',fontSize: 20,fontWeight: FontWeight.w600,textAlign: TextAlign.center),
                  ),
                  addRegularTxt('Access to workstream'),
                  addHeight(30),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.46,
                    child: ListView.builder(
                        itemCount: controller.subscriptionPlan.length,
                        shrinkWrap: true,
                        // physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                      return build_plan_view(controller.subscriptionPlan.length,index, controller.subscriptionPlan[index]);
                    }),
                  )
                ],
              ).marginSymmetric(horizontal: 20),
      ); 
        },
      ),
      bottomNavigationBar: NavBar2(),
    );
  }

  Widget build_plan_view(int length,int index, var planData) {
    return Container(
      width: MediaQuery.of(context).size.width*0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.greyColor)
      ),
      child: Column(
        children: [
          Container(
            // height: 56.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14),)
            ),
            child: addRegularTxt(planData['title'],color: AppColors.whiteColor,fontSize:18,textAlign: TextAlign.left).marginAll(12),
          ),
          addHeight(16),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.26,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: planData['data'].length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
              return build_content_view(planData['data'][index]);
            }), 
          ),

          Spacer(),
          CustomButton(
            height: 46.h,
            width: double.infinity,
              radius: 15,
              fontWeight: FontWeight.w400,
              text: planData['price'], onPressed: (){
                controller.planSeletedIndex = planData;
                controller.update();
                Get.toNamed(AppRoutes.planDetailsScreen);
                // Get.toNamed(AppRoutes.cardFormScreen);
              }).marginSymmetric(horizontal: 16),
          addHeight(20)
        ],
      ),
    ).marginOnly(right: index==length-1?0:20);
  }

  build_content_view( String planlistName) {
    return Column(
      children: [
        addHeight(10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.check_circle_outline_outlined),
            addWidth(10),
            Expanded(child: addRegularTxt(planlistName,
                // maxLines: 2,
                overflow: TextOverflow.ellipsis,fontSize: 13)),

          ],
        ),
        Divider(color: AppColors.greyColor,)

      ],
    ).marginSymmetric(horizontal: 16);
  }
}
