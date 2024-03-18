import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_color.dart';

SizedBox addHeight(double height) {
  return SizedBox(
    height: height.h,
  );
}

SizedBox addWidth(double width) {
  return SizedBox(
    width: width.w,
  );
}


// only text
// Text addTxt(String text,{int? maxLines, TextAlign? textAlign, double? fontSize}){
//   return Text(text,
//     maxLines: maxLines, textAlign: textAlign,
//     style: TextStyle(fontSize: fontSize?.sp??12.sp),);
// }

// // for w300
// Text addLightTxt(String text,{int? maxLines, TextAlign? textAlign, double? fontSize, Color? color}){
//   return Text(text,
//     maxLines: maxLines, textAlign: textAlign,
//     style: TextStyle(
//       color: color ?? AppColors.blackColor,
//       fontSize: fontSize?.sp??12.sp,fontWeight: FontWeight.w300),);
// }

// // for w400
// Text addRegularTxt(String text,{TextOverflow? overflow,int? maxLines, TextAlign? textAlign,double? fontSize,Color? color,double? height} ){
//   return Text(text,
//       maxLines: maxLines, textAlign: textAlign,overflow: overflow,
//       style: TextStyle(
//           overflow: overflow,
//           height: height,
//           fontSize: fontSize?.sp??16.sp,fontWeight: FontWeight.w400,color: color));
// }

// // for bold, w500 || w600 || w700 || w900,
// Text addBoldTxt(
//     String text,{int? maxLines, TextAlign? textAlign, double? fontSize,
//       FontWeight? fontWeight,Color? color,TextOverflow? overflow,TextDecoration? decoration}){
//   return Text(text,
//       maxLines: maxLines, textAlign: textAlign,overflow: overflow,
//       style: TextStyle(overflow: overflow,fontSize: fontSize?.sp??12.sp,fontWeight: fontWeight??FontWeight.bold,color: color,decoration: decoration));
// }

// // add text
// Text addHeadingTxt(
//     String text,{int? maxLines, TextAlign? textAlign, double? fontSize, FontWeight? fontWeight,double? height,Color? color,TextOverflow? overflow}){
//   return Text(text,
//       maxLines: maxLines, textAlign: textAlign,

//       style: TextStyle(height: height,
//           overflow: overflow,
//           fontSize: fontSize?.sp??24.sp,fontWeight: fontWeight??FontWeight.w700, color: color??AppColors.blackColor));
// }
Text addTxt(String text,{int? maxLines, TextAlign? textAlign, double? fontSize}){
  return Text(text,
    maxLines: maxLines, textAlign: textAlign,
    style: TextStyle(fontSize: fontSize?.sp??12.sp),);
}

// for w300
Text addLightTxt(String text,{int? maxLines, TextAlign? textAlign, double? fontSize, Color? color}){
  return Text(text,
    maxLines: maxLines, textAlign: textAlign,
    
    style: TextStyle(fontSize: fontSize?.sp??12.sp,fontWeight: FontWeight.w300,
     color: color ?? AppColors.blackColor,),);
}

// for w400
Text addRegularTxt(String text,{TextOverflow? overflow,int? maxLines, TextAlign? textAlign,double? fontSize,Color? color,double? height, double? letterSpacing} ){
  return Text(text,
      maxLines: maxLines, textAlign: textAlign,overflow: overflow,
      style: TextStyle(
          overflow: overflow,
          height: height,
          letterSpacing: letterSpacing ?? 0.0,
          
          fontSize: fontSize?.sp??16.sp,fontWeight: FontWeight.w400,color: color));
}

// for bold, w500 || w600 || w700 || w900,
Text addBoldTxt(
    String text,{int? maxLines, TextAlign? textAlign, double? fontSize,
      FontWeight? fontWeight,Color? color,TextOverflow? overflow,TextDecoration? decoration,double? height}){
  return Text(text,
      maxLines: maxLines, textAlign: textAlign,overflow: overflow,
      style: TextStyle(height: height,overflow: overflow,fontSize: fontSize?.sp??12.sp,fontWeight: fontWeight??FontWeight.bold,color: color,decoration: decoration));
}

// add text
Text addHeadingTxt(
    String text,{int? maxLines, TextAlign? textAlign, double? fontSize, FontWeight? fontWeight,double? height,Color? color,TextOverflow? overflow}){
  return Text(text,
      maxLines: maxLines, textAlign: textAlign,

      style: TextStyle(height: height,
          overflow: overflow,
          fontSize: fontSize?.sp??24.sp,fontWeight: fontWeight??FontWeight.w700, color: color??AppColors.blackColor));
}


Text addHeadingTxtMedium(
    String text,{int? maxLines, TextAlign? textAlign, double? fontSize, FontWeight? fontWeight,double? height,Color? color,TextOverflow? overflow, String? fontFamily }){
  return Text(text,
      maxLines: maxLines, textAlign: textAlign,
      style: TextStyle(height: height,
          overflow: overflow,
          fontFamily: fontFamily ?? 'nourd_medium',
          fontSize: fontSize?.sp??24.sp,fontWeight: fontWeight??FontWeight.w700, color: color??AppColors.blackColor));
}


// multi text like a row
RichText richText( String? text1,text2,
    { double? fontSize1,fontSize2, FontWeight? fontWeight1,fontWeight2, Color? textColor1,textColor2, GestureRecognizer? onTapText2})
{
  return RichText(
    text:  TextSpan(
      text: text1,
      style: TextStyle(
          fontSize: fontSize1??14.sp,
          // color: textColor1??AppColors.blackColor,
          // fontFamily: 'Ubuntu'
      ),
      children: [
        TextSpan(
          text: text2,
          recognizer: onTapText2,
          style: TextStyle(
            fontSize: fontSize2??14.sp,
            fontWeight: fontWeight2??FontWeight.bold,
            // color: textColor2??AppColors.buttonColor,
          ),
        ),

      ],
    ),
  );
}