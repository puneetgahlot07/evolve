import 'package:dio/dio.dart';
import 'package:evolve/Screens/other/all_category.dart';
import 'package:evolve/common-widgets/custom_card.dart';
import 'package:evolve/controllers/cart_conntroller.dart';

// import 'package:evolve/common-widgets/custom_textfield.dart';
import 'package:evolve/controllers/discover_controller.dart';
import 'package:evolve/models/purchased_list_model.dart';
import 'package:evolve/resources/app_assets.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:evolve/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../common-widgets/base_image_network.dart';
import '../../controllers/category_controller.dart';
import '../../controllers/your_items_controller.dart';
import '../../resources/app_color.dart';

class SubScriptionOwnership extends StatefulWidget {
  const SubScriptionOwnership({super.key});

  @override
  State<SubScriptionOwnership> createState() => _SubScriptionOwnershipState();
}

class _SubScriptionOwnershipState extends State<SubScriptionOwnership> {
  final yourItemController = Get.put(YourItemsController());
  final controller = Get.put(CategoryController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getCategoryApi();
    yourItemController.getPurchasedListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scrollbar(
            child: SmartRefresher(
                onRefresh: () async {
                  await controller.getCategoryApi();
                  await yourItemController.getFavouriteListApi();
                  yourItemController.refreshHomeController.refreshCompleted();
                },
                controller: yourItemController.refreshHomeController,
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      backgroundColor: AppColors.primaryColor,
                      leading: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.greyColor)),
                          child: SvgPicture.asset(
                            AppAssets.popIcon,
                          ).marginAll(8),
                        ),
                      ).paddingOnly(left: 16),
                      title: addHeadingTxt("Subscription And Ownership",
                          fontSize: 18.sp,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w500),
                      pinned: true,
                      expandedHeight: 120.0,
                      flexibleSpace: const FlexibleSpaceBar(
                        background: MyFlexiableAppBar(),
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(20.0),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                        child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.h, horizontal: 16.h),
                      child: Row(
                        children: [
                          addRegularTxt('Category',
                              color: AppColors.blackColor, fontSize: 17.sp)
                        ],
                      ),
                    )),
                    GetBuilder<CategoryController>(
                        builder: (controller) => controller
                                .categoryItemData.isNotEmpty
                            ? SliverGrid(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4, // Number of columns
                                  mainAxisSpacing: 12.0, // Spacing between rows
                                  crossAxisSpacing:
                                      5.0, // Spacing between columns
                                  childAspectRatio:
                                      0.8, // Ratio of width to height for each grid item
                                ),
                                delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                    if (index == 7 ||
                                        index ==
                                            controller
                                                .categoryItemData.length) {
                                      return InkWell(
                                        onTap: () {
                                          Get.to(const AllCategory());
                                          // Get.toNamed(AppRoutes.chooseCategoryScreen);
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              radius: 35,
                                              backgroundColor:
                                                  AppColors.secondaryColor,
                                              child: SvgPicture.asset(
                                                "assets/images/see_more.svg",
                                                height: 40,
                                              ),
                                            ),
                                            const Spacer(),
                                            addRegularTxt('See More',
                                                color: AppColors.blackColor,
                                                fontSize: 13.sp,
                                                maxLines: 2,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                            const Spacer(),
                                          ],
                                        ),
                                      );
                                    }
                                    return InkWell(
                                      onTap: () {
                                        Get.toNamed(
                                            AppRoutes.subCategoryListScreen,
                                            arguments: {
                                              'categoryName':
                                                  "${controller.categoryItemData[index].title}",
                                              'categoryId':
                                                  "${controller.categoryItemData[index].id}"
                                            });
                                        // Get.toNamed(AppRoutes.recruitingScreen, arguments: {'categoryId': "${controller.categoryItemData[index].id}"});
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          BaseImageNetwork(
                                            fit: BoxFit.cover,
                                            borderRadius: 100,
                                            link: controller
                                                    .categoryItemData[index]
                                                    .image ??
                                                '',
                                            concatBaseUrl: true,
                                            height: 70,
                                            width: 70,
                                            topMargin: 0,
                                            rightMargin: 0,
                                            leftMargin: 0,
                                            bottomMargin: 0,
                                            errorWidget: const Icon(Icons.error,
                                                size: 70),
                                          ),
                                          // ClipOval(
                                          //   child: Image.network(
                                          //     controller.categoryItemData[index].image ?? '',
                                          //     width: 70,
                                          //     height: 70,
                                          //     fit: BoxFit.cover,
                                          //   ),
                                          // ),
                                          const Spacer(),
                                          addRegularTxt(
                                              controller.categoryItemData[index]
                                                      .title ??
                                                  'N/A',
                                              color: AppColors.blackColor,
                                              fontSize: 13.sp,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis),
                                          const Spacer(),
                                        ],
                                      ),
                                    );
                                  },
                                  childCount: controller
                                          .categoryItemData.isNotEmpty
                                      ? controller.categoryItemData.length > 8
                                          ? 8
                                          : controller.categoryItemData.length +
                                              1
                                      : 0, // Number of items in the grid
                                ),
                              )
                            : SliverToBoxAdapter(
                                child: Padding(
                                    padding: const EdgeInsets.only(),
                                    child: noRecordAvailable(
                                        msg: 'No Category Found')),
                              )),
                    SliverToBoxAdapter(
                        child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 16.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          addRegularTxt('My Subscriptions',
                              color: AppColors.blackColor, fontSize: 17.sp),
                          InkWell(
                              onTap: () {
                                Get.toNamed(AppRoutes.mySubscription);
                              },
                              child: addRegularTxt('See All',
                                  color: AppColors.blackColor, fontSize: 14.sp))
                        ],
                      ),
                    )),
                    GetBuilder<YourItemsController>(
                        builder: (controller) => controller
                                .purchasedItemsData.isNotEmpty
                            ? SliverGrid(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, // Number of columns
                                  mainAxisSpacing: 14.0, // Spacing between rows
                                  crossAxisSpacing:
                                      6.0, // Spacing between columns
                                  childAspectRatio:
                                      1.0, // Ratio of width to height for each grid item
                                ),
                                delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                    return MyCard(controller
                                              .purchasedItemsData[index]);
                                  },
                                  childCount: controller
                                              .purchasedItemsData.length >
                                          4
                                      ? 4
                                      : controller.purchasedItemsData
                                          .length, // Number of items in the grid
                                ),
                              )
                            : SliverToBoxAdapter(
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.2),
                                    child:
                                        noRecordAvailable(msg: 'No Record Found!!')),
                              ))
                  ],
                ))));
  }
