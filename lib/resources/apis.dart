import 'dart:developer';
// import 'package:dio/dio.dart';
import 'package:evolve/main.dart';
import 'package:evolve/resources/local_storage.dart';
import 'package:evolve/resources/utils.dart';
import 'package:evolve/routers/app_routers.dart';
import 'package:dio/dio.dart';

// import 'package:get/get_connect/http/src/multipart/form_data.dart';
// import 'package:get/get_connect/http.dart'; 

import 'package:get/get.dart' as Get;

class ApiHandler{
     String token = getValue(LocalStorage.TOKEN);
     
    
    final Dio _dio  = Dio();

  // Post Function
  Future<dynamic>  PostApi({required String apiName, required Map<String, dynamic> data}) async {
    try {
     log('Bearer $token');
      if(token == ""){
      token = globalToken;
      }
    // _dio.options.headers['Authorization'] = '$token';
    // _dio.options.headers['Accept'] = 'application/json'; 
    final response = await _dio.post(apiName, data: data,
     options: Options(
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      }
    )
    );
     print('response: ${response}');
     print('API URL: ${apiName}');
    var res = response.data;
    print('Status Code: ${response.statusCode}');
    print('Response Body $apiName:\n $res');   
    if (response.statusCode == 200) {
      return res ; // Change this according to the structure of your error response
    } else {
      // Handle other status codes here
      return res as Map<String, dynamic>; 
    }
  } on DioError catch (e) {
    print(e.response.toString());
    if (e.response != null) {
      print('Dio error: ${e.response!.statusCode}');              
      if(e.response!.statusCode == 422){
        log("422 case");
        log(e.response!.statusMessage.toString());
        // showToastError(e.response!.statusMessage['message'].toString());
        showToastError(e.response!.data['message'].toString());
        return null;
        // return e.response as Map<String, dynamic>; 
      }
      else if(e.response!.statusCode == 401){
        token = "";
        globalToken = "";     
        Get.Get.offAllNamed(AppRoutes.loginScreen); 
        // Get.toNamed(AppRoutes.loginScreen);
        // LoginController().signOutApi();
         return null;
      }
      else if(e.response!.statusCode == 400){
        log("400 case");
        log(e.response!.statusMessage.toString());
        showToastError(e.response!.data['message'].toString());
         return null;
      }
      else{
        log("other case");
         log(e.response!.statusMessage.toString());
        //  print()
        showToastError(e.response!.data['message'].toString());
         return null;
        //  return e.response as Map<String, dynamic>; 
      }
      
    } else {
      print('Dio request failed: ${e.message}');
      return e.response  as Map<String, dynamic>; 
      
    }
  }
  }

  Future<dynamic>  GetApi({required String apiName}) async {
    // if(token != '')
    // _dio.options.headers['Authorization'] = token;
    // options.headers.addAll({'Authorization': 'Bearer $token'});
    // _dio.options.headers['Accept'] = 'application/json'; 
    try {
    log('$token');
     if(token == ""){
      token = globalToken;
      }
   
    final response = await _dio.get(apiName,
    options: Options(
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      }
    )
    );
   
    var res = response.data;
    print('Status Code: ${response.statusCode}');
    print('Response Body $apiName:\n $res');

    if (response.statusCode == 200) {
      return res ; // Change this according to the structure of your error response
    } else {
      // Handle other status codes here
      return res as Map<String, dynamic>; 
    }
  } on DioError catch (e) {
    if (e.response != null) {
      print('Dio error: ${e.response!.statusCode}');                   
      if(e.response!.statusCode == 422){
        log("422 case");
        log(e.response!.statusMessage.toString());
        showToastError(e.response!.data['message'].toString());
        return null;
        // return e.response as Map<String, dynamic>; 
      }
      else if(e.response!.statusCode == 400){
        log("400 case");
        log(e.response!.statusMessage.toString());
        showToastError(e.response!.data['message'].toString());
         return null;
      }
      else if(e.response!.statusCode == 401){
          token = "";
          globalToken = ""; 
          Get.Get.offAllNamed(AppRoutes.loginScreen);       
        // Get.toNamed(AppRoutes.loginScreen);
        // LoginController().signOutApi();
         return null;
      }
      else{
        log("other case");
         log(e.response!.statusMessage.toString());
        showToastError(e.response!.data['message'].toString());
         return null;
        //  return e.response as Map<String, dynamic>; 
      }
      
    } else {
      print('Dio request failed: ${e.message}');
      showToastError(e.message.toString());
      return null;
      // e.response  as Map<String, dynamic>; 
      
    }
  }
  }
