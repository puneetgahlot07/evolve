
import 'package:evolve/controllers/bottom_bar_controller.dart';
import 'package:evolve/controllers/discover_controller.dart';
import 'package:evolve/controllers/profile_controller.dart';
import 'package:evolve/controllers/recruiting_controller.dart';
import 'package:evolve/controllers/splash_controller.dart';
import 'package:evolve/controllers/your_items_controller.dart';
import 'package:get/get.dart';

import '../controllers/cart_conntroller.dart';
import '../controllers/choose_category_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/payroll_flow_chart_controller.dart';
import '../controllers/signUp_controller.dart';

Future<void> init() async{

    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
  Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
  Get.lazyPut<SignUpController>(() => SignUpController(), fenix: true);
  Get.lazyPut<PayRollFlowChartController>(() => PayRollFlowChartController(), fenix: true);
  // Get.lazyPut<BottomBarController>(() => BottomBarController(), fenix: true);
  Get.put(BottomBarController());
  Get.put(YourItemsController());
  Get.put(RecruitingController());
  Get.put(ProfileController());
  Get.lazyPut<DiscoverController>(() => DiscoverController(), fenix: true);
  Get.lazyPut<CartController>(() => CartController(), fenix: true);
  // Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);

  Get.lazyPut<ChooseCategoryController>(() => ChooseCategoryController(), fenix: true);
  // Get.lazyPut<RecruitingController>(() => RecruitingController(), fenix: true);
  // Get.lazyPut<YourItemsController>(() => YourItemsController(), fenix: true);
  
}
