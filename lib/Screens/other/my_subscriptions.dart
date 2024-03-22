import 'package:dio/dio.dart';
import 'package:evolve/common-widgets/custom_appbar_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common-widgets/custom_card.dart';
import '../../controllers/your_items_controller.dart';
import '../../models/purchased_list_model.dart';
import '../../resources/text_utility.dart';
import '../../routers/app_routers.dart';

class MySubscription extends StatefulWidget {
  const MySubscription({super.key});

  @override
  State<MySubscription> createState() => _MySubscriptionState();
}

class _MySubscriptionState extends State<MySubscription> {
  final controller = Get.find<YourItemsController>();
  final yourItemController = Get.put(YourItemsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBarOne(
          title: "My Subscriptions",
          centerTitle: true,
          leadingOnTap: () {
            Get.back();
          },
          isAction: false,
        ),
        body: Scrollbar(
            child: SmartRefresher(
                onRefresh: () async {
                  await controller.getPurchasedListApi();
                  controller.refreshPurchaseController.refreshCompleted();
                },
                controller: controller.refreshPurchaseController,
                child: GetBuilder<YourItemsController>(
                    builder: (controller) => controller.purchasedItemsData.isNotEmpty ? GridView.builder(
                      physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of columns
                          mainAxisSpacing: 14.0, // Spacing between rows
                          crossAxisSpacing: 6.0, // Spacing between columns
                          childAspectRatio:
                              1.0, // Ratio of width to height for each grid item
                        ),
                        itemBuilder: (context, index) {
                          return MyCard(
                              controller.purchasedItemsData[index]);
                        },
                        itemCount: controller.purchasedItemsData.length) : Center(
                      child: Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.2),
                          child: noRecordAvailable(msg: 'No Pdf Found')),
                    )))));
  }
  MyCard(PurchasedItemsData data) {
    bool download = false;
    int dlValue = 0;
    return StatefulBuilder(builder: (context, setState) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.sp, vertical: 8.sp),
        child: download
            ? Center(
          child: CircularProgressIndicator(
            value: double.parse(dlValue.toString()) / 100,
          ),
        )
            : CustomCard(
            title: data.document?.name ?? '',
            des: data.document?.description ?? '',
            img: data.document?.image ?? '',
            onTap: () async {
              bool res = await yourItemController
                  .downloadFile(data.document!.pdfPath!);
              if (res) {
                setState(() {
                  download = true;
                });

                try {
                  String url = data.document!.pdfPath!;
                  String pdfName =
                      yourItemController.dirloc + url.split("/").last;
                  Dio dio = Dio();

                  await dio.download(url, pdfName,
                      onReceiveProgress: (receivedBytes, totalBytes) {
                        setState(() {
                          dlValue = int.parse(
                              ((receivedBytes / totalBytes) * 100)
                                  .toStringAsFixed(0));
                        });
                        if (receivedBytes == totalBytes) {
                          setState(() {
                            download = false;
                          });
                        }
                      });
                } catch (e) {
                  print('catch catch catch');
                  print(e);
                }
              }
              // Get.toNamed(
              //     AppRoutes.chooseCategoryScreen);
            }),
      );
    });
  }
}