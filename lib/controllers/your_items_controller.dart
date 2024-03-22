import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:evolve/Screens/other/pdf_view.dart';
import 'package:evolve/resources/app_assets.dart';
import 'package:evolve/resources/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../common-widgets/custom_loader.dart';
import '../models/faavourites_item_list_model.dart';
import '../models/purchased_list_model.dart';
import '../resources/api_constant.dart';
import '../resources/apis.dart';
import '../resources/utils.dart';

class YourItemsController extends GetxController with GetSingleTickerProviderStateMixin {
final List<Tab> myTabs = <Tab>[
  const Tab(text: 'Favorites'),
  const Tab(text: 'Purchased'),
];

late TabController controller;

int selectedTabIndex = 0;
int currentPage = 0;
late int totalPages;

RefreshController refreshFavoritesController = RefreshController(initialRefresh: false);
RefreshController refreshPurchaseController = RefreshController(initialRefresh: false);
RefreshController refreshHomeController = RefreshController(initialRefresh: false);
List<FavoritesItemsData> favoritesItemsData = [];
List<PurchasedItemsData> purchasedItemsData = [];

@override
void onInit() {
  super.onInit();
  controller = TabController(vsync: this, length: myTabs.length);
}

@override
void onClose() {
  controller.dispose();
  super.onClose();
}

Future<void> getFavouriteListApi() async {
  checkInternetConnectivity().then((isConnected) async {
    if (isConnected) {
      showLoader(true);
      try {
        var map = <String, dynamic>{};
        map['page'] = '1';
        map['limit'] = '10';

        var result = await ApiHandler().PostApi(apiName: ApiUrls.favouriteList, data: map);
        if(result != null){
          if(result['success'] == true){
            favoritesItemsData = FavoritesItemsListModel.fromJson(result).data?.items ?? [];
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

Future<void> getFavouriteAddRemoveApi({required String documentId}) async {
  checkInternetConnectivity().then((isConnected) async {
    if (isConnected) {
      showLoader(true);
      try {
        var map = <String, dynamic>{};
        map['document_id'] = documentId;

        var result = await ApiHandler().PostApi(apiName: ApiUrls. favouriteAddRemove, data: map);
        if(result != null){
          if(result['success'] == false){
            for (int i = 0; i < favoritesItemsData.length; i++) {
              if (favoritesItemsData[i].document!.id.toString() == documentId) {
                favoritesItemsData.removeAt(i);
                i--; // Adjust the index after removal
              }
            }
          }
        }
        update();
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

Future<void> getPurchasedListApi() async {
  checkInternetConnectivity().then((isConnected) async {
    if (isConnected) {
     
      try {
         showLoader(true);
        var map = <String, dynamic>{};
        map['page'] = '1';
        map['limit'] = '10';

        var result = await ApiHandler().PostApi(apiName: ApiUrls.purchasedList, data: map);
        if(result != null){
          if(result['success'] == true){
            purchasedItemsData.clear();
            purchasedItemsData.addAll(PurchasedListModel.fromJson(result).data?.items ?? []);
            update();
          }
        }
        showLoader(false);
      } catch (e) {
        showLoader(false);
        log("catch");
        log(e.toString());
        showToastError(e.toString(), );
        
      }
    } else {
      showToastError('No Internet'.tr);
      showLoader(false);
    }
  });
}


// Download Code
  //  static const platform = MethodChannel('file_access');
  String dirloc = "";
  Future<bool> downloadFile(String url, ) async {      
    // log("Hello Android");
   
    dirloc = "";
    update();
    final status;
    // = await Permission.storage.request()
     if (Platform.isAndroid) {
        AndroidDeviceInfo android = await DeviceInfoPlugin().androidInfo;
        if(android.version.sdkInt > 32){
          
        status =  await Permission.manageExternalStorage.request();
         dirloc = "${(await getExternalStorageDirectory())!.path}/download/evolve/";
        }
        else{        
        status = await Permission.storage.request();      
          dirloc = "${(await getExternalStorageDirectory())!.path}/download/evolve/";
        } 
      }
      else{
        status =  await Permission.storage.request();  
        dirloc = (await getApplicationDocumentsDirectory()).path;    
      }
    log(status.toString());
    if(dirloc != "") {      
      // String url = "https://v5.checkprojectstatus.com/evolve/public/documents/pdf/1710840089.pdf";
      var pdfName ="$dirloc" + url.split("/").last;
      if (await File(pdfName).exists()){     
        Get.to(()=> PdfViewPage(filePath: pdfName));
        return false;
      }
     else{  
      log("Download Code Block")           ;
      log('$pdfName');
      return true;
      }
  

    }
    else{
      log("Denied");
      if (Platform.isAndroid) {
        AndroidDeviceInfo android = await DeviceInfoPlugin().androidInfo;
        if(android.version.sdkInt > 32){
          await Permission.manageExternalStorage.request();
        }
        else{
           await Permission.storage.request();      
        }
      }
      else{
         await Permission.storage.request();      
      }
      return false;           
    }

    }



final List<FavList> itemsFav = [
  FavList(
    image: AppAssets.avatarIcon1,
    title: "Introduction",
    subTitle: "Description of Item Introduction",
    color: AppColors.orangeColor,
    isFav: true,
  ),
  FavList(
    image: AppAssets.avatarIcon2,
    title: "Mythology",
    subTitle: "Description of Mythology",
    color: AppColors.lightGreenColor,
    isFav: false,
  ),
  FavList(
    image: AppAssets.avatarIcon3,
    title: "Improvement",
    subTitle: "4 pages",
    color: AppColors.blueColor,
    isFav: true,
  ),
  FavList(
    image: AppAssets.avatarIcon4,
    title: "Quality of Hire, Time to...",
    subTitle: "4 pages",
    color: AppColors.brownColor,
    isFav: true,
  ),
];

final List<FavList> itemsFav2 = [
  FavList(
    image: AppAssets.avatarIcon1,
    title: "Introduction",
    subTitle: "4 pages",
    color: AppColors.orangeColor,
    isFav: true,
  ),
  FavList(
    image: AppAssets.avatarIcon2,
    title: "Mythology",
    subTitle:"4 pages",
    color: AppColors.lightGreenColor,
    isFav: false,
  ),
  FavList(
    image: AppAssets.avatarIcon3,
    title: "Improvement",
    subTitle: "4 pages",
    color: AppColors.blueColor,
    isFav: true,
  ),
  FavList(
    image: AppAssets.avatarIcon4,
    title: "Quality of Hire, Time to...",
    subTitle: "4 pages",
    color: AppColors.brownColor,
    isFav: true,
  ),
];
}

class FavList {
  String? image, title, subTitle;
  Color?color;
  bool? isFav;
  FavList({this.image, this.title, this.subTitle, this.color, this.isFav});
}



