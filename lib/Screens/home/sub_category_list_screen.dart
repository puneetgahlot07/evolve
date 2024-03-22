// import 'package:evolve/Screens/other/all_category.dart';
// import 'package:evolve/common-widgets/custom_card.dart';
// import 'package:evolve/controllers/cart_conntroller.dart';

// import 'package:evolve/common-widgets/custom_textfield.dart';
// import 'package:evolve/controllers/discover_controller.dart';
// import 'package:evolve/resources/app_assets.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:evolve/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import '../../common-widgets/base_image_network.dart';
import '../../common-widgets/custom_appbar_one.dart';
import '../../common-widgets/custom_bottom_navigation2.dart';
import '../../controllers/category_controller.dart';
import '../../resources/app_color.dart';

class SubCategoryListScreen extends StatefulWidget {
  const SubCategoryListScreen({super.key});

  @override
  State<SubCategoryListScreen> createState() => _SubCategoryListScreenState();
}

class _SubCategoryListScreenState extends State<SubCategoryListScreen> {
  // final controller = Get.put(CategoryController());
   final controller = Get.find<CategoryController>();

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
          title: Get.arguments != null ? Get.arguments['categoryName'] ?? '' : '',
          centerTitle: true,
          isAction: false,
          leadingOnTap: () {
            Get.back();
          },

          // isAction: false,
        ),
        body: GetBuilder<CategoryController>(builder: (controller) {
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
                        Get.toNamed(AppRoutes.recruitingScreen, arguments: controller.subCategoryItemData[index]);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BaseImageNetwork(
                            fit: BoxFit.cover,
                            borderRadius: 100,
                            link: controller.subCategoryItemData[index].image ?? '',
                            concatBaseUrl: true,
                            height: 70,
                            width: 70,
                            topMargin: 2,
                            rightMargin: 2,
                            leftMargin: 2,
                            bottomMargin: 2,
                            errorWidget: const Icon(Icons.error, size: 70),
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
                  childCount: controller.subCategoryItemData.length, // Number of items in the grid
                ),
              )
            ],
          );
        }),
      bottomNavigationBar: const NavBar2(),
    );
  }
}
