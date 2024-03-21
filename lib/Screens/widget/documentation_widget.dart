import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common-widgets/custom_icon_button_.dart';
import '../../controllers/cart_conntroller.dart';
import '../../controllers/your_items_controller.dart';
import '../../models/documentation_list_model.dart';
import '../../resources/app_assets.dart';
import '../../resources/app_color.dart';
import '../../resources/text_utility.dart';
import '../other/methodology_details.dart';

final controller = Get.find<CartController>();

class DocumentationWidget extends StatelessWidget {
  const DocumentationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scrollbar(
            child: SmartRefresher(
                onRefresh: () async {
                  await controller.getDocumentsApi(categoryName: '');
                  controller.refreshDocumentationController.refreshCompleted();
                },
                controller: controller.refreshDocumentationController,
                child: GetBuilder<CartController>(
                  builder: (controller) => controller
                          .documentationListItems.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: controller.documentationListItems.length,
                          itemBuilder: (context, int index) {
                            return documentListTileWidget(
                                controller.documentationListItems[index],
                                index);
                          })
                      : Center(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.2),
                              child:
                                  noRecordAvailable(msg: 'No Favorites Found')),
                        ),
                ))));
  }

  Widget documentListTileWidget(
      DocumentationListItems documentationListItem, index) {
    return Stack(
      children: [
        InkWell(
          onTap: ()=> Get.to(()=> const MethodologyDetailScreen()),
            child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.greyColor)),
          child: Row(
            children: [
              Expanded(
                flex: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addBoldTxt('${documentationListItem.name}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w500),
                    addRegularTxt('${documentationListItem.description}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 12,
                        color: AppColors.greyColor1)
                  ],
                ).paddingOnly(left: 20.sp),
              ),
              const Spacer(),
              if (documentationListItem.type != 'Paid')
                SizedBox(
                    height: 48.h,
                    child: SvgPicture.asset(AppAssets.pdfIcon)
                        .marginOnly(right: 16, top: 8, bottom: 8, left: 8)),
              if (documentationListItem.type == 'Paid')
                CustomIconButton(
                  icon: AppAssets.trolleyIcon,
                  onPressed: () {
                    controller.addCartApi(productId: documentationListItem.id.toString(), price: documentationListItem.price.toString());
                  },
                ).marginOnly(right: 8, top: 8, bottom: 8)
            ],
          ).paddingSymmetric(vertical: 4),
        ).marginOnly(left: 8)),
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
                  border: Border.all(color: AppColors.greyColor),
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
          child: Container(height: 20.h, width: 8.h, color: Colors.white),
        ),
        Positioned(
          // star image
          top: 0,
          bottom: 0,
          child: InkWell(
              onTap: () {
                final yourItemController = Get.find<YourItemsController>();
                if (controller.documentationListItems[index].favorite != null) {
                  controller.documentationListItems[index].favorite = null;
                  controller.update();
                } else {
                  controller.documentationListItems[index].favorite = Favorite(
                      id: documentationListItem.id,
                      documentId: documentationListItem.id,
                      userId: documentationListItem.id);
                  controller.update();
                }
                yourItemController.getFavouriteAddRemoveApi(
                    documentId: '${documentationListItem.id}');
              },
              child: GetBuilder<CartController>(
                  builder: (controller) => SvgPicture.asset(controller
                              .documentationListItems[index]
                              .favorite
                              ?.documentId !=
                          null
                      ? AppAssets.starFillIcon
                      : AppAssets.starUnFillIcon))),
        ),
      ],
    ).marginOnly(left: 8, right: 16, bottom: 10.sp);
  }
}
