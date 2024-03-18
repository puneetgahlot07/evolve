import 'package:evolve/resources/app_color.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:evolve/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DiscoverController extends GetxController {
  // final controller =  Get.find<languageController>();

  @override
  void onInit() {
    super.onInit();  
    setCarouselData(); 
  }
  List<Map<String, String>> carouselItemListData = [
    {
      'title': 'Upgrade to Premium',
      'des': 'Become a VIP Member to get more Features & Unlimited Workstream Items!',
      'image': 'assets/images/cousal_img1.png',
    },
     {
      'title': 'Upgrade to Premium',
      'des': 'Become a VIP Member to get more Features & Unlimited Workstream Items!',
      'image': 'assets/images/cousal_img1.png',
    },
    {
      'title': 'Upgrade to Premium',
      'des': 'Become a VIP Member to get more Features & Unlimited Workstream Items!',
      'image': 'assets/images/cousal_img1.png',
    },
  ];
  List<Widget> carouselItemList = [];
  int  carouselSelectIndex = 0;


  setCarouselData(){

  carouselItemList =  List.generate(carouselItemListData.length, (index) =>  Container(
          decoration: BoxDecoration(
           color: AppColors.primaryColor,
           borderRadius: BorderRadius.circular(20.sp)
          ) ,  
          child: 
            Padding(
              padding:  EdgeInsets.symmetric(
                vertical: 6.sp,
                horizontal: 10.sp
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      addBoldTxt(carouselItemListData[index]['title']!, color: AppColors.whiteColor, fontSize: 16.sp),
                      addHeight(5.h),
                      addRegularTxt(carouselItemListData[index]['des']!, maxLines: 2,fontSize: 12.sp , color: AppColors.whiteColor, overflow: TextOverflow.ellipsis)
                    ],)
                  ), 
                  Expanded(
                    flex: 2,
                    child: Image.asset(carouselItemListData[index]['image']!))
                ],
              ),
            ) ,        
        ),);
        update();
  }
  

  List<Map<String, String>> popularItemData = [
    {
      'title': 'Be Yourself',
      'des': 'Claudia Alves',
      'image': 'assets/images/grid1.png',
    },
     {
      'title': 'Today, I Will',
      'des': 'Alfredo Torres',
      'image': 'assets/images/grid2.png',
    },
     {
      'title': 'Amazing',
      'des': 'Jack Boston',
      'image': 'assets/images/grid3.png',
    },
     {
      'title': 'Wonderful',
      'des': 'Avery Davis',
      'image': 'assets/images/grid4.png',
    },
  ];

    List<Map<String, String>> categoryItemData = [
    {
      'title': 'Learning',      
      'image': 'assets/images/cat1.svg',
    },
     {
      'title': 'Recruiting',     
      'image': 'assets/images/cat2.svg',
    },
     {
      'title': 'HCM',    
      'image': 'assets/images/cat3.svg',
    },
     {
      'title': 'Talent',
      'image': 'assets/images/cat4.svg',
    },
    {
      'title': 'Payroll',      
      'image': 'assets/images/cat4.svg',
    },
     {
      'title': 'Performance',     
      'image': 'assets/images/cat6.svg',
    },
     {
      'title': 'Finance',    
      'image': 'assets/images/cat4.svg',
    },  
    {
      'title': 'Learning',      
      'image': 'assets/images/cat1.svg',
    },
     {
      'title': 'Recruiting',     
      'image': 'assets/images/cat2.svg',
    },
     {
      'title': 'HCM',    
      'image': 'assets/images/cat3.svg',
    },
     {
      'title': 'Talent',
      'image': 'assets/images/cat4.svg',
    },
    {
      'title': 'Payroll',      
      'image': 'assets/images/cat4.svg',
    },
     {
      'title': 'Performance',     
      'image': 'assets/images/cat6.svg',
    },
     {
      'title': 'Finance',    
      'image': 'assets/images/cat4.svg',
    },  
    {
      'title': 'Learning',      
      'image': 'assets/images/cat1.svg',
    },
     {
      'title': 'Recruiting',     
      'image': 'assets/images/cat2.svg',
    },
     {
      'title': 'HCM',    
      'image': 'assets/images/cat3.svg',
    },
     {
      'title': 'Talent',
      'image': 'assets/images/cat4.svg',
    },
    {
      'title': 'Payroll',      
      'image': 'assets/images/cat4.svg',
    },
     {
      'title': 'Performance',     
      'image': 'assets/images/cat6.svg',
    },
     {
      'title': 'Finance',    
      'image': 'assets/images/cat4.svg',
    },  
    {
      'title': 'Learning',      
      'image': 'assets/images/cat1.svg',
    },
     {
      'title': 'Recruiting',     
      'image': 'assets/images/cat2.svg',
    },
     {
      'title': 'HCM',    
      'image': 'assets/images/cat3.svg',
    },
     {
      'title': 'Talent',
      'image': 'assets/images/cat4.svg',
    },
    {
      'title': 'Payroll',      
      'image': 'assets/images/cat4.svg',
    },
     {
      'title': 'Performance',     
      'image': 'assets/images/cat6.svg',
    },
     {
      'title': 'Finance',    
      'image': 'assets/images/cat4.svg',
    },    
  ];

   List<Map<String, String>> mySubscription = [
    {
      'title': 'Methodology',
      'des': '4 pages',
      'image': 'assets/images/mysub1.png',
    },
     {
      'title': 'Improvement',
      'des': '9 pages',
      'image': 'assets/images/mysub2.png',
    },];
  
    var subscriptionPlan = [
      {
        'title': 'Learning Basic',
        'data': [
          'Process Flow', 'Tips And Tricks', 'Ask 2 Help Desk Questions'
        ],
         'des': "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
        'price' : '\$99/Mouth'
      },
       {
        'title': 'Learning Premium',
        'data': [
          'Process Flow', 
          'Trainings',
          'Tips And Tricks', 
          'Ask 5 Help Desk Questions'
        ],
        'des': "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
        'price' : '\$199/Mouth'
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
         'des': "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
         'price' : '\$299/Mouth'
      }

    ]; 

    var planSeletedIndex;



}
