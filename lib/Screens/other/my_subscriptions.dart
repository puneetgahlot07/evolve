import 'package:evolve/common-widgets/custom_appbar_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common-widgets/custom_card.dart';

class MySubscription extends StatefulWidget {
  const MySubscription({super.key});

  @override
  State<MySubscription> createState() => _MySubscriptionState();
}

class _MySubscriptionState extends State<MySubscription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarOne(
        title: "My Subscriptions",
        centerTitle: true,
        leadingOnTap: () {
          Get.back();
        },
        isAction: false,
      ),
      body: GridView.count(
  shrinkWrap: true,
  // physics: NeverScrollableScrollPhysics(),
       crossAxisSpacing: 6.0,
          mainAxisSpacing: 8.0,
    crossAxisCount: 2,
       childAspectRatio : 1.2,

    children: List.generate(20, (index) => Padding(
            padding:  EdgeInsets.symmetric( horizontal: 10.0.sp, vertical: 2.sp),
      child: CustomCard(title: 'Methodology', 
      des: '4 pages',  img: 'assets/images/mysub1.png', 
      onTap: () {  },),
    ))),
    );
  }
}