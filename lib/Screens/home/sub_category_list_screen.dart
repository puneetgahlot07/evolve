import 'package:evolve/Screens/other/all_category.dart';
import 'package:evolve/common-widgets/custom_card.dart';
import 'package:evolve/controllers/cart_conntroller.dart';

// import 'package:evolve/common-widgets/custom_textfield.dart';
import 'package:evolve/controllers/discover_controller.dart';
import 'package:evolve/resources/app_assets.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:evolve/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import '../../common-widgets/custom_appbar_one.dart';
import '../../resources/app_color.dart';

class SubCategoryListScreen extends StatefulWidget {
  const SubCategoryListScreen({super.key});

  @override
  State<SubCategoryListScreen> createState() => _SubCategoryListScreenState();
}

class _SubCategoryListScreenState extends State<SubCategoryListScreen> {
  final controller = Get.put(CartController());

  // final controller = Get.put(DiscoverController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.subCategoryItemData.clear();
    controller.getSubCategoryApi(categoryId: Get.arguments['categoryId']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBarOne(
          title: '${Get.arguments['categoryName']}',
          centerTitle: true,
          isAction: false,
          leadingOnTap: () {
            Get.back();
          },

          // isAction: false,
        ),
        body: GetBuilder<CartController>(builder: (controller) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // Number of columns
                  mainAxisSpacing: 12.0, // Spacing between rows
                  crossAxisSpacing: 5.0, // Spacing between columns
                  childAspectRatio:
                      0.8, // Ratio of width to height for each grid item
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.recruitingScreen);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Image.network(
                              controller.subCategoryItemData[index].image ?? '',
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                              errorBuilder: (BuildContext context,
                                      Object exception,
                                      StackTrace? stackTrace) =>
                                  const Icon(Icons.error, size: 70),
                            ),
                          ),
                          const Spacer(),
                          addRegularTxt(
                              controller.subCategoryItemData[index].title ??
                                  'N/A',
                              color: AppColors.blackColor,
                              fontSize: 13.sp,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis),
                          const Spacer(),
                        ],
                      ).paddingOnly(left: 15, right: 14),
                    );
                  },
                  childCount: controller.subCategoryItemData
                      .length, // Number of items in the grid
                ),
              )
            ],
          );
        }));
  }
}
