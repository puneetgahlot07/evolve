import 'dart:developer';

import 'package:get/get.dart';

import '../common-widgets/custom_loader.dart';
import '../models/cart_category_list_model.dart';
import '../models/cart_sub_category_model.dart';
import '../resources/api_constant.dart';
import '../resources/apis.dart';
import '../resources/utils.dart';

class CategoryController extends GetxController{

  List<CartCategoryItemsList> categoryItemData = [];
  List<CartSubCategoryItemsData> subCategoryItemData = [];

  @override
  void onInit() {
    super.onInit();
    // getCategoryApi();
  }

  Future<void> getCategoryApi() async {
    checkInternetConnectivity().then((isConnected) async {

      if (isConnected) {

        try {
          showLoader(true);
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

          var result = await ApiHandler().PostApi(apiName: '${ApiUrls.subCategory}/$categoryId', data: map);
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
  }

}