
import 'package:evolve/resources/app_color.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


import '../controllers/bottom_bar_controller.dart';
// import '../resources/local_storage.dart';
// import '../resources/utils.dart';
import '../resources/app_assets.dart';
import '../routers/app_routers.dart';

class CustomBottomNav extends StatelessWidget {
  CustomBottomNav({Key? key}) : super(key: key);
  // final GlobalKey<ScaffoldState> key = GlobalKey();
  final  controller = Get.find<BottomBarController>();
  //  String token = getValue(LocalStorage.TOKEN);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomBarController>(builder: (controller) {
      // if()
      return Scaffold(
        backgroundColor: AppColors.whiteColor,        
        body: controller.widgetOptions.elementAt(controller.selectedIndex),
        bottomNavigationBar: Container(
          height: Get.height / 10,
          // color: Colors.amber,
          child: 
            Center(
              child: Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: 8.sp,
                  vertical: 6
                ),
                child: Container(
                  height: Get.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.sp),
                    color: AppColors.primaryColor
                     

                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(
                      horizontal: 16.sp
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: (){
                               controller.selectedIndex = 0;
                               controller.update();
                          },
                        child:
                        controller.selectedIndex == 0 ? 
                        IntrinsicHeight(
                          child: Row(                          
                            children: [
                              SvgPicture.asset(
                              AppAssets.discoverIcon,height: 28.sp,width: 28.sp,
                              // color: AppColors,
                            ),
                            addWidth(10.sp),
                            addLightTxt('Discover', 
                            fontSize: 14.sp,
                            color: AppColors.whiteColor),
                             addWidth(10.sp),
                          VerticalDivider(
                            // indent: 2,
                            // endIndent: 1,
                            // thickness: 0.9,
                            width: 5,
                            color: AppColors.whiteColor,
                          )
                            ],
                          ),
                        ):
                           SvgPicture.asset(
                              AppAssets.discoverIcon,height: 28.sp,width: 28.sp,
                              // color: AppColors,
                            ),
                        ),
                              InkWell(
                          onTap: (){
                               controller.selectedIndex = 1;
                               controller.update();
                          },
                        child: 
                          controller.selectedIndex == 1 ? 
                        IntrinsicHeight(
                          child: Row(                          
                            children: [
                              SvgPicture.asset(
                              AppAssets.cartIcon,height: 28.sp,width: 28.sp,
                              // color: AppColors,
                            ),
                            addWidth(10.sp),
                            addLightTxt('Cart', 
                            fontSize: 14.sp,
                            color: AppColors.whiteColor),
                             addWidth(10.sp),
                          VerticalDivider(
                            // indent: 2,
                            // endIndent: 1,
                            // thickness: 0.9,
                            width: 5,
                            color: AppColors.whiteColor,
                          )
                            ],
                          ),
                        ):
                        SvgPicture.asset(
                                AppAssets.cartIcon,height: 28.sp,width: 28.sp,
                                // color: AppColors,
                            ),
                             ),

                             InkWell(
                              onTap: (){
controller.selectedIndex = 2;
                               controller.update();
                              },
                               child: 
                                 controller.selectedIndex == 2 ? 
                        IntrinsicHeight(
                          child: Row(                          
                            children: [
                              SvgPicture.asset(
                              AppAssets.favouriteIcon,height: 28.sp,width: 28.sp,
                              // color: AppColors,
                            ),
                            addWidth(10.sp),
                            addLightTxt('Favourite', 
                            fontSize: 14.sp,
                            color: AppColors.whiteColor),
                             addWidth(10.sp),
                          VerticalDivider(
                            // indent: 2,
                            // endIndent: 1,
                            // thickness: 0.9,
                            width: 5,
                            color: AppColors.whiteColor,
                          )
                            ],
                          ),
                        ):
                               SvgPicture.asset(
                                AppAssets.favouriteIcon,height: 28.sp,width: 28.sp,
                                // color: AppColors,
                                                         ),
                             ),
                          InkWell(
                          onTap: (){
                               controller.selectedIndex = 3;
                               controller.update();
                          },
                        child:
                        controller.selectedIndex == 3 ? 
                        IntrinsicHeight(
                          child: Row(                          
                            children: [
                              SvgPicture.asset(
                              AppAssets.userIcon,height: 28.sp,width: 28.sp,
                              // color: AppColors,
                            ),
                            addWidth(10.sp),
                            addLightTxt('Profile', 
                            fontSize: 14.sp,
                            color: AppColors.whiteColor),
                             addWidth(10.sp),
                          // VerticalDivider(
                          //   // indent: 2,
                          //   // endIndent: 1,
                          //   // thickness: 0.9,
                          //   width: 5,
                          //   color: AppColors.whiteColor,
                          // )
                            ],
                          ),
                        ): SvgPicture.asset(
                                AppAssets.userIcon,height: 28.sp,width: 28.sp,
                                // color: AppColors,
                                                         ),
                             ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ),

//         bottomNavigationBar: BottomNavigationBar(
//   backgroundColor: Colors.blueAccent,
//     elevation: 0,
// iconSize: 40,
// mouseCursor: SystemMouseCursors.grab,
// selectedFontSize: 20,
//   selectedIconTheme: IconThemeData(color: Colors.amberAccent, size: 40),
//   selectedItemColor: Colors.amberAccent,
//   selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
//   currentIndex: controller.selectedIndex,
// unselectedIconTheme: IconThemeData(
//     color: Colors.deepOrangeAccent,
//   ),
//   unselectedItemColor: Colors.deepOrangeAccent,
//   onTap: _onItemTapped,
//     items: const <BottomNavigationBarItem>[
//       BottomNavigationBarItem(
//         icon: Icon(Icons.email),
//         label: 'Emails',
//       ),
//       BottomNavigationBarItem(
//         icon: Icon(Icons.camera),
//         label: 'Camera',
//       ),
//       BottomNavigationBarItem(
//         icon: Icon(Icons.chat),
//         label: 'Chats',
//       ),
//     ],
//   ),
        // endDrawer: MoreScreen(),
        // endDrawerEnableOpenDragGesture: false,
        // bottomNavigationBar:
        // // using BottomAppBar
        // BottomAppBar(
        //   // color: Colors.transparent,
        //    height: 65,

        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: [
        //       GestureDetector(onTap: (){
        //           controller.selectedIndex = 0;
        //           controller.update();
        //         },child:Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             SvgPicture.asset(AppAssets.homeIcon, height: 25,width: 25,
        //             color: controller.selectedIndex==0? AppColors.borderColor : AppColors.grey),
        //             addRegularTxt('home'.tr,fontSize: 10.sp,color: controller.selectedIndex==0? AppColors.borderColor:AppColors.grey),
        //             Container(
        //               height: 5,
        //               width: 5,
        //               decoration: BoxDecoration(
        //                   shape: BoxShape.circle,
        //                   color: controller.selectedIndex==0?AppColors.borderColor: Colors.transparent
        //               ),
        //             )
        //           ],
        //         ),),
              
        //       GestureDetector(onTap: (){
        //        if(token != ""){
        //         // final profile = Get.put(ProfileController());
        //         // profile.CheckNotificationApi();  
        //         controller.selectedIndex = 1;
        //         controller.update();
        //         }
        //         else{
        //            Get.toNamed(AppRoutes.loginScreen);
        //         }
        //       }, child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           SvgPicture.asset(AppAssets.welletIcon, height: 25,width: 25,
        //               color: controller.selectedIndex==1? AppColors.borderColor : AppColors.grey),
        //           addRegularTxt('wallet'.tr,fontSize: 10.sp,color: controller.selectedIndex==1? AppColors.borderColor:AppColors.grey),
        //           Container(
        //             height: 5,
        //             width: 5,
        //             decoration: BoxDecoration(
        //                 shape: BoxShape.circle,
        //                 color: controller.selectedIndex==1?AppColors.borderColor: Colors.transparent
        //             ),
        //           )
        //         ],
        //       ),),
              
        //       GestureDetector(onTap: (){
        //         if(token != ""){
        //         controller.selectedIndex = 2;
        //         controller.update();
        //         }
        //         else{
        //            Get.toNamed(AppRoutes.loginScreen);
        //         }
        //       }, child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           SvgPicture.asset(AppAssets.chatIcon, height: 25,width: 25,
        //               color: controller.selectedIndex==2 ? AppColors.borderColor:AppColors.grey),
        //           addRegularTxt('chat'.tr,fontSize: 10.sp,color: controller.selectedIndex==2? AppColors.borderColor:AppColors.grey),
        //           Container(
        //             height: 5,
        //             width: 5,
        //             decoration: BoxDecoration(
        //                 shape: BoxShape.circle,
        //                 color: controller.selectedIndex==2?AppColors.borderColor: Colors.transparent
        //             ),
        //           )
        //         ],
        //       ),),
              
        //       GestureDetector(onTap: (){

        //         controller.selectedIndex = 3;
        //         controller.update();
        //       }, child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           SvgPicture.asset(AppAssets.activityIcon, height: 25,width: 30,
        //               color: controller.selectedIndex==3? AppColors.borderColor:AppColors.grey),
        //           addRegularTxt('activity'.tr,fontSize: 10.sp,color: controller.selectedIndex==3? AppColors.borderColor:AppColors.grey),
        //           Container(
        //             height: 5,
        //             width: 5,
        //             decoration: BoxDecoration(
        //                 shape: BoxShape.circle,
        //                 color: controller.selectedIndex==3?AppColors.borderColor: Colors.transparent
        //             ),
        //           )
        //         ],
        //       ),),

        //       GestureDetector(
        //         onTap: (){
        //           if(token != ""){
        //         final profile = Get.put(ProfileController());
        //         profile.CheckNotificationApi();    
        //         controller.selectedIndex = controller.selectedIndex;
        //         controller.key.currentState!.openEndDrawer();
        //         controller.update();
        //         }
        //         else{
        //            Get.toNamed(AppRoutes.loginScreen);
        //         }
               
        //       }, child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           SvgPicture.asset(AppAssets.menuIcon, height: 25,width: 25,
        //               color: controller.selectedIndex==4? AppColors.borderColor:AppColors.grey),
        //           addRegularTxt('more'.tr,fontSize: 10.sp,color: controller.selectedIndex==4? AppColors.borderColor:AppColors.grey ),
        //           Container(
        //             height: 5,
        //             width: 5,
        //             decoration: BoxDecoration(
        //               shape: BoxShape.circle,
        //               color: controller.selectedIndex==4?AppColors.borderColor: Colors.transparent
        //             ),
        //           )
        //         ],
        //       ),),
        //     ],
        //   ),
        // )
      );
    });
  }
  void _onItemTapped(int index) {
  // setState(() {
    controller.selectedIndex = index;
    controller.update();
  // });
}
}
