import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common-widgets/base_image_network.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getCartListApi();
  }

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
                  builder: (controller) => controller.cartListItems.isNotEmpty
                      ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                      controller.cartListItems.length,
                      itemBuilder: (context, int index) {
                        return buildCartView(
                            controller.cartListItems[index]);
                      })
                      : Center(child:  noRecordAvailable(msg: 'No Data Found'),
                  )))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GetBuilder<CartController>(
    builder: (controller) => controller.cartListItems.isNotEmpty ? CustomButton(
          height: 60.h,
          width: MediaQuery.of(context).size.width * 0.9,
          text: 'Proceed to Payment',
          onPressed: () {}) : const SizedBox.shrink()),
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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BaseImageNetwork(
                fit: BoxFit.fill,
                borderRadius: 18,
                height: 40,
                width: 35,
                link: itemsCart.document?.image ?? '',
                concatBaseUrl: true,
                topMargin: 0,
                rightMargin: 0,
                leftMargin: 0,
                bottomMargin: 0,
                errorWidget: Icon(Icons.error, size: 49.w)),
            addWidth(4),
            const VerticalDivider(),
            addWidth(4),
            Expanded(
              flex: 1200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addBoldTxt(itemsCart.document?.name ?? 'N/A',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500),
                  addHeight(4),
                  addRegularTxt('Price: \$${itemsCart.price ?? 'N/A'}',
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
                child: const Padding(
                  padding: EdgeInsets.all(7),
                  child: Icon(Icons.delete_forever, color: Colors.red,)
                ))
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
