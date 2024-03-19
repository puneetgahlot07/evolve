import 'dart:developer';

import 'package:evolve/models/cart_category_list_model.dart';
import 'package:get/get.dart';

import '../common-widgets/custom_loader.dart';
import '../models/cart_sub_category_model.dart';
import '../resources/api_constant.dart';
import '../resources/apis.dart';
import '../resources/utils.dart';

class CartController extends GetxController {

  List<CartCategoryItemsList> categoryItemData = [];
  List<CartSubCategoryItemsData> subCategoryItemData = [];

  @override
  void onInit() {
    super.onInit();
    getCartCategoryApi();
  }


  Future<void> getCartCategoryApi() async {
    checkInternetConnectivity().then((isConnected) async {

      if (isConnected) {

        showLoader(true);
        try {
          var map = <String, dynamic>{};
          map['page'] = '1';
          map['limit'] = '100';
          map['search'] = '';

          var result = await ApiHandler().PostApi(apiName: ApiUrls.cartCategory, data: map);
          if(result != null){
            print('Rest --- > ${result}');
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

          var result = await ApiHandler().PostApi(apiName: '${ApiUrls.cartSubCategory}/$categoryId', data: map);
          if(result != null){
            print('Rest --- > ${result}');
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
  }

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
    },];

}
