
import 'dart:developer';
import 'dart:io';

import 'package:evolve/Screens/other/edit_profile.dart';
import 'package:evolve/models/change_password_model.dart';
import 'package:evolve/models/edit_profile_model.dart';
import 'package:evolve/models/profile_model.dart';
import 'package:evolve/resources/api_constant.dart';
import 'package:evolve/resources/apis.dart';
import 'package:evolve/resources/utils.dart';
import 'package:evolve/routers/app_routers.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../common-widgets/custom_loader.dart';
import '../main.dart';

class ProfileController extends GetxController {
  // final controller =  Get.find<languageController>();
 bool obscureText = true;
  bool confObscureText = true;

  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController confPasswordCtrl = TextEditingController();

  final editProfileKey = GlobalKey<FormState>();
  TextEditingController fNameCtrl = TextEditingController();
  TextEditingController lNameCtrl = TextEditingController();
  TextEditingController companyCtrl = TextEditingController();
  TextEditingController businessCtrl = TextEditingController();
String profilePhotoPath = "";

  final changePassKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  onPassSuffixTap(){
  obscureText = !obscureText;
  update();
}
confOnPassSuffixTap(){
  confObscureText = !confObscureText;
  update();
}
  ProfileModel profileData = ProfileModel();
  Future<bool> GetProfileApi() async {  
  checkInternetConnectivity().then((isConnected) async {
  if (isConnected) {
     showLoader(true);
    try {                                
      log(ApiUrls.profile);    
      var result = await ApiHandler().GetApi(apiName: ApiUrls.profile); 
      profileData = ProfileModel.fromJson(result);         
      if(result != null){  
      // initialCountry = profileData.data!.countryName ?? "US";
      // countryDialCode = profileData.data!.countryCode ?? "1";     
       
      update();   
      showLoader(false);  
       setEditProfileFile();   
      Get.offAllNamed(AppRoutes.bottomNav);      
      return true;
      }
      else{
        showToastError(profileData.message.toString());
        return false;
      }
      
  } catch (e) {
    log("catch");
    log(e.toString());
    showToastError(e.toString(), );  
    showLoader(false);
    return false;
    }
  } else {    
    showToastError('No Internet'.tr);
    showLoader(false);
    return false;
  }
});
   return true;
}



  ChangePasswordApi() async {
     fcmToken = (await FirebaseMessaging.instance.getToken())!;
  log(fcmToken.toString());
  checkInternetConnectivity().then((isConnected) async {
    
  if (isConnected) {
   
    showLoader(true);
    try {                      
      var map = <String, dynamic>{};
     
      map['password'] =    passwordCtrl.text.trim();
      map['confirm_password'] = confPasswordCtrl.text.trim();
      log(ApiUrls.changepassword);
      log(map.toString());

      var result = await ApiHandler().PostApi(apiName: ApiUrls.changepassword, data: map);     
      if(result != null){
      ChangePasswordModel res = ChangePasswordModel.fromJson(result);
      // update();  
       update();  
      showToast(res.message!);      
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

setEditProfileFile(){
    fNameCtrl.text = profileData.data!.firstName!;
    lNameCtrl.text = profileData.data!.lastName!;
    businessCtrl.text =  profileData.data!.businessTitle!;
    companyCtrl.text =  profileData.data!.company!;
}

final _picker = ImagePicker();
late File image;
Future<XFile?> getImageToCamera() async {
    final pickedFile = 
    // camerabool
    //     ? await _picker.pickImage(source: ImageSource.camera):
    await _picker.pickImage(source: ImageSource.camera,imageQuality: 50);
    if (pickedFile != null) {
      image = File(pickedFile.path);      
      return pickedFile;         
    } else {
       print('No image selected.');
      return null;
     
    }
  }

  Future<XFile?> getVideoToGallery() async {
    final pickedFile = 
    // camerabool
    //     ? await _picker.pickImage(source: ImageSource.gallery):
    await _picker.pickImage(source: ImageSource.gallery,imageQuality: 50);
    if (pickedFile != null) {
      image = File(pickedFile.path);      
      return pickedFile;         
    } else {
       print('No image selected.');
      return null;
     
    }
  }


  Future<void> EditProfileApi() async {  
  // fcmToken = (await FirebaseMessaging.instance.getToken())!;
  // log(fcmToken.toString());
  checkInternetConnectivity().then((isConnected) async {
    
  if (isConnected) {
   
    showLoader(true);
    try {                      
      var map = <String, dynamic>{};
      var file = <String, dynamic>{};
      // map['email'] =    profileData.data!.email;
      // map['password'] =    passwordCtrl.text.trim();
      map['first_name'] = fNameCtrl.text.trim();
      map['last_name'] = lNameCtrl.text.trim();
      map['business_title'] = businessCtrl.text.trim();
      map['company'] = companyCtrl.text.trim(); 
      file['image'] = profilePhotoPath;     
      log(ApiUrls.register);
      log(map.toString());

      var result = await ApiHandler().PostMultipartApi(apiName: ApiUrls.profileUpdate, data: map, files: file,);     
      if(result != null){
      EditProfileModel res = EditProfileModel.fromJson(result);
      showLoader(false);
      update();  
      if(res.success!){      
        showToast(res.message!.toString());
        FatchProfileApi();
        Get.back();
        
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


Future<bool> FatchProfileApi() async {  
  checkInternetConnectivity().then((isConnected) async {
  if (isConnected) {
     showLoader(true);
    try {                                
      log(ApiUrls.profile);    
      var result = await ApiHandler().GetApi(apiName: ApiUrls.profile); 
      profileData = ProfileModel.fromJson(result);         
      if(result != null){  
      // initialCountry = profileData.data!.countryName ?? "US";
      // countryDialCode = profileData.data!.countryCode ?? "1";     
       
      update();   
      showLoader(false);  
      setEditProfileFile();   
      // Get.offAllNamed(AppRoutes.bottomNav);      
      return true;
      }
      else{
        showToastError(profileData.message.toString());
        return false;
      }
      
  } catch (e) {
    log("catch");
    log(e.toString());
    showToastError(e.toString(), );  
    showLoader(false);
    return false;
    }
  } else {    
    showToastError('No Internet'.tr);
    showLoader(false);
    return false;
  }
});
   return true;
}
}
