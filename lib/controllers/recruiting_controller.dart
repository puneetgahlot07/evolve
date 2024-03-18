
import 'package:evolve/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecruitingController extends GetxController with GetSingleTickerProviderStateMixin{
  // final controller =  Get.find<languageController>();

  List<Map<String, dynamic>> recruitingList = [
    {'title': 'Introduction', 'subTitle': '4 pages', 'isImage': true,'isButton': false,'isFav': false},
    {'title': 'Screening & Interview', 'subTitle': '4 pages', 'isImage': true,'isButton': false,'isFav': true},
    {'title': 'Offer & Hire', 'subTitle': '4 pages', 'isImage': false,'isButton': true, 'isFav': false},
    {'title': 'Quality of Hire, Time to...', 'subTitle': '4 pages', 'isImage': false,'isButton': true, 'isFav': false},
    {'title': 'HR and IT department co...', 'subTitle': '4 pages', 'isImage': false,'isButton': true,'isFav': false},
    {'title': 'Quality of Hire, Time to...', 'subTitle': '4 pages', 'isImage': false,'isButton': true,'isFav': false},
  ];

  @override
  void onInit() {
    super.onInit();
    // super.onInit();
  controller = TabController(vsync: this, length: myTabs.length);

    // Future.delayed(Duration(seconds: 2), () {
    //
    //     Get.offAllNamed(AppRoutes.onboardingScreen);
    // });
  }

  late TabController controller;

int   selectedTabIndex = 0;

final List<Tab> myTabs = <Tab>[
  Tab(text: 'Documentation'),
  Tab(text: 'Trainings'),
];
}
