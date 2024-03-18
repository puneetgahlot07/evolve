import 'package:evolve/common-widgets/custom_appbar_one.dart';
import 'package:evolve/common-widgets/custom_button.dart';
import 'package:evolve/resources/app_assets.dart';
import 'package:evolve/resources/app_color.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:evolve/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({super.key});

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarOne(
        isAction: false,
        leadingOnTap: (){
          Get.back();
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Image.asset(AppAssets.paymentSuccess,height: 200.h,),
          addHeight(20),
          addBoldTxt('Payment Successful',fontSize: 20,fontWeight: FontWeight.w600,color: AppColors.primaryColor),
          addHeight(10),
          addRegularTxt('Your order is on its way. You will receive a confirmation email shortly.',fontSize: 14,textAlign: TextAlign.center,color: AppColors.greyColor1),Spacer(),
        CustomButton(
            radius: 20,
            height: 52.h,
            width: Get.width*0.8,
            fontWeight: FontWeight.w400,
            text: 'Continue', onPressed: (){
              Get.offAllNamed(AppRoutes.bottomNav);
            }), 
            addHeight(10),
        ],
      ).marginSymmetric(horizontal: 20),
    );
  }
}
