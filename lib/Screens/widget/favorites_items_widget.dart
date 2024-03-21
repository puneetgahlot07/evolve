import 'package:evolve/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../controllers/your_items_controller.dart';
import '../../models/faavourites_item_list_model.dart';
import '../../resources/app_assets.dart';
import '../../resources/app_color.dart';
import '../../resources/text_utility.dart';

final controller = Get.find<YourItemsController>();

class FavoritesItemWidget extends StatelessWidget {
  const FavoritesItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
          child: SmartRefresher(
              onRefresh: () async {
                await controller.getFavouriteListApi();
                controller.refreshFavoritesController.refreshCompleted();
              },
              controller: controller.refreshFavoritesController,
              child: GetBuilder<YourItemsController>(
                builder: (controller) => controller.favoritesItemsData.isNotEmpty
                    ? ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: controller.favoritesItemsData.length,
                    itemBuilder: (context, int index) {
                      return buildFavouriteView(
                          controller.favoritesItemsData[index]);
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
}
