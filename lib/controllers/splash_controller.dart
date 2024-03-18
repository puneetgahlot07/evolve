


import 'dart:developer';

import 'package:evolve/controllers/profile_controller.dart';
import 'package:evolve/resources/local_storage.dart';
import 'package:evolve/resources/utils.dart';
import 'package:evolve/routers/app_routers.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  // final controller =  Get.find<languageController>();

  @override
  void onInit() {
    super.onInit();

    Future.delayed(Duration.zero, () async {    
        String token = getValue(LocalStorage.TOKEN);  
        log(token.toString());
        if(token != ""){
          // final profile = Get.put(ProfileController());
          final profile = Get.find<ProfileController>();
       await profile.GetProfileApi();       
          // Get.offAllNamed(AppRoutes.bottomNav);
        }
        // else{
        //   // Get.offAllNamed();
        // }
    });
  }
}
