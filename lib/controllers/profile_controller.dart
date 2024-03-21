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
import '../common-widgets/web_view_screen.dart';
import '../main.dart';
import '../models/card_list_model.dart';
import '../models/cms_pges_model.dart';
import '../models/subscription_plan_model.dart';

class ProfileController extends GetxController {
  // final controller =  Get.find<languageController>();
  bool obscureText = true;
  bool confObscureText = true;
  final htmlText = ''.obs;

  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController confPasswordCtrl = TextEditingController();

  final editProfileKey = GlobalKey<FormState>();
  TextEditingController fNameCtrl = TextEditingController();
  TextEditingController lNameCtrl = TextEditingController();
  TextEditingController companyCtrl = TextEditingController();
  TextEditingController businessCtrl = TextEditingController();
  String profilePhotoPath = "";

  final changePassKey = GlobalKey<FormState>();
  List<SubscriptionPlanData> subscriptionPlan = [];
  List<CardListData> cardDataItemList = [];

  @override
  void onInit() {
    super.onInit();
  }

  onPassSuffixTap() {
    obscureText = !obscureText;
    update();
  }

  confOnPassSuffixTap() {
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
          if (result != null) {
            // initialCountry = profileData.data!.countryName ?? "US";
            // countryDialCode = profileData.data!.countryCode ?? "1";

            update();
            showLoader(false);
            setEditProfileFile();
            Get.offAllNamed(AppRoutes.bottomNav);
            return true;
          } else {
            showToastError(profileData.message.toString());
            return false;
          }
        } catch (e) {
          log("catch");
          log(e.toString());
          showToastError(
            e.toString(),
          );
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

//Get Subscription Plan API
  Future<void> getSubscriptionPlanApi() async {
    checkInternetConnectivity().then((isConnected) async {
      if (isConnected) {
        showLoader(true);
        try {
          var result =
              await ApiHandler().GetApi(apiName: ApiUrls.getSubscriptionPlan);
          if (result != null) {
            if (result['success'] == true) {
              subscriptionPlan =
                  SubscriptionPlanModel.fromJson(result).data ?? [];
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

  Future<void> addCardApi() async {
    checkInternetConnectivity().then((isConnected) async {
      if (isConnected) {
        showLoader(true);
        try {
          var map = <String, dynamic>{};
          // map['stripe_price_id'] = subStripePriceId;

          var result =
              await ApiHandler().GetApi(apiName: ApiUrls.addCard);
          if (result != null) {
            if (result['success'] == true) {
              showLoader(false);
              Navigator.of(Get.context!).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          WebViewScreen(
                            url: result['data'],
                            appBarTitle: 'Credit & Debit Card',
                          )));
            }
          }
          // showLoader(false);
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

  Future<void> getCardListApi({bool isShowLoader = false}) async {
    checkInternetConnectivity().then((isConnected) async {
      if (isConnected) {
        isShowLoader ? null : showLoader(true);
        try {
          var result =
              await ApiHandler().GetApi(apiName: ApiUrls.getCardList);
          if (result != null) {
            isShowLoader ? null : showLoader(false);
            if (result['success'] == true) {
              cardDataItemList.clear();
              cardDataItemList.addAll(CardListModel.fromJson(result).data ?? []);
              update();
            }
          }
          // showLoader(false);
        } catch (e) {
          log("catch");
          log(e.toString());
          showToastError(
            e.toString(),
          );
          isShowLoader ? null : showLoader(false);
        }
      } else {
        showToastError('No Internet'.tr);
        showLoader(false);
      }
    });
  }

  Future<void> setDefaultCardApi({required String cardId}) async {
    checkInternetConnectivity().then((isConnected) async {
      if (isConnected) {
        showLoader(true);
        try {
          var map = <String, dynamic>{};
          map['card_id'] = cardId;

          var result =
              await ApiHandler().PostApi(apiName: ApiUrls.setDefaultCard, data: map);
          if (result != null) {
            if (result['success'] == true) {
              getCardListApi();
            }else{
              showToastError(result['message']);
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

  Future<void> removeCardApi({required String cardId}) async {
    checkInternetConnectivity().then((isConnected) async {
      if (isConnected) {
        showLoader(true);
        try {
          var map = <String, dynamic>{};
          map['card_id'] = cardId;

          var result =
              await ApiHandler().PostApi(apiName: ApiUrls.removeCard, data: map);
          if (result != null) {
            if (result['success'] == true) {
              getCardListApi();
            }else{
              showToastError(result['message']);
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


  Future<void> createSubscriptionPlanApi({required String subStripePriceId}) async {
    checkInternetConnectivity().then((isConnected) async {
      if (isConnected) {
        showLoader(true);
        try {
          var map = <String, dynamic>{};
          map['stripe_price_id'] = subStripePriceId;

          var result =
              await ApiHandler().PostApi(apiName: ApiUrls.createSubscriptionPlan, data: map);
          if (result != null) {
            if (result['success'] == true) {
              showLoader(false);
              Get.toNamed(AppRoutes.paymentSuccessScreen);
              // subscriptionPlan =
              //     SubscriptionPlanModel.fromJson(result).data ?? [];
              update();
            }else{
              showLoader(false);
              showToastError(result['message']);
            }
          }
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

//Get CMS Pages
  Future<void> getCMSPagesApi({required String slug}) async {
    checkInternetConnectivity().then((isConnected) async {
      if (isConnected) {
        showLoader(true);
        try {
          var result =
              await ApiHandler().GetApi(apiName: '${ApiUrls.cmsPages}/$slug');
          if (result != null) {
            if (result['success'] == true) {
              CMSPagesData? cmsPagesModel =
                  CMSPagesModel.fromJson(result).data ?? CMSPagesData();
              String oldDes = cmsPagesModel.description ?? '';
              htmlText.value = '''<!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
        </head>
        <body style="color:white">''';

              if (cmsPagesModel.description != null) {
                htmlText.value += oldDes;
              } else {
                htmlText.value += 'Coming Soon....';
              }
              htmlText.value += '''</body></html>''';
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

  var planSeletedIndex;
  var subscriptionPlan1 = [
    {
      'title': 'Learning Basic',
      'data': ['Process Flow', 'Tips And Tricks', 'Ask 2 Help Desk Questions'],
      'des':
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
      'price': '\$99/Mouth'
    },
    {
      'title': 'Learning Premium',
      'data': [
        'Process Flow',
        'Trainings',
        'Tips And Tricks',
        'Ask 5 Help Desk Questions'
      ],
      'des':
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
      'price': '\$199/Mouth'
    },
    {
      'title': 'Learning Premium+',
      // 'des':
      'data': [
        'Process Flow',
        'Trainings',
        'Tips And Tricks',
        'Ask 10 Help Desk Questions'
      ],
      'des':
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
      'price': '\$299/Mouth'
    }
  ];

  ChangePasswordApi() async {
    fcmToken = (await FirebaseMessaging.instance.getToken())!;
    log(fcmToken.toString());
    checkInternetConnectivity().then((isConnected) async {
      if (isConnected) {
        showLoader(true);
        try {
          var map = <String, dynamic>{};

          map['password'] = passwordCtrl.text.trim();
          map['confirm_password'] = confPasswordCtrl.text.trim();
          log(ApiUrls.changepassword);
          log(map.toString());

          var result = await ApiHandler()
              .PostApi(apiName: ApiUrls.changepassword, data: map);
          if (result != null) {
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

  setEditProfileFile() {
    fNameCtrl.text = profileData.data!.firstName!;
    lNameCtrl.text = profileData.data!.lastName!;
    businessCtrl.text = profileData.data!.businessTitle!;
    companyCtrl.text = profileData.data!.company!;
  }

  final _picker = ImagePicker();
  late File image;

  Future<XFile?> getImageToCamera() async {
    final pickedFile =
        // camerabool
        //     ? await _picker.pickImage(source: ImageSource.camera):
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
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
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
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
          var result;
          if (profilePhotoPath != '' && profilePhotoPath.isNotEmpty) {
            result = await ApiHandler().PostMultipartApi(
                apiName: ApiUrls.profileUpdate, data: map, files: file);
          } else {
            result = await ApiHandler()
                .PostApi(apiName: ApiUrls.profileUpdate, data: map);
          }
          if (result != null) {
            EditProfileModel res = EditProfileModel.fromJson(result);
            showLoader(false);
            update();
            if (res.success!) {
              showToast(res.message!.toString());
              FatchProfileApi();
              Get.back();
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

  Future<bool> FatchProfileApi() async {
    checkInternetConnectivity().then((isConnected) async {
      if (isConnected) {
        showLoader(true);
        try {
          log(ApiUrls.profile);
          var result = await ApiHandler().GetApi(apiName: ApiUrls.profile);
          profileData = ProfileModel.fromJson(result);
          if (result != null) {
            // initialCountry = profileData.data!.countryName ?? "US";
            // countryDialCode = profileData.data!.countryCode ?? "1";

            update();
            showLoader(false);
            setEditProfileFile();
            // Get.offAllNamed(AppRoutes.bottomNav);
            return true;
          } else {
            showToastError(profileData.message.toString());
            return false;
          }
        } catch (e) {
          log("catch");
          log(e.toString());
          showToastError(
            e.toString(),
          );
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
