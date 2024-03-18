
import 'package:evolve/resources/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

  showLoaderDialog(BuildContext context, bool show) {
  if (show) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: Container(
          width: 70.0,
          height: 70.0,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: CupertinoActivityIndicator(),
          ),
        ),
      ),
    );
  } else {
    Navigator.of(context).pop();
  }
}

// Loader using getx
  showLoader(bool show) {
  if (show) {
    Get.dialog(
        barrierDismissible: false,
        WillPopScope(
          onWillPop: () async {
            // Return false to prevent the dialog from closing on back button press
            return false;
          },
          child: Center(
      child: Container(
          width: 70.0,
          height: 70.0,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child:  Padding(
            padding: EdgeInsets.all(12.0),
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          ),
      ),
    ),
        ));
  } else {
    Get.back();
  }
}

//

