import 'package:evolve/Screens/widget/documentation_widget.dart';
import 'package:evolve/common-widgets/custom_bottom_navigation2.dart';
import 'package:evolve/common-widgets/custom_button.dart';
import 'package:evolve/common-widgets/custom_icon_button_.dart';
import 'package:evolve/resources/app_assets.dart';
import 'package:evolve/resources/app_color.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../common-widgets/base_image_network.dart';
import '../controllers/cart_conntroller.dart';
import '../models/cart_sub_category_model.dart';

class RecruitingScreen extends StatefulWidget {
  const RecruitingScreen({super.key});

  @override
  State<RecruitingScreen> createState() => _RecruitingScreenState();
}

class _RecruitingScreenState extends State<RecruitingScreen> {
  CartSubCategoryItemsData? cartSubCategoryItemsData;
  final controller = Get.put(CartController());

  // final controller = Get.find<RecruitingController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartSubCategoryItemsData = Get.arguments;
    controller.getDocumentsApi(categoryName: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CartController>(
          builder: (controller) => Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                      height: 280.h,
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          child: BaseImageNetwork(
                            fit: BoxFit.fill,
                            borderRadius: 18,
                            link: cartSubCategoryItemsData?.image ?? '',
                            concatBaseUrl: true,
                            width: double.infinity,
                            topMargin: 0,
                            rightMargin: 0,
                            leftMargin: 0,
                            bottomMargin: 0,
                            errorWidget: Icon(
                              Icons.error,
                              size: 49.w,
                            ),
                          ))),
                  Positioned(
                      top: 48.h,
                      left: 16.sp,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 40.h,
                          width: 40.h,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.whiteColor
                            // border: Border.all(color: AppColors.greyColor)
                          ),
                          child: SvgPicture.asset(
                            AppAssets.popIcon,
                          ).marginAll(8),
                        ),
                      )),
                  Positioned(
                      top: 48.h,
                      right: 16.sp,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 40.h,
                          width: 40.h,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.whiteColor
                            // border: Border.all(color: AppColors.greyColor)
                          ),
                          child: SvgPicture.asset(
                            AppAssets.searchIcon,
                          ).marginAll(8),
                        ),
                      )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          addRegularTxt(
                              cartSubCategoryItemsData?.title ?? 'N/A',
                              fontSize: 18,
                              color: AppColors.primaryColor,
                              overflow: TextOverflow.ellipsis),
                          addRegularTxt('12 chapters',
                              fontSize: 14,
                              color: AppColors.txtFieldLabelColor)
                        ],
                      )),
                  CustomButton(
                      radius: 10,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      text: 'Subscribe Now',
                      onPressed: () {})
                ],
              ).marginSymmetric(horizontal: 16, vertical: 12),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xffF3F3F3),
                    borderRadius: BorderRadius.circular(15)),
                child: TabBar(
                  onTap: (int index) {
                    if (controller.selectedTabIndex != 0 && index == 0) {
                      controller.getDocumentsApi(categoryName: '');
                    }
                    controller.selectedTabIndex = index;
                    controller.update();
                    // log('selectedTabIndex: ${yItemCtrl.selectedTabIndex}');
                  },
                  controller: controller.controller,
                  tabs: controller.myTabs,
                  labelStyle: const TextStyle(),
                  // remove to show magic
                  unselectedLabelColor: AppColors.blackColor,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.primaryColor),
                  indicatorPadding: const EdgeInsets.all(8),
                ),
              ).marginSymmetric(horizontal: 20),
              addHeight(20),
              if (controller.selectedTabIndex == 0)
                const Expanded(child: DocumentationWidget()),
              // ListView.builder(
              //     shrinkWrap: true,
              //     padding: EdgeInsets.zero,
              //     physics: const ScrollPhysics(),
              //     itemCount: controller.documentationListItems.length,
              //     itemBuilder: (context, int index) {
              //       return documentListTileWidget(
              //           controller.documentationListItems[index],
              //           index);
              //     }),
              if (controller.selectedTabIndex == 1)
                // const Expanded(child: TrainingWidget()),
                Expanded(child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const ScrollPhysics(),
                    itemCount: controller.recruitingList.length,
                    itemBuilder: (context, int index) {
                      return Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              // color: Colors.green,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: AppColors.greyColor)),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 60,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      addBoldTxt(
                                          '${controller.recruitingList[index]['title']}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 16,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w500),
                                      addRegularTxt(
                                          '${controller.recruitingList[index]['subTitle']}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 12,
                                          color: AppColors.greyColor1)
                                    ],
                                  ).paddingOnly(left: 20.sp),
                                ),
                                const Spacer(),
                                if (controller.recruitingList[index]
                                ['isImage'])
                                  SizedBox(
                                      height: 48.h,
                                      child: SvgPicture.asset(
                                          AppAssets.pdfIcon)
                                          .marginOnly(right: 16)),
                                if (controller.recruitingList[index]
                                ['isButton'])
                                  CustomIconButton(
                                    icon: AppAssets.trolleyIcon,
                                    onPressed: () {},
                                  ).marginOnly(right: 8),
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
                                    border: Border.all(
                                        color: AppColors.greyColor),
                                    shape: BoxShape.circle),
                                // child: SvgPicture.asset(AppAssets.starFillIcon),
                              ),
                            ),
                          ),
                          Positioned(
                            // ho hide shape
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
                          Positioned(
                            // star image
                            top: 0,
                            bottom: 0,
                            // left: 0,
                            child: SvgPicture.asset(controller
                                .recruitingList[index]['isFav'] ==
                                true
                                ? AppAssets.starFillIcon
                                : AppAssets.starUnFillIcon),
                          ),
                        ],
                      ).marginOnly(left: 8, right: 16, bottom: 10.sp);
                    })),
              addHeight(20),
            ],
          )),
      bottomNavigationBar: const NavBar2(),
    );
  }
}
