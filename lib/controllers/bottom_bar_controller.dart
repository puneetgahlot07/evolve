import 'dart:developer';
import 'package:evolve/Screens/home/cart.dart';
import 'package:evolve/Screens/home/discover.dart';

import 'package:evolve/Screens/home/profile.dart';
import 'package:evolve/Screens/home/subscription_onwer.dart';
import 'package:evolve/Screens/your_items_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarController extends GetxController {
//  final GlobalKey<ScaffoldState> key = GlobalKey();
// for app drawer
  int selectedIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    // const  Discover(),
    const SubScriptionOwnership(),
    const Cart(),
    const YourItems(),
    const Profile(),
  ];

  void onItemTapped(int index) {
    // if(index == 4){
    //   key.currentState!.openEndDrawer();
    // }
    // else{
    selectedIndex = index;
    update();
    // }
  }

  setValue(int i) {
    selectedIndex = i;
    update();
  }

// @override
// void onInit() {
//   // TODO: implement onInit
//   super.onInit();
//   log('In bottombar controller');
//   log('In bottombar controllerEnd');
// }
}
