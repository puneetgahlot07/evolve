import 'package:carousel_slider/carousel_slider.dart';
import 'package:evolve/common-widgets/custom_card.dart';
import 'package:evolve/common-widgets/custom_textfield.dart';
import 'package:evolve/controllers/discover_controller.dart';
import 'package:evolve/controllers/profile_controller.dart';
import 'package:evolve/resources/app_assets.dart';
import 'package:evolve/resources/app_color.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  final controller = Get.put(DiscoverController());
  final profile = Get.find<ProfileController>();
  // final profileController =  Get.put(ProfileController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.setCarouselData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        centerTitle: false,        
        actions: [
          addWidth(10.h),
           Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(AppAssets.appLogoTwo),
            )),
           addWidth(10.h), 
          Expanded(
            flex: 4,
            // height: Get.height/3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                hintText: 'Search',
                borderRadius: BorderRadius.circular(30),   
                readOnly: true,
                suffixIcon: Padding(
                  padding:  EdgeInsets.all(10.0.sp),
                  child: SvgPicture.asset(AppAssets.searchIcon, height: 10.sp, width: 10.sp,),
                ),           
              ),
            ) ),
              addWidth(10.h),
        ],
        elevation: 0,
      ),
      body: GetBuilder(
        init: DiscoverController(),
        // initState: (_) {},
        builder: (_) {
          return Container(        
              height: Get.height,
              width: Get.width,
              child: Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: 12.sp,
                  vertical: 10.sp
                ),
                child: ListView(
                  children: [
                    Container(
                      height: 60.h,
                      child: Row(
                        
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        addRegularTxt('Hello',
                        // fontSize: 1.sp,
                        color: AppColors.greyColor1),
                        addRegularTxt( '${profile.profileData.data!.name ?? "" }', 
                        fontSize: 22.sp,
                        color: AppColors.blackColor1)
                      ],)),
                      Expanded(
                        child: profile.profileData.data!.image != null ?Image.network(profile.profileData.data!.image!):  Image.asset(AppAssets.homeUserIcon))
                    ],),
                    ),
                  addHeight(20.h),  
      
      Stack(
        children: [
           
              CarouselSlider(
             items: controller.carouselItemList,
             options: CarouselOptions(
                height: 120.sp,
                // aspectRatio: 16/9,
                viewportFraction: 1,
                initialPage: controller.carouselSelectIndex, 
                autoPlay: false,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayAnimationDuration: Duration(milliseconds: 1000),
                autoPlayCurve: Curves.bounceInOut,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
               onPageChanged: (index, reason) {
                controller.carouselSelectIndex = index;
                controller.update();
               },
                scrollDirection: Axis.horizontal,
             )
           ),
          //  (
          //   alignment: Alignment.bottomCenter,
      
          //   child: 
          //  )
            Positioned(
              bottom: 8,
              left: 0,
              right: 0,       
        child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          controller.carouselItemList.length, (index) => Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: 4.sp
            ),
            child: Container(
              height: 8.sp,
              width: controller.carouselSelectIndex == index ? 26.sp : 8.sp,        
              decoration: BoxDecoration(            
              borderRadius: BorderRadius.circular(30.sp),
              color: controller.carouselSelectIndex == index ? AppColors.whiteColor : AppColors.whiteColor.withOpacity(0.5)
              ),
                  ),
          )),

      ),
     ),
  ],
),
addHeight(20.sp),
Row(
  children: [
    addHeadingTxtMedium('Popular Items', color: AppColors.primaryColor, fontSize: 16.sp, fontWeight: FontWeight.w600)
  ],
),
addHeight(20.sp),
GridView.count(
  shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(),
       crossAxisSpacing: 20.0,
          mainAxisSpacing: 15.0,
    crossAxisCount: 2,
    children: List.generate(controller.popularItemData.length, (index) => CustomCard(title: controller.popularItemData[index]['title']!, 
    des: controller.popularItemData[index]['des']!,  img: controller.popularItemData[index]['image']!, 
    onTap: () {  },))), 

    addHeight(10.sp),
    Image.asset(AppAssets.discoverBanner)

            ],  
          ),
        ),
      ); 
        },
      ) 
    );
  }
}