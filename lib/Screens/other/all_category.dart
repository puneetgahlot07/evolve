import 'package:evolve/common-widgets/custom_appbar_one.dart';
import 'package:evolve/common-widgets/custom_bottom_navigation2.dart';
import 'package:evolve/resources/app_color.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:evolve/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/category_controller.dart';

class AllCategory extends StatefulWidget {
  const AllCategory({super.key});

  @override
  State<AllCategory> createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {
  final controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarOne(
        title: 'Categories',
        centerTitle: true,
        isAction: false,
        leadingOnTap: () {
          Get.back();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
            crossAxisCount: 4,
            // Number of columns
            mainAxisSpacing: 12.0,
            // Spacing between rows
            crossAxisSpacing: 5.0,
            // Spacing between columns
            childAspectRatio: 0.8,
            children:
                List.generate(controller.categoryItemData.length, (index) {
              return InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.subCategoryListScreen, arguments: {
                    'categoryName':
                        "${controller.categoryItemData[index].title}",
                    'categoryId': "${controller.categoryItemData[index].id}"
                  });
                  // Get.toNamed(AppRoutes.recruitingScreen, arguments: {'categoryId': "${controller.categoryItemData[index].id}"});
                },
                child: Container(
                    // color: Colors.blue,
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Image.network(
                        controller.categoryItemData[index].image ?? '',
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Spacer(),
                    addRegularTxt(
                        controller.categoryItemData[index].title ?? 'N/A',
                        color: AppColors.blackColor,
                        fontSize: 13.sp,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                    const Spacer(),
                  ],
                )),
              );
            })),
      ),
      bottomNavigationBar: NavBar2(),
    );
  }
}
