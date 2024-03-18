import 'package:evolve/common-widgets/custom_appbar_one.dart';
import 'package:evolve/common-widgets/custom_bottom_navigation2.dart';
import 'package:evolve/resources/app_assets.dart';
import 'package:evolve/resources/app_color.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HelpDeskScreen extends StatefulWidget {
  const HelpDeskScreen({super.key});

  @override
  State<HelpDeskScreen> createState() => _HelpDeskScreenState();
}

class _HelpDeskScreenState extends State<HelpDeskScreen> {
  bool _visible = true;
  bool _visible2 = true;
  bool _visible3 = true;
  void _toggle() {
    setState(() {
      _visible = !_visible;
    });
  }
   void _toggle2() {
    setState(() {
      _visible2 = !_visible2;
    });
  }
   void _toggle3() {
    setState(() {
      _visible3 = !_visible3;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBarOne(
        title: 'Helpdesk',
        centerTitle: true,
        isAction: false,
        leadingOnTap: () {
          Get.back();
        },

        // isAction: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            addHeight(20),
            Center(child: addBoldTxt('Hello, how can we help?',fontSize: 18,color: AppColors.primaryColor)),
            addHeight(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                  Expanded(
                    flex: 3,
                    child:boxCardWidget('Getting Started', AppAssets.helpdeskIcon1, false)),
                    addWidth(20),
                   Expanded(
                    flex: 3,child: boxCardWidget('Resources', AppAssets.helpdeskIcon2, true)),
               addWidth(20),
                    Expanded(
                    flex: 3,child:boxCardWidget('Trust & Safety', AppAssets.helpdeskIcon3,false)),
              ],
            ),
        //     Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     Flexible(
        //       child: GestureDetector(
        //         onTap: (){

        //         },
        //         child: Container(

        //           decoration: BoxDecoration(

        //               borderRadius: BorderRadius.circular(15),
        //               border: Border.all(
        //                   color: AppColors.greyColor
        //               )
        //           ),
        //           child: Column(
        //             mainAxisSize: MainAxisSize.min,
        //             children: [

        //               SizedBox(

        //                   height: 30.h,
        //                   width: 30.h,
        //                   child: SvgPicture.asset(AppAssets.helpdeskIcon1)),
        //               addHeight(10),
        //               addRegularTxt(
        //                   'Getting Started',fontSize: 14, color: AppColors.primaryColor,textAlign: TextAlign.center)
        //             ],
        //           ).marginSymmetric(vertical: 22, horizontal: 14),
        //         ),
        //       ),
        //     ),
        //     addWidth(10),
        //     Flexible(
        //       child: GestureDetector(
        //         onTap: (){

        //         },
        //         child: Container(

        //           decoration: BoxDecoration(
        //               color: AppColors.whiteColor,
        //               // boxShadow: [
        //               //   BoxShadow(
        //               //       color: Colors.black.withOpacity(0.2),
        //               //       spreadRadius: 0.5.sp,
        //               //       blurRadius: 4.sp)
        //               // ],
        //               borderRadius: BorderRadius.circular(15),
        //               border: Border.all(
        //                   color: AppColors.helpDeskColor2
        //               )
        //           ),
        //           child: Column(
        //             mainAxisSize: MainAxisSize.min,
        //             children: [

        //               SizedBox(
        //                   height: 30.h,
        //                   width: 30.h,
        //                   child: SvgPicture.asset(AppAssets.helpdeskIcon2)),
        //               addHeight(10),
        //               addRegularTxt(
        //                   'Resources',fontSize: 14, color: AppColors.primaryColor,textAlign: TextAlign.center)
        //             ],
        //           ).marginSymmetric(vertical: 22, horizontal: 14),
        //         ),
        //       ),
        //     ),
        //     addWidth(10),
        //     Flexible(
        //       child: GestureDetector(
        //         onTap: (){

        //         },
        //         child: Container(

        //           decoration: BoxDecoration(
        //               color: AppColors.whiteColor,
        //               // boxShadow: [
        //               //   BoxShadow(
        //               //       color: Colors.black.withOpacity(0.2),
        //               //       spreadRadius: 0.5.sp,
        //               //       blurRadius: 4.sp)
        //               // ],
        //               borderRadius: BorderRadius.circular(15),
        //               border: Border.all(
        //                   color: AppColors.greyColor
        //               )
        //           ),
        //           child: Column(
        //             mainAxisSize: MainAxisSize.min,
        //             children: [

        //               SizedBox(

        //                   height: 30.h,
        //                   width: 30.h,
        //                   child: SvgPicture.asset(AppAssets.helpdeskIcon3)),
        //               addHeight(10),
        //               addRegularTxt(
        //                   'Trust & Safety',fontSize: 14, color: AppColors.primaryColor,textAlign: TextAlign.center)
        //             ],
        //           ).marginSymmetric(vertical: 22, horizontal: 14),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
            addHeight(40),

            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: AppColors.greyColor
                  )
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      addBoldTxt('How to secure my data in App?',fontSize: 14,color: AppColors.primaryColor,fontWeight: FontWeight.w600),
                      Spacer(),
                      GestureDetector(
                          onTap: _toggle,
                          child: Icon(_visible?Icons.remove:Icons.add,color: AppColors.greyColor,).marginAll(4))
                    ],
                  ),
                  Visibility(
                    visible:_visible,
                    child: addRegularTxt('It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                    textAlign: TextAlign.left,
                    fontSize: 14,
                    color: AppColors.helpDeskColor),
                  ),
                ],
              ),
            ),
            addHeight(12),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: AppColors.greyColor
                  )
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      addBoldTxt('Download offline documentation?',fontSize: 14,color: AppColors.primaryColor,fontWeight: FontWeight.w600),
                      Spacer(),
                      GestureDetector(
                          onTap: _toggle2,
                          child: Icon(_visible?Icons.remove:Icons.add,color: AppColors.greyColor,).marginAll(4))
                    ],
                  ),
                  Visibility(
                    visible:_visible2,
                    child: addRegularTxt('It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                    textAlign: TextAlign.left,
                    fontSize: 14,
                    color: AppColors.helpDeskColor),
                  ),
                ],
              ),
            ),
            addHeight(12),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: AppColors.greyColor
                  )
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                          flex: 3,
                          child: addBoldTxt('How to secure my payment details?',maxLines: 2,fontSize: 14,color: AppColors.primaryColor,fontWeight: FontWeight.w600)),
                      Spacer(),
                      GestureDetector(
                          onTap: _toggle3,
                          child: Icon(_visible?Icons.remove:Icons.add,color: AppColors.greyColor,).marginAll(4))
                    ],
                  ),
                  Visibility(
                    visible:_visible3,
                    child: addRegularTxt('It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                    textAlign: TextAlign.left,
                    fontSize: 14,
                    color: AppColors.helpDeskColor),
                  ),
                ],
              ),
            ),
            addHeight(20),
            Center(child: addBoldTxt('You still have a question?',fontSize: 18,color: AppColors.primaryColor)),
            addRegularTxt('If you cannot find answer to your question in our FAQ, you can always contact us. We will answer to you shortly!',
            textAlign: TextAlign.center,
            fontSize: 12,
            color: AppColors.helpDeskColor),

            addHeight(20),
            Container(
              width: Get.width,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: AppColors.greyColor
                  )
              ),
              child: Column(
                children: [
                  SvgPicture.asset(AppAssets.chatIcon).marginOnly(bottom: 10),
                  addBoldTxt('Chat with Us',fontSize: 14,color: AppColors.primaryColor).marginOnly(bottom: 10),
                  addRegularTxt('We are always happy to help.',fontSize: 14,color: AppColors.helpDeskColor)
                ],
              ),
            ),

            addHeight(20),
            Container(
              width: Get.width,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.txtFieldFillColor,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: AppColors.greyColor
                  )
              ),
              child: Column(
                children: [
                  SvgPicture.asset(AppAssets.mailIcon,color: AppColors.helpDeskColor2,).marginOnly(bottom: 10),
                  addBoldTxt('Chat with Us',fontSize: 14,color: AppColors.helpDeskColor2).marginOnly(bottom: 10),
                  addRegularTxt('We are always happy to help.',fontSize: 14,color: AppColors.helpDeskColor)
                ],
              ),
            ),
               addHeight(20),


          ],
        ).marginSymmetric(horizontal: 20),
      ),
      bottomNavigationBar: NavBar2(),
    );
  }



  Widget boxCardWidget(String title, String image, bool borderTure ){
    return  Container(
                      height: 130.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: borderTure ? AppColors.helpDeskColor2: AppColors.blackColor2
                        )
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(
                          vertical: 16.h,
                          horizontal: 8.h,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            addHeight(5), 
                            SvgPicture.asset(image, color:borderTure ? AppColors.helpDeskColor2 :AppColors.blackColor,),
                             addHeight(10), 
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: addHeadingTxtMedium(
                              title,
                              fontSize: 15, 
                              color: AppColors.blackColor1.withOpacity(0.9),textAlign: TextAlign.center, fontFamily: 'times_roman', maxLines: 2, fontWeight: FontWeight.w500),
                        )
                          ],
                        ),
                      ),
                    );
  }
}
