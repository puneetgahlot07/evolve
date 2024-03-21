import 'dart:developer';

import 'package:evolve/Screens/widget/favorites_items_widget.dart';
import 'package:evolve/Screens/widget/purchase_item_widget.dart';
import 'package:evolve/common-widgets/custom_appbar_one.dart';
import 'package:evolve/controllers/your_items_controller.dart';
import 'package:evolve/resources/app_assets.dart';
import 'package:evolve/resources/app_color.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../common-widgets/base_image_network.dart';
import '../models/faavourites_item_list_model.dart';
import '../models/purchased_list_model.dart';

class YourItems extends StatefulWidget {
  const YourItems({super.key});

  @override
  State<YourItems> createState() => _YourItemsState();
}

class _YourItemsState extends State<YourItems> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getFavouriteListApi();
  }

  final controller = Get.find<YourItemsController>();

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
                    color: const Color(0xffF3F3F3),
                    borderRadius: BorderRadius.circular(15)),
                child: TabBar(
                  onTap: (int index) {
                    if (yItemCtrl.selectedTabIndex != 1 && index == 1) {
                      controller.getPurchasedListApi();
                    }
                    if (yItemCtrl.selectedTabIndex != 0 && index == 0) {
                      controller.getFavouriteListApi();
                    }
                    yItemCtrl.selectedTabIndex = index;
                    yItemCtrl.update();
                    log('selectedTabIndex: ${yItemCtrl.selectedTabIndex}');
                  },
                  controller: yItemCtrl.controller,
                  tabs: yItemCtrl.myTabs,
                  labelStyle: const TextStyle(),
                  // remove to show magic
                  unselectedLabelColor: AppColors.blackColor,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.primaryColor),
                  indicatorPadding: const EdgeInsets.all(8),
                ),
              ).marginSymmetric(horizontal: 20.h),
              addHeight(20),
              if (yItemCtrl.selectedTabIndex == 0)
                const Expanded(child: FavoritesItemWidget()),
              // yItemCtrl.favoritesItemsData.isNotEmpty ? Expanded(
              //   child: ListView.builder(
              //       shrinkWrap: true,
              //       physics: const ScrollPhysics(),
              //       itemCount: yItemCtrl.favoritesItemsData.length,
              //       itemBuilder: (context, int index) {
              //         return buildFavouriteView(
              //             yItemCtrl.favoritesItemsData[index]);
              //       }),
              // ) : Center(
              //   child: Padding(
              //     padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
              //     child: noRecordAvailable(msg: 'No Favorites Found')
              //   ),
              // ),
              if (yItemCtrl.selectedTabIndex == 1)
                const Expanded(child: PurchaseItemWidget()),
              /* yItemCtrl.favoritesItemsData.isNotEmpty
                    ? Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: yItemCtrl.purchasedItemsData.length,
                      itemBuilder: (context, int index) {
                        return buildPurchasedView(
                            yItemCtrl.purchasedItemsData[index]);
                      }),
                )
                    : Center(
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.2),
                      child: noRecordAvailable(msg: 'No Purchase Found')),
                ),*/
            ],
          );
        }));
  }

  Widget buildFavouriteView(FavoritesItemsData itemsFav) {
    return Container(
      decoration: BoxDecoration(
          // color: Colors.green,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.greyColor)),
      child: IntrinsicHeight(
        child: Row(
          children: [
            ClipOval(
              child: Image.network(
                itemsFav.document?.image ?? '',
                width: 35,
                height: 35,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) =>
                    const Icon(Icons.error, size: 35),
              ),
            ),
            addWidth(4),
            const VerticalDivider(),
            addWidth(4),
            Expanded(
              flex: 1200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addBoldTxt(itemsFav.document?.name ?? 'N/A',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500),
                  addRegularTxt(itemsFav.document?.description ?? 'N/A',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 12,
                      color: AppColors.greyColor1)
                ],
              ),
            ),
            const Spacer(),
            InkWell(
                onTap: () {
                  controller.getFavouriteAddRemoveApi(
                      documentId: '${itemsFav.document?.id}');
                },
                child: SvgPicture.asset(AppAssets.starFillIcon))
          ],
        ).paddingSymmetric(vertical: 10, horizontal: 10),
      ),
    ).marginOnly(
      left: 20,
      right: 20,
      bottom: 10,
    );
  }

  Widget buildPurchasedView(PurchasedItemsData itemsFav) {
    return Container(
      decoration: BoxDecoration(
          // color: Colors.green,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.greyColor)),
      child: IntrinsicHeight(
        child: Row(
          children: [
            BaseImageNetwork(
              fit: BoxFit.fill,
              borderRadius: 18,
              link: itemsFav.document?.image ?? '',
              concatBaseUrl: true,
              height: 36.h,
              width: 36.h,
              topMargin: 0,
              rightMargin: 0,
              leftMargin: 0,
              bottomMargin: 0,
              errorWidget: Icon(
                Icons.error,
                size: 36.h,
              ),
            ),
            // Container(
            //   height: 36.h,
            //   width: 36.h,
            //   decoration:
            //       BoxDecoration(shape: BoxShape.circle, color: itemsFav.color),
            //   child: SvgPicture.asset(itemsFav.image.toString()).marginAll(8),
            // ),
            addWidth(4),
            const VerticalDivider(),
            addWidth(4),
            Expanded(
              flex: 1200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addBoldTxt(itemsFav.document?.name ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500),
                  addRegularTxt(itemsFav.document?.description ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 12,
                      color: AppColors.greyColor1)
                ],
              ),
            ),
            // Spacer(),
            // SvgPicture.asset(AppAssets.starFillIcon)
          ],
        ).paddingSymmetric(vertical: 10, horizontal: 10),
      ),
    ).marginOnly(
      left: 20,
      right: 20,
      bottom: 10,
    );
  }
}
