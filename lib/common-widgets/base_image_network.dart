import 'dart:io';

import 'package:flutter/material.dart';
import '../resources/api_constant.dart';
import '../resources/app_color.dart';
import 'full_file_url.dart';

String baseUrl = ApiUrls.baseUrl;

class BaseImageNetwork extends StatelessWidget {
  final String? link;
  final bool? concatBaseUrl, isNetworkImage , isAssetImage, boxDecoration;
  final double? borderRadius;
  final BoxFit? fit;
  final Widget? errorWidget;
  final double? topMargin, bottomMargin, rightMargin, leftMargin, height, width;

  const BaseImageNetwork({
    Key? key,
    this.link,
    this.topMargin,
    this.bottomMargin,
    this.rightMargin,
    this.leftMargin,
    this.height,
    this.width,
    this.concatBaseUrl,
    this.isNetworkImage = true,
    this.isAssetImage = false,
    this.boxDecoration = false,
    this.borderRadius,
    this.fit,
    this.errorWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // log('Image Url----- > ${generateFullFileUrl(link)}  ... $link');
    if(!isNetworkImage!){
      return Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor,
            // gradient: LinearGradient(
            //     begin: Alignment.bottomLeft,
            //     end: Alignment.bottomRight,
            //     // colors: [AppColors.gredientBg1Color, AppColors.gredientBg2Color]
            // )
        ),
        padding: EdgeInsets.only(
            top: topMargin ?? 0,
            right: rightMargin ?? 0,
            bottom: bottomMargin ?? 0,
            left: leftMargin ?? 0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          child: Image.file(
            File(link??''),
            width: width,
            height: height,
            fit: fit ?? BoxFit.fitHeight,
            errorBuilder: (context, url, error) {
              if (errorWidget == null) {
                return Icon(Icons.image, size: width);
              } else {
                return errorWidget ?? const SizedBox();
              }
            },
            // loadingBuilder: (BuildContext context, Widget child,
            //     ImageChunkEvent? loadingProgress) {
            //   if (loadingProgress == null) return child;
            //   return Center(
            //     child: CircularProgressIndicator(
            //       value: loadingProgress.expectedTotalBytes != null
            //           ? loadingProgress.cumulativeBytesLoaded /
            //           loadingProgress.expectedTotalBytes!
            //           : null,
            //     ),
            //   );
            // },
          ),
        ),
      );
    }
    if(isAssetImage!){
      return Container(
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor,
            // gradient: LinearGradient(
            //     begin: Alignment.bottomLeft,
            //     end: Alignment.bottomRight,
            //     colors: [AppColors.gredientBg1Color, AppColors.gredientBg2Color])
        ),
        padding: EdgeInsets.only(
            top: topMargin ?? 0,
            right: rightMargin ?? 0,
            bottom: bottomMargin ?? 0,
            left: leftMargin ?? 0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          child: Image.asset(
            link!,
            width: width,
            height: height,
            fit: fit ?? BoxFit.fitHeight,
            errorBuilder: (context, url, error) {
              if (errorWidget == null) {
                return Icon(Icons.image, size: width);
              } else {
                return errorWidget ?? const SizedBox();
              }
            },
            // loadingBuilder: (BuildContext context, Widget child,
            //     ImageChunkEvent? loadingProgress) {
            //   if (loadingProgress == null) return child;
            //   return Center(
            //     child: CircularProgressIndicator(
            //       value: loadingProgress.expectedTotalBytes != null
            //           ? loadingProgress.cumulativeBytesLoaded /
            //           loadingProgress.expectedTotalBytes!
            //           : null,
            //     ),
            //   );
            // },
          ),
        ),
      );
    }
    return Container(
      width: width,
      height: height,
      decoration: boxDecoration! ?const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primaryColor,
          // gradient: LinearGradient(
          //     begin: Alignment.bottomLeft,
          //     end: Alignment.bottomRight,
          //     colors: [AppColors.gredientBg1Color, AppColors.gredientBg2Color])
      ) : const BoxDecoration(),
      padding: EdgeInsets.only(
          top: topMargin ?? 0,
          right: rightMargin ?? 0,
          bottom: bottomMargin ?? 0,
          left: leftMargin ?? 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        child: Image.network(
          ((link ?? "").contains("http") || (link ?? "").contains("https"))
              ? (link ?? "")
              : generateFullFileUrl(link),// baseUrl + (link ?? ""),
          width: width,
          height: height,
          fit: fit ?? BoxFit.fitHeight,
          errorBuilder: (context, url, error) {
            if (errorWidget == null) {
              return Icon(Icons.image, size: width);
            } else {
              return errorWidget ?? const SizedBox();
            }
          },
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return SizedBox(
              width: width,
              height: height,
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
