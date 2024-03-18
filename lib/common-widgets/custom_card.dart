import 'package:evolve/resources/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:evolve/resources/text_utility.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/app_assets.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String des;
  final String img;
  final VoidCallback onTap;
  const CustomCard({
    Key? key,
    required this.title,
    required this.des,
    required this.img,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        
        decoration: BoxDecoration(
          // color: AppColors.blackColor1,
          borderRadius: BorderRadiusDirectional.circular(20.sp),
          
          image: DecorationImage(          
            image: AssetImage(img),           
            fit: BoxFit.fitHeight),
        ),
         
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(20.sp),
             gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black38,
                  // Colors.black38,
                  Colors.black87,
                  Colors.black87,
                ],
              )
            
            // color: Colors.black38
          ),
          
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.end,
           mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
              children: [
                Spacer(),
              SvgPicture.asset(AppAssets.playButtonIcon, height: 40.sp,), 
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addBoldTxt(title, color: AppColors.whiteColor, fontSize: 15.sp),
                  addRegularTxt(des, color: AppColors.whiteColor, fontSize: 12.sp)
                ],
              ),
               Spacer(),
            ]),
            addHeight(10.sp)
            ],
          ),
        ),
      ),
    );
  }
}