MyCard(PurchasedItemsData data){
    bool download = false;
    int dlValue = 0; 
  return   StatefulBuilder(
    builder: (context, setState) {
      return Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.0.sp, vertical: 8.sp),
                                          child: download ? Center(
                                            child: CircularProgressIndicator(
                                              value: double.parse(dlValue.toString()) /100,
                                            ),
                                          ): CustomCard(
                                              title: data
                                                      .document
                                                      ?.name ??
                                                  '',
                                              des: data
                                                      .document
                                                      ?.description ??
                                                  '',
                                              img:data
                                                      .document
                                                      ?.image ??
                                                  '',
                                              onTap: () async {
                                                 bool res =  await yourItemController.downloadFile(data.document!.pdfPath!);
                                   if(res){                                    
                                        setState(() { 
                                          download = true;                                     
                                        });                                                                      
                                        
                                     try {  
                                      String url = data.document!.pdfPath!;
                                      String  pdfName =  yourItemController.dirloc + url.split("/").last;
                                       Dio dio = Dio();
              
                await dio.download(
                  url, pdfName,
                    onReceiveProgress: (receivedBytes, totalBytes) {                       
                 setState(() { 
                  dlValue = int.parse(((receivedBytes / totalBytes) * 100).toStringAsFixed(0)) ;
                  });     
                  if(receivedBytes == totalBytes ){
                     setState(() { 
                      download = false;
                     });
                  }                    
                });
              } catch (e) {
                print('catch catch catch');
                print(e);
              }
                                   }
                                                // Get.toNamed(
                                                //     AppRoutes.chooseCategoryScreen);
                                              }),
                                        );
    }
  );
 }
}

class MyFlexiableAppBar extends StatelessWidget {
  final double appBarHeight = 66.0;

  const MyFlexiableAppBar();

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + appBarHeight,
      decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: 10.h, left: 10.h, right: 10.h, bottom: 10.h),
            child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(30.h)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.h, vertical: 4.h),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            AppAssets.searchIcon,
                            height: 10.sp,
                            width: 10.sp,
                          ),
                        )),
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
        ],
      )),
    );
  }
}
