import 'dart:developer';

import 'package:evolve/controllers/your_items_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../common-widgets/custom_loader.dart';
import '../models/cart_list_model.dart';
import '../models/documentation_list_model.dart';
import '../resources/api_constant.dart';
import '../resources/apis.dart';
import '../resources/utils.dart';

class CartController extends GetxController
    with GetSingleTickerProviderStateMixin {
  List<DocumentationListItems> documentationListItems = [];
  List<CartListItems> cartListItems = [];
  RefreshController refreshDocumentationController =
      RefreshController(initialRefresh: false);
  RefreshController refreshTrainingController =
      RefreshController(initialRefresh: false);
  RefreshController refreshCartController =
      RefreshController(initialRefresh: false);
  late TabController controller;
  int selectedTabIndex = 0;
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Documentation'),
    const Tab(text: 'Trainings'),
  ];

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: myTabs.length);
    // getCategoryApi();
    getCartListApi();
    final yourItemController = Get.put(YourItemsController());
    yourItemController.getPurchasedListApi();
  }

  Future<void> getCartListApi() async {
    checkInternetConnectivity().then((isConnected) async {
      if (isConnected) {
        showLoader(true);
        try {
          var map = <String, dynamic>{};
          map['page'] = '1';
          map['limit'] = '100';
          map['search'] = '';

          var result =
              await ApiHandler().PostApi(apiName: ApiUrls.cart, data: map);
          if (result != null) {
            if (result['success'] == true) {
              cartListItems.clear();
              cartListItems
                  .addAll(CartListModel.fromJson(result).data?.items ?? []);
              update();
            }
          }
          showLoader(false);
        } catch (e) {
          log("catch");
          log(e.toString());
          showToastError(
            e.toString(),
          );
          showLoader(false);
        }
      } else {
        showToastError('No Internet'.tr);
        showLoader(false);
      }
    });
  }

  Future<void> removeCartListApi({required String productId}) async {
    checkInternetConnectivity().then((isConnected) async {
      if (isConnected) {
        showLoader(true);
        try {
          var map = <String, dynamic>{};
          map['product_id'] = productId;

          var result = await ApiHandler()
              .PostApi(apiName: ApiUrls.removeCart, data: map);
          if (result != null) {
            if (result['success'] == true) {
              for (int i = 0; i < cartListItems.length; i++) {
                if (cartListItems[i].productId.toString() == productId) {
                  cartListItems.removeAt(i);
                  i--; // Adjust the index after removal
                }
              }
            }
            showToastError(result['message']);
          }
          update();
          showLoader(false);
        } catch (e) {
          log("catch");
          log(e.toString());
          showToastError(
            e.toString(),
          );
          showLoader(false);
        }
      } else {
        showToastError('No Internet'.tr);
        showLoader(false);
      }
    });
  }

  Future<void> addCartApi(
      {required String productId, required String price}) async {
    checkInternetConnectivity().then((isConnected) async {
      if (isConnected) {
        showLoader(true);
        try {
          var map = <String, dynamic>{};
          map['product_id'] = productId;
          map['price'] = price;

          var result =
              await ApiHandler().PostApi(apiName: ApiUrls.addCart, data: map);
          if (result != null) {
            showToastError(result['message']);
          }
          showLoader(false);
        } catch (e) {
          log("catch");
          log(e.toString());
          showToastError(
            e.toString(),
          );
          showLoader(false);
        }
      } else {
        showToastError('No Internet'.tr);
        showLoader(false);
      }
    });
  }

  /*Future<void> getCategoryApi() async {
    checkInternetConnectivity().then((isConnected) async {

      if (isConnected) {

        showLoader(true);
        try {
          var map = <String, dynamic>{};
          map['page'] = '1';
          map['limit'] = '100';
          map['search'] = '';

          var result = await ApiHandler().PostApi(apiName: ApiUrls.category, data: map);
          if(result != null){
            if(result['success'] == true){
              categoryItemData = CartCategoryListModel.fromJson(result).data?.items ?? [];
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

  Future<void> getSubCategoryApi({required String categoryId}) async {
    checkInternetConnectivity().then((isConnected) async {
      if (isConnected) {
        showLoader(true);
        try {
          var map = <String, dynamic>{};
          map['page'] = '1';
          map['limit'] = '100';
          map['search'] = '';

          var result = await ApiHandler().PostApi(apiName: '${ApiUrls.setDefaultCard}/$categoryId', data: map);
          if(result != null){
            if(result['success'] == true){
              subCategoryItemData.addAll(CartSubCategoryModel.fromJson(result).data?.items ?? []);
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
  }*/

  Future<void> getDocumentsApi({required String categoryName}) async {
    checkInternetConnectivity().then((isConnected) async {
      if (isConnected) {
        showLoader(true);
        try {
          var map = <String, dynamic>{};
          map['page'] = '1';
          map['limit'] = '10';
          map['search'] = '';
          map['category'] = '';

          var result = await ApiHandler()
              .PostApi(apiName: ApiUrls.documentation, data: map);
          if (result != null) {
            if (result['success'] == true) {
              documentationListItems.clear();
              documentationListItems.addAll(
                  DocumentationListModel.fromJson(result).data?.items ?? []);
              update();
            }
          }
          showLoader(false);
        } catch (e) {
          log("catch");
          log(e.toString());
          showToastError(
            e.toString(),
          );
          showLoader(false);
        }
      } else {
        showToastError('No Internet'.tr);
        showLoader(false);
      }
    });
  }

  List<Map<String, dynamic>> recruitingList = [
    {
      'title': 'Introduction',
      'subTitle': '4 pages',
      'isImage': true,
      'isButton': false,
      'isFav': false
    },
    {
      'title': 'Screening & Interview',
      'subTitle': '4 pages',
      'isImage': true,
      'isButton': false,
      'isFav': true
    },
    {
      'title': 'Offer & Hire',
      'subTitle': '4 pages',
      'isImage': false,
      'isButton': true,
      'isFav': false
    },
    {
      'title': 'Quality of Hire, Time to...',
      'subTitle': '4 pages',
      'isImage': false,
      'isButton': true,
      'isFav': false
    },
    {
      'title': 'HR and IT department co...',
      'subTitle': '4 pages',
      'isImage': false,
      'isButton': true,
      'isFav': false
    },
    {
      'title': 'Quality of Hire, Time to...',
      'subTitle': '4 pages',
      'isImage': false,
      'isButton': true,
      'isFav': false
    },
  ];

  List<Map<String, String>> mySubscription = [
    {
      'title': 'Methodology',
      'des': '4 pages',
      'image': 'assets/images/mysub1.png',
    },
    {
      'title': 'Improvement',
      'des': '9 pages',
      'image': 'assets/images/mysub2.png',
    },
    {
      'title': 'Methodology',
      'des': '4 pages',
      'image': 'assets/images/mysub1.png',
    },
    {
      'title': 'Improvement',
      'des': '9 pages',
      'image': 'assets/images/mysub2.png',
    },
  ];
}
