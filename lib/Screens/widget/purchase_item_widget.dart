import 'package:dio/dio.dart';
import 'package:evolve/models/purchased_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common-widgets/base_image_network.dart';
import '../../controllers/your_items_controller.dart';
import '../../resources/app_color.dart';
import '../../resources/text_utility.dart';

final controller = Get.find<YourItemsController>();

class PurchaseItemWidget extends StatelessWidget {
  const PurchaseItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scrollbar(
            child: SmartRefresher(
                controller: controller.refreshPurchaseController,
                onRefresh: () async {
                  await controller.getPurchasedListApi();
                  controller.refreshPurchaseController.refreshCompleted();
                },
                child: GetBuilder<YourItemsController>(
                  builder: (controller) => controller
                          .purchasedItemsData.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: controller.purchasedItemsData.length,
                          itemBuilder: (context, int index) {
                            return buildPurchasedView(
                                controller.purchasedItemsData[index]);
                          })
                      : Center(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.2),
                              child:
                                  noRecordAvailable(msg: 'No Purchase Found')),
                        ),
                ))));
  }

  Widget buildPurchasedView(PurchasedItemsData itemsFav) {
    bool download = false;
    int dlValue = 0;
    return InkWell(onTap: () async {
      bool res = await controller
          .downloadFile(itemsFav.document!.pdfPath!);
      if (res) {
        // setState(() {
          download = true;
        // });

        try {
          String url = itemsFav.document!.pdfPath!;
          String pdfName =
              controller.dirloc + url.split("/").last;
          Dio dio = Dio();

          await dio.download(url, pdfName,
              onReceiveProgress: (receivedBytes, totalBytes) {
                // setState(() {
                  dlValue = int.parse(
                      ((receivedBytes / totalBytes) * 100)
                          .toStringAsFixed(0));
                // });
                if (receivedBytes == totalBytes) {
                  // setState(() {
                    download = false;
                  // });
                }
              });
        } catch (e) {
          print('catch catch catch');
          print(e);
        }
      }
      // Get.toNamed(
      //     AppRoutes.chooseCategoryScreen);
    }, child: Container(
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
                errorWidget: Icon(Icons.error, size: 36.h)),
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
    ));
  }
}
