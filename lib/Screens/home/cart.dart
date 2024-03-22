import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common-widgets/custom_appbar_one.dart';
import '../../common-widgets/custom_button.dart';
import '../../controllers/cart_conntroller.dart';
import '../../models/cart_list_model.dart';
import '../../resources/app_color.dart';
import '../../resources/text_utility.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  // final controller = Get.put(CartController());
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBarOne(
          leadingOnTap: () {
            Get.back();
          },
          centerTitle: true,
          title: 'Cart',
          isAction: false,
        ),
        body: Scrollbar(
            child: SmartRefresher(
                onRefresh: () async {
                  await controller.getCartListApi();
                  controller.refreshCartController.refreshCompleted();
                },
                controller: controller.refreshCartController,
                child: GetBuilder<CartController>(
                    builder: (controller) => Column(
                          children: [
                            addHeight(16),
                            controller.cartListItems.isNotEmpty
                                ? Expanded(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: const ScrollPhysics(),
                                        itemCount:
                                            controller.cartListItems.length,
                                        itemBuilder: (context, int index) {
                                          return buildCartView(
                                              controller.cartListItems[index]);
                                        }),
                                  )
                                : Center(
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.2),
                                        child: noRecordAvailable(
                                            msg: 'No Data Found')),
                                  ),
                          ],
                        )))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomButton(
          height: 60.h,
          width: MediaQuery.of(context).size.width * 0.9,
          text: 'Proceed to Payment',
          onPressed: () {

          }),
    );
  }

  Widget buildCartView(CartListItems itemsCart) {
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
                '',
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
                  addBoldTxt('itemsCart.document?.name' ?? 'N/A',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500),
                  addRegularTxt('itemsFav.document?.description' ?? 'N/A',
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
                  controller.removeCartListApi(
                      productId: itemsCart.productId.toString());
                },
                child: addBoldTxt('Remove',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 14,
                    color: Colors.red,
                    fontWeight: FontWeight.w900))
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
