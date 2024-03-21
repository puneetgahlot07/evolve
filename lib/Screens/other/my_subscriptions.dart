import 'package:evolve/common-widgets/custom_appbar_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common-widgets/custom_card.dart';
import '../../controllers/your_items_controller.dart';
import '../../resources/text_utility.dart';
import '../../routers/app_routers.dart';

class MySubscription extends StatefulWidget {
  const MySubscription({super.key});

  @override
  State<MySubscription> createState() => _MySubscriptionState();
}

class _MySubscriptionState extends State<MySubscription> {
  final controller = Get.find<YourItemsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBarOne(
          title: "My PDF",
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
                          return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0.sp, vertical: 8.sp),
                              child: CustomCard(
                                  title: controller.purchasedItemsData[index]
                                          .document?.name ??
                                      '',
                                  des: controller.purchasedItemsData[index]
                                          .document?.description ??
                                      '',
                                  img: controller.purchasedItemsData[index]
                                          .document?.image ??
                                      '',
                                  onTap: () {
                                    Get.toNamed(AppRoutes.chooseCategoryScreen);
                                  }));
                        },
                        itemCount: controller.purchasedItemsData.length) : Center(
                      child: Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.2),
                          child: noRecordAvailable(msg: 'No Pdf Found')),
                    )))));
  }
}