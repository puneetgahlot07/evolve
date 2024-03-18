
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'app_color.dart';
import 'local_storage.dart';
import 'dart:developer';
import 'dart:convert';

// String selectedLanguage = 'en';

// toast
showToast(String msg){
 return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

showToastError(String msg){
 return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}


// Local Storage Getx methods
storeValue(String key, String value) {
  GetStorage localStorage = GetStorage();
  localStorage.write(key, value);
}

String getValue(String key) {
  GetStorage localStorage = GetStorage();
  var value = localStorage.read(key);
  return value ?? '';
}

storeBoolValue(String key, value){
  GetStorage localStorage = GetStorage();
  localStorage.write(key, value);
}

bool getBoolValue(String key){
  GetStorage localStorage = GetStorage();
  var value = localStorage.read(key);
  log('getBoolValue (Key-${key} and value-${value})');
  return value ?? false;
}

clearLocalStorage(){
  GetStorage localStorage = GetStorage();
  localStorage.erase();
}

CircularProgressIndicator customCircularProgress(){
  return CircularProgressIndicator(color: Colors.pinkAccent,);
}

// network image custom
CustomImageNetwork(String imageUrl, {double? height, width, BoxFit? fit}){
  return Image.network(
    imageUrl,
    fit: fit??BoxFit.fill,
    height: height??kMinInteractiveDimension,
    width: width??kMinInteractiveDimension,
    loadingBuilder: (BuildContext context, Widget child,
        ImageChunkEvent? loadingProgress) {
      if (loadingProgress == null) return child;
      return Center(
        // child: Container(
        //   height: height??kMinInteractiveDimension,
        //   width: width??kMinInteractiveDimension,
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage(AppAssets.placeHolderImg),
        //
        //       fit: BoxFit.cover, // Adjust as per your requirement
        //     ),
        //   ),
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!
                : null,

          ),);
        // ),
      // );
    },


  );
}


Future<bool> checkInternetConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  // log("######################################");
  // print('Connectivity Result: $connectivityResult');
  // log("######################################");
  if (connectivityResult == ConnectivityResult.none) {
    return false; // No internet connection
  }
  return true; // Internet connection available
}




