import 'package:evolve/Screens/other/all_category.dart';
import 'package:evolve/common-widgets/custom_card.dart';
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
import '../../resources/app_color.dart';

class SubScriptionOwnership extends StatefulWidget {
  const SubScriptionOwnership({super.key});

  @override
  State<SubScriptionOwnership> createState() => _SubScriptionOwnershipState();
}

class _SubScriptionOwnershipState extends State<SubScriptionOwnership> {
  // final double appBarHeight = 66.0;
  final controller = Get.put(DiscoverController());
  @override
  Widget build(BuildContext context) {

  

    return Scaffold(
  body: GetBuilder(
    init: DiscoverController(),
    initState: (_) {},
    builder: (_) {
      return CustomScrollView(
      slivers: <Widget>[
      SliverAppBar(
              backgroundColor:  AppColors.primaryColor,            
              leading:   GestureDetector(
          onTap: (){},
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              shape: BoxShape.circle,            
              border: Border.all(color: AppColors.greyColor)
            ),
            child: SvgPicture.asset(AppAssets.popIcon,).marginAll(8),
          ),
        ).paddingOnly(left: 16),
                title:  addHeadingTxt("Subscription And Ownership", fontSize: 18.sp, color: AppColors.whiteColor,fontWeight: FontWeight.w500),
  
                pinned: true,
                expandedHeight: 120.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: MyFlexiableAppBar(),
                ),
                 shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20.0),
        ),),
            ),
            //  SliverToBoxAdapter(
            //   child:  addHeight(10.h),
            //  ),
            SliverToBoxAdapter(
      child:  Padding(
        padding:  EdgeInsets.symmetric(
          vertical: 20.h,
          horizontal: 16.h
        ),
        child: Row(
                children: [
                  addRegularTxt('Category', color: AppColors.blackColor, fontSize: 17.sp)
                ],
              ),
      )
    ),
    SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Number of columns
        mainAxisSpacing: 12.0, // Spacing between rows
        crossAxisSpacing: 5.0, // Spacing between columns
        childAspectRatio: 0.8, // Ratio of width to height for each grid item
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if( index == 7 || index == controller.categoryItemData.length ){
            return InkWell(
              onTap: (){
                Get.to(AllCategory());
                // Get.toNamed(AppRoutes.chooseCategoryScreen);
              },
              child: Container(
              // color: Colors.blue,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: AppColors.secondaryColor,
                    child: SvgPicture.asset("assets/images/see_more.svg", height: 40,),
                  ),
                  Spacer(),
                  addRegularTxt('See More', color: AppColors.blackColor, fontSize: 13.sp, maxLines: 2, overflow: TextOverflow.ellipsis),
                  Spacer(),
                ],
              )
                      ),
            );
          }
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
        },
        childCount: controller.categoryItemData.length > 8 ? 8 : controller.categoryItemData.length+1 , // Number of items in the grid
      ),
    ),
       SliverToBoxAdapter(
      child:  Padding(
        padding:  EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: 16.h
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  addRegularTxt('My Subscriptions', color: AppColors.blackColor, fontSize: 17.sp),
                  InkWell(
                    onTap: (){
                      Get.toNamed(AppRoutes.mySubscription);
                    },
                    child: addRegularTxt('See All', color: AppColors.blackColor, fontSize: 14.sp))
                  
                ],
              ),
      )
    ),
     SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        mainAxisSpacing: 14.0, // Spacing between rows
        crossAxisSpacing: 6.0, // Spacing between columns
        childAspectRatio: 1.0, // Ratio of width to height for each grid item
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {         
          return Padding(
            padding:  EdgeInsets.symmetric( horizontal: 10.0.sp, vertical: 8.sp),
            child: CustomCard(title: controller.mySubscription[index]['title']!, des: controller.mySubscription[index]['des']!, img: controller.mySubscription[index]['image']!, onTap: (){
              Get.toNamed(AppRoutes.chooseCategoryScreen);
            }),
          );
        },
        childCount: controller.mySubscription.length, // Number of items in the grid
      ),
    ),
    SliverToBoxAdapter(
      child:  Padding(
        padding:  EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: 16.h
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  addRegularTxt('Available Subscriptions', color: AppColors.blackColor, fontSize: 17.sp),
                  InkWell(
                    onTap: (){
                       Get.toNamed(AppRoutes.availableSubscription);
                    },
                    child: addRegularTxt('See All', color: AppColors.blackColor, fontSize: 14.sp))
                  
                ],
              ),
      )
    ),
     SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        mainAxisSpacing: 14.0, // Spacing between rows
        crossAxisSpacing: 6.0, // Spacing between columns
        childAspectRatio: 1.0, // Ratio of width to height for each grid item
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {         
          return Padding(
            padding:  EdgeInsets.symmetric( horizontal: 10.0.sp, vertical: 8.sp),
            child: CustomCard(title: controller.mySubscription[index]['title']!, des: controller.mySubscription[index]['des']!, img: controller.mySubscription[index]['image']!, onTap: (){}),
          );
        },
        childCount: controller.mySubscription.length, // Number of items in the grid
      ),
    ),
      
    ],
  ); 
    },
  )
);


   
  }
}









class MyFlexiableAppBar extends StatelessWidget {

  final double appBarHeight = 66.0;

  const MyFlexiableAppBar();

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + appBarHeight,
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
          padding: EdgeInsets.only(
            top: 10.h,
            left: 10.h,
             right: 10.h,
             bottom: 10.h
          ),
          child: Container(
            height: 50.h,
            decoration:  BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(30.h)
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: 14.h,
                vertical: 4.h
              ),
              child: TextField(
                
                decoration: InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(AppAssets.searchIcon, height: 10.sp, width: 10.sp,),
                  )
                ),
                
              ),
            )
            // CustomTextField(
            //   hintText: "Search",
            //   borderRadius: BorderRadius.circular(30),
            //   maxLines: 1,
            //   // readOnly: true,
            //   suffixIcon: Padding(
            //     padding: EdgeInsets.all(10.0.sp),
            //     child: SvgPicture.asset(AppAssets.searchIcon, height: 10.sp, width: 10.sp,),
            //   ),
            // ),
          ),
        ),    
                                       
            ],)
      ),
      decoration: BoxDecoration(
        color:  AppColors.primaryColor,
        borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20)
        )
      ),
    );
  }
}