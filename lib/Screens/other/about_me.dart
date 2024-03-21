import 'package:evolve/common-widgets/custom_appbar_one.dart';
import 'package:evolve/common-widgets/custom_bottom_navigation2.dart';
// import 'package:evolve/common-widgets/custom_button.dart';
import 'package:evolve/resources/app_assets.dart';
import 'package:evolve/resources/app_color.dart';
import 'package:evolve/resources/text_utility.dart';
// import 'package:evolve/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: CustomAppBarOne(
        title: 'About Me',
        centerTitle: true,
        isAction: false,
        leadingOnTap: () {
          Get.back();
        },

        // isAction: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            addHeight(20),
             CircleAvatar(
                        radius: 70,
                        backgroundColor: AppColors.whiteColor,
                        child: Image.asset(AppAssets.profileUserIcon),
                      ),
            // addHeadingTxt('Recruiting',fontSize: 20,fontWeight: FontWeight.w600,color: AppColors.primaryColor),
            addHeight(10),
            addBoldTxt("Jenny Wilson", color: AppColors.primaryColor, fontSize: 18.sp),
            addHeight(20),
            Row(
              children: [
                addBoldTxt("About Me", color: AppColors.primaryColor, fontSize: 22.sp),
              ],
            ), 
addHeight(20),
            addRegularTxt('''It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.
            
        It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.

          It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.
            ''', textAlign: TextAlign.justify)
          ],
        ).marginSymmetric(horizontal: 20),
      ),
      bottomNavigationBar: NavBar2(),
    );

  }
}
