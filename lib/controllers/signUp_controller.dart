
import 'dart:developer';
import 'dart:io';

import 'package:evolve/common-widgets/custom_loader.dart';
import 'package:evolve/controllers/profile_controller.dart';
import 'package:evolve/main.dart';
import 'package:evolve/models/register_model.dart';
import 'package:evolve/resources/api_constant.dart';
import 'package:evolve/resources/apis.dart';
import 'package:evolve/resources/local_storage.dart';
// import 'package:evolve/resources/local_storage.dart';
import 'package:evolve/resources/utils.dart';
// import 'package:evolve/routers/app_routers.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  bool obscureText = true; 
  final signinKey = GlobalKey<FormState>();
  TextEditingController fNameCtrl = TextEditingController();
  TextEditingController lNameCtrl = TextEditingController();
  TextEditingController companyCtrl = TextEditingController();
  TextEditingController businessCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  onPassSuffixTap(){
    obscureText = !obscureText;
    update();
  }


  @override
  void onInit() {
    super.onInit();

    // Future.delayed(Duration(seconds: 2), () {
    //
    //     Get.offAllNamed(AppRoutes.onboardingScreen);
    // });
  }

  RegisterModel registerModel = RegisterModel();

  Future<void> SignInApi() async {  
  fcmToken = (await FirebaseMessaging.instance.getToken())!;
  log(fcmToken.toString());
  checkInternetConnectivity().then((isConnected) async {
    
  if (isConnected) {
   
    showLoader(true);
    try {                      
      var map = <String, dynamic>{};
      map['email'] = 
      emailCtrl.text.trim();
      map['password'] =    passwordCtrl.text.trim();
      map['first_name'] = fNameCtrl.text.trim();
      map['last_name'] = lNameCtrl.text.trim();
      map['business_title'] = businessCtrl.text.trim();
      map['company'] = companyCtrl.text.trim();      
      map['device_token'] = fcmToken;
      map['device_type'] =   Platform.isAndroid ? "Android" : "Ios";
      log(ApiUrls.register);
      log(map.toString());

      var result = await ApiHandler().PostApi(apiName: ApiUrls.register, data: map);     
      if(result != null){
      registerModel = RegisterModel.fromJson(result);
      showLoader(false);
      update();  
      if(registerModel.success!){
        storeValue(LocalStorage.TOKEN, registerModel.data!.token!.toString()); 
        //  final profile = Get.put(ProfileController());
        final profile = Get.find<ProfileController>();
         await profile.GetProfileApi();        
      }
      //  if(rememberme){
      //   storeBoolValue(LocalStorage.REMERBERME, true);           
      // }   
      // storeValue(LocalStorage.TOKEN, logindata!.data!.token!.toString());
     
      // Get.offAllNamed(AppRoutes.splashScreen);  
     
      // Get.offAllNamed(AppRoutes.bottomNav);  
      
              
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
