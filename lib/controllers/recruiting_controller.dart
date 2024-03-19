
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common-widgets/custom_loader.dart';
import '../models/cart_sub_category_model.dart';
import '../resources/api_constant.dart';
import '../resources/apis.dart';
import '../resources/utils.dart';

class RecruitingController extends GetxController with GetSingleTickerProviderStateMixin{
  // final controller =  Get.find<languageController>();



  Future<void> getSubCategoryApi({required String categoryId}) async {
    checkInternetConnectivity().then((isConnected) async {

      if (isConnected) {

        showLoader(true);
        try {
          var map = <String, dynamic>{};
          map['page'] = '1';
          map['limit'] = '100';
          map['search'] = '';

          var result = await ApiHandler().PostApi(apiName: '${ApiUrls.cartSubCategory}/$categoryId', data: map);
          if(result != null){
            print('Rest --- > ${result}');
            if(result['success'] == true){
              // categoryItemData = CartSubCategoryModel.fromJson(result).data?.items ?? [];
              update();
            }
          }
          showLoader(false);
        } catch (e) {
          log("catch");
          log(e.toString());
          showToastError(e.toString(), );
          showLoader(false);
        }
      } else {
        showToastError('No Internet'.tr);
        showLoader(false);
      }
    });
  }


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
