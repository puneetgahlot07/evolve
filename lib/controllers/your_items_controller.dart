import 'package:evolve/resources/app_assets.dart';
import 'package:evolve/resources/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YourItemsController extends GetxController with GetSingleTickerProviderStateMixin {
final List<Tab> myTabs = <Tab>[
  Tab(text: 'Favorites'),
  Tab(text: 'Purchased'),
];

late TabController controller;

int selectedTabIndex = 0;

@override
void onInit() {
  super.onInit();
  controller = TabController(vsync: this, length: myTabs.length);
}

@override
void onClose() {
  controller.dispose();
  super.onClose();
}

final List<FavList> itemsFav = [
  FavList(
    image: AppAssets.avatarIcon1,
    title: "Introduction",
    subTitle: "Description of Item Introduction",
    color: AppColors.orangeColor,
    isFav: true,
  ),
  FavList(
    image: AppAssets.avatarIcon2,
    title: "Mythology",
    subTitle: "Description of Mythology",
    color: AppColors.lightGreenColor,
    isFav: false,
  ),
  FavList(
    image: AppAssets.avatarIcon3,
    title: "Improvement",
    subTitle: "4 pages",
    color: AppColors.blueColor,
    isFav: true,
  ),
  FavList(
    image: AppAssets.avatarIcon4,
    title: "Quality of Hire, Time to...",
    subTitle: "4 pages",
    color: AppColors.brownColor,
    isFav: true,
  ),
];

final List<FavList> itemsFav2 = [
  FavList(
    image: AppAssets.avatarIcon1,
    title: "Introduction",
    subTitle: "4 pages",
    color: AppColors.orangeColor,
    isFav: true,
  ),
  FavList(
    image: AppAssets.avatarIcon2,
    title: "Mythology",
    subTitle:"4 pages",
    color: AppColors.lightGreenColor,
    isFav: false,
  ),
  FavList(
    image: AppAssets.avatarIcon3,
    title: "Improvement",
    subTitle: "4 pages",
    color: AppColors.blueColor,
    isFav: true,
  ),
  FavList(
    image: AppAssets.avatarIcon4,
    title: "Quality of Hire, Time to...",
    subTitle: "4 pages",
    color: AppColors.brownColor,
    isFav: true,
  ),
];

}


class FavList {
  String? image, title, subTitle;
  Color?color;
  bool? isFav;
  FavList({this.image, this.title, this.subTitle, this.color, this.isFav});
}



