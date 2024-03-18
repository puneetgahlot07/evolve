import 'dart:developer';

import 'package:evolve/common-widgets/custom_appbar_one.dart';
import 'package:evolve/controllers/your_items_controller.dart';
import 'package:evolve/resources/app_assets.dart';
import 'package:evolve/resources/app_color.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class YourItems extends StatefulWidget {
  const YourItems({super.key});

  @override
  State<YourItems> createState() => _YourItemsState();
}

class _YourItemsState extends State<YourItems> {

  // final controller = Get.find<YourItemsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarOne(
        leadingOnTap: () {
          Get.back();
        },
        centerTitle: true,
        title: 'Your Items',
        // isAction: false,
      ),
      body: GetBuilder<YourItemsController>(builder: (yItemCtrl) {
        return Column(
          children: [
            addHeight(16),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xffF3F3F3),
                  borderRadius: BorderRadius.circular(15)

              ),
              child: TabBar(
                onTap: (int index) {
                  yItemCtrl.selectedTabIndex = index;
                  yItemCtrl.update();

                  log('selectedTabIndex: ${yItemCtrl.selectedTabIndex}');
                },
                controller: yItemCtrl.controller,
                tabs: yItemCtrl.myTabs,
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
            if(yItemCtrl.selectedTabIndex == 0)
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: yItemCtrl.itemsFav2.length,
                    itemBuilder: (context,int index) {
                  return build_favouriteView(yItemCtrl.itemsFav2[index]);
                }),
              ),

            if(yItemCtrl.selectedTabIndex == 1)
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: yItemCtrl.itemsFav2.length,
                    itemBuilder: (context,int index) {
                      return build_purchasedView(yItemCtrl.itemsFav2[index]);
                    }),
              ),
          ],
        );
      }),
    );
  }

  Widget build_favouriteView(FavList itemsFav) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.green,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.greyColor)
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              height: 36.h,
              width: 36.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                  color: itemsFav.color
              ),
              child: SvgPicture.asset(itemsFav.image.toString()).marginAll(8),
            ),
            addWidth(4),
            VerticalDivider(),
            addWidth(4),
            Expanded(
              flex: 1200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addBoldTxt(itemsFav.title.toString(),
                      maxLines: 1, overflow: TextOverflow.ellipsis,
                      fontSize: 16,color: AppColors.primaryColor,fontWeight: FontWeight.w500),
                  addRegularTxt(itemsFav.subTitle.toString(),
                      maxLines: 1, overflow: TextOverflow.ellipsis,
                      fontSize: 12,color: AppColors.greyColor1)
                ],
              ),
            ),
            Spacer(),
            SvgPicture.asset(AppAssets.starFillIcon)
          ],
        ).paddingSymmetric(vertical: 10,horizontal: 10),
      ),
    ).marginOnly(left: 20,right: 20,bottom: 10,);
  }

  Widget build_purchasedView(FavList itemsFav) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.green,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.greyColor)
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              height: 36.h,
              width: 36.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: itemsFav.color
              ),
              child: SvgPicture.asset(itemsFav.image.toString()).marginAll(8),
            ),
            addWidth(4),
            VerticalDivider(),
            addWidth(4),
            Expanded(
              flex: 1200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addBoldTxt(itemsFav.title.toString(),
                      maxLines: 1, overflow: TextOverflow.ellipsis,
                      fontSize: 16,color: AppColors.primaryColor,fontWeight: FontWeight.w500),
                  addRegularTxt(itemsFav.subTitle.toString(),
                      maxLines: 1, overflow: TextOverflow.ellipsis,
                      fontSize: 12,color: AppColors.greyColor1)
                ],
              ),
            ),
            // Spacer(),
            // SvgPicture.asset(AppAssets.starFillIcon)
          ],
        ).paddingSymmetric(vertical: 10,horizontal: 10),
      ),
    ).marginOnly(left: 20,right: 20,bottom: 10,);
  }
}