// Future<dynamic> PostMultipartApi({
//       required String apiName,
//       required Map<String, dynamic> data,
//       required Map<String, dynamic> files,
//     }) async {
//       try {
//           if(token == ""){
//       token = globalToken;
//       }        
//       } catch (e) {
        
//       }
//     }

  Future<dynamic> PostMultipartApi({
      required String apiName,
      required Map<String, dynamic> data,
      required Map<String, dynamic> files,
    }) async {
      try {
        log('$token');
         if(token == ""){
      token = globalToken;
      }

         FormData formData = FormData.fromMap(data);
        // var formData = FormData.fromMap(data);
        if (files.isNotEmpty) {
          files.forEach((fieldName, filePath) {
            formData.files.add(MapEntry(
              fieldName,
              MultipartFile.fromFileSync(filePath),
            ));
          });
        }

        final response = await _dio.post(apiName, data: formData,
        options: Options(
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      }
    ));
          
        var res = response.data;
        print('Status Code: ${response.statusCode}');
        print('Response Body $apiName:\n $res');

        if (response.statusCode == 200) {
          return res; // Change this according to the structure of your error response
        } else {
          // Handle other status codes here
          // showToastError(e.response!.data['message'].toString());
          return res as Map<String, dynamic>;
        }
      } on DioError catch (e) {
        if (e.response != null) {
         print('Dio error: ${e.response!.statusCode}');              
          if (e.response!.statusCode == 422) {
            log("422 case");
            log(e.response!.statusMessage.toString());
            showToastError(e.response!.data['message'].toString());
            return null;
          } 
          else if(e.response!.statusCode == 401){
              token = "";
              globalToken = "";       
              Get.Get.offAllNamed(AppRoutes.loginScreen);
             return null;
      }else if (e.response!.statusCode == 400) {
            log("400 case");
            log(e.response!.statusMessage.toString());
            showToastError(e.response!.data['message'].toString());
            return null;
          } else {
            log("other case");
            log(e.response!.statusMessage.toString());
            showToastError(e.response.toString());
            return null;
          }
        } else {
          print('Dio request failed: ${e.message}');
          return e.response as Map<String, dynamic>;
        }
      }
    }
}




// import 'dart:io';
// import 'package:evolve/routers/app_routers.dart';

// import 'utils.dart';
// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class ApiUrls{
//   static const String domain = "https://bid.sa/";
//   static const String baseUrl = "${domain}api/";

//                         /*         <-- Api BaseUrl with endPoints -->         */

// }

// // api call methods

// Future<http.Response> performGetRequest(String url) async {
//   final headers = {
//     HttpHeaders.contentTypeHeader: 'application/json',
//     HttpHeaders.acceptHeader: 'application/json',
//     HttpHeaders.authorizationHeader: 'Bearer abc'
//   };
//   return await http.get(
//     Uri.parse(url),
//     headers: headers,
//   );
// }

// Future<http.Response> performPostRequest(String url, Map<String, dynamic> map) async {
//   final headers = {
//     HttpHeaders.contentTypeHeader: 'application/json',
//     HttpHeaders.acceptHeader: 'application/json',
//     HttpHeaders.authorizationHeader: 'Bearer abc'
//   };
//   return await http.post(
//     Uri.parse(url),
//     body: jsonEncode(map),
//     headers: headers,
//   );
// }

// void handleErrorCases(http.Response response, dynamic data, String apiName) {
//   if (response.statusCode == 422) {
//     // showToastError(data['Message']);
//   }
//   else if (response.statusCode == 400 || data['message'] == "Unauthenticated.") {
//     print('coming in 400 or Unauthenticated in ${apiName}');
//     clearLocalStorage();
//     Get.offAllNamed(AppRoutes.loginScreen);
//   }
//   // else {
//   //   log('Yahaa aaya ApisUrl me');
//   //   showToastError(data['message']);
//   //   showLoader(false);
//   //   throw Exception(response.body);
//   // }
// }

