

import 'package:evolve/common-widgets/custom_appbar_one.dart';
import 'package:evolve/common-widgets/custom_bottom_navigation2.dart';
import 'package:evolve/controllers/discover_controller.dart';
import 'package:evolve/resources/app_color.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:evolve/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AllCategory extends StatefulWidget {
  const AllCategory({super.key});

  @override
  State<AllCategory> createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {

   final controller = Get.put(DiscoverController());
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
        // isAction: false,
      ),
      body: GetBuilder(
        init: DiscoverController(),
        initState: (_) {},
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(  
                        crossAxisCount: 4, // Number of columns
                  mainAxisSpacing: 12.0, // Spacing between rows
                  crossAxisSpacing: 5.0, // Spacing between columns
                  childAspectRatio: 0.8, 
                        children: List.generate(controller.categoryItemData.length, (index) {  
                          return InkWell(
              onTap: (){
                Get.toNamed(AppRoutes.recruitingScreen);
              },
              child: Container(
                // color: Colors.blue,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: AppColors.secondaryColor,
                      child: SvgPicture.asset(controller.categoryItemData[index]['image']!, height: 40,),
                    ),
                    Spacer(),
                    addRegularTxt(controller.categoryItemData[index]['title']!, color: AppColors.blackColor, fontSize: 13.sp, maxLines: 2, overflow: TextOverflow.ellipsis),
                    Spacer(),
                  ],
                )
              ),
            );  
                        }  
                        )  
                    ),
          ); 
        },
      )   ,
       bottomNavigationBar: NavBar2(),       
    );
  }
}
