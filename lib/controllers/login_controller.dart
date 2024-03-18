
import 'dart:developer';
import 'dart:io';

import 'package:evolve/common-widgets/custom_loader.dart';
import 'package:evolve/controllers/profile_controller.dart';
import 'package:evolve/main.dart';
import 'package:evolve/models/forget_model.dart';
import 'package:evolve/models/login_model.dart';
import 'package:evolve/resources/api_constant.dart';
import 'package:evolve/resources/apis.dart';
import 'package:evolve/resources/local_storage.dart';
import 'package:evolve/resources/utils.dart';
import 'package:evolve/routers/app_routers.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  bool obscureText = true;
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController forgetemailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  final loginKey = GlobalKey<FormState>();
  final forgetKey = GlobalKey<FormState>();
  LoginModel?  logindata;
  

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
Future<void> LoginApi() async {  
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
      map['device_token'] = fcmToken;
      // if(Platform.isAndroid)
      map['device_type'] =   Platform.isAndroid ? "Android" : "Ios";
      log(ApiUrls.login);
      log(map.toString());

      var result = await ApiHandler().PostApi(apiName: ApiUrls.login, data: map);     
      if(result != null){
      logindata = LoginModel.fromJson(result);
      update();  
      //  if(rememberme){
      //   storeBoolValue(LocalStorage.REMERBERME, true);           
      // }   
      storeValue(LocalStorage.TOKEN, logindata!.data!.token!.toString());
     
      // Get.offAllNamed(AppRoutes.splashScreen);  
      final profile = Get.find<ProfileController>();
       await profile.GetProfileApi();        
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
Future<void> ForgetApi() async {  
  fcmToken = (await FirebaseMessaging.instance.getToken())!;
  log(fcmToken.toString());
  checkInternetConnectivity().then((isConnected) async {
    
  if (isConnected) {
   
    showLoader(true);
    try {                      
      var map = <String, dynamic>{};
      map['email'] = forgetemailCtrl.text.trim();
      // map['password'] =    passwordCtrl.text.trim();
      // map['device_token'] = fcmToken;
      // // if(Platform.isAndroid)
      // map['device_type'] =   Platform.isAndroid ? "Android" : "Ios";
      log(ApiUrls.forgotpassword);
      log(map.toString());
      var result = await ApiHandler().PostApi(apiName: ApiUrls.forgotpassword, data: map);     
      if(result != null){
    ForgetModel  forgetModel = ForgetModel.fromJson(result);
      update();  
      showToast(forgetModel.message!);
      //  if(rememberme){
      //   storeBoolValue(LocalStorage.REMERBERME, true);           
      // }   
      // storeValue(LocalStorage.TOKEN, logindata!.data!.token!.toString());     
      // Get.offAllNamed(AppRoutes.splashScreen);  
      // final profile = Get.put(ProfileController());
      //  await profile.GetProfileApi();        
      Get.back();  
              
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
