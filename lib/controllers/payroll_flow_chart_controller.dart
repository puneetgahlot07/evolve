import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:evolve/Screens/other/pdf_view.dart';
import 'package:flutter/services.dart';
// import 'package:evolve/routers/app_routers.dart';
// import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class PayRollFlowChartController extends GetxController {
  // final controller =  Get.find<languageController>();

  List<Map<String, dynamic>> payRollFlowList = [
    {'title': 'Introduction', 'subTitle': '4 pages', 'isImage': true,'isButton': false,'isFav': false},
    {'title': 'Methodology', 'subTitle': '4 pages', 'isImage': true,'isButton': false,'isFav': true},
    {'title': 'Improvement', 'subTitle': '4 pages', 'isImage': false,'isButton': true, 'isFav': false},
    {'title': 'Quality of Hire, Time to...', 'subTitle': '4 pages', 'isImage': false,'isButton': true, 'isFav': false},
    {'title': 'HR and IT department co...', 'subTitle': '4 pages', 'isImage': false,'isButton': true,'isFav': false},
    {'title': 'Quality of Hire, Time to...', 'subTitle': '4 pages', 'isImage': false,'isButton': true,'isFav': false},
  ];

  @override
  void onInit() {
    super.onInit();

    // Future.delayed(Duration(seconds: 2), () {
    //
    //     Get.offAllNamed(AppRoutes.onboardingScreen);
    // });
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

}