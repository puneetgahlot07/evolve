import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common-widgets/custom_icon_button_.dart';
import '../../controllers/cart_conntroller.dart';
import '../../models/documentation_list_model.dart';
import '../../resources/app_assets.dart';
import '../../resources/app_color.dart';
import '../../resources/text_utility.dart';

final controller = Get.find<CartController>();

class TrainingWidget extends StatelessWidget {
  const TrainingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scrollbar(
            child: SmartRefresher(
                onRefresh: () async {
                  await controller.getDocumentsApi(categoryName: '');
                  controller.refreshTrainingController.refreshCompleted();
                },
                controller: controller.refreshTrainingController,
                child: GetBuilder<CartController>(
                  builder: (controller) => controller.documentationListItems.isNotEmpty
                      ? ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: controller.documentationListItems.length,
                      itemBuilder: (context, int index) {
                        return trainingListTileWidget(
                            controller.documentationListItems[index],
                            index);
                      })
                      : Center(
                    child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.2),
                        child: noRecordAvailable(msg: 'No Favorites Found')),
                  ),
                )
            ))
    );
  }

  Widget trainingListTileWidget(
      DocumentationListItems documentationListItem, index) {
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
  }
}
