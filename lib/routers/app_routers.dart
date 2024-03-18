import 'package:evolve/Screens/choose_category_screen.dart';
import 'package:evolve/Screens/detail_screen.dart';
import 'package:evolve/Screens/helpdesk.dart';
import 'package:evolve/Screens/other/available_subscrition.dart';
import 'package:evolve/Screens/other/card_form.dart';
import 'package:evolve/Screens/payment_success.dart';
import 'package:evolve/Screens/payroll_flow_chart.dart';
import 'package:evolve/Screens/plan_details_screen.dart';
import 'package:evolve/Screens/recruiting.dart';
import 'package:evolve/Screens/sign_up/login.dart';
import 'package:evolve/Screens/sign_up/sign_up.dart';
import 'package:evolve/Screens/splash_screen.dart';
import 'package:evolve/Screens/subscription_screen.dart';
import 'package:evolve/Screens/your_items_screen.dart';
import 'package:evolve/common-widgets/custom_bottom_navigation.dart';
import 'package:get/get.dart';

import '../Screens/other/my_subscriptions.dart';

class AppRoutes {

  static String splashScreen = '/splashScreen';
  static String loginScreen = '/loginScreen';
  static String signUpScreen = '/signUpScreen';
  static String payrollFlowChartScreen = '/payrollFlowChartScreen';
  static String bottomNav = '/bottomNavScreen';
  static String mySubscription ='/mySubscription';
  static String availableSubscription ='/avaiableSubscription';
  static String cardFormScreen ='/CardFormScreen';
  static String yourItemsScreen = '/yourItemsScreen';
  static String subscriptionScreen = '/subscriptionScreen';
  static String chooseCategoryScreen = '/chooseCategoryScreen';
  static String recruitingScreen = '/recruitingScreen';
  
  static String paymentSuccessScreen = '/paymentSuccessScreen';
  static String helpDeskScreen = '/helpDeskScreen';
  static String detailScreen = '/DetailScreen';
  static String planDetailsScreen = '/PlanDetailsScreen';

  


  static final getRoute = [

    // Splash
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashScreen(),
    ),
    // Login
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => Login(),
    ),
    // SignUp
    GetPage(
      name: AppRoutes.signUpScreen,
      page: () => SignUp(),
    ),
    // payrollFlowChartScreen
    GetPage(
      name: AppRoutes.payrollFlowChartScreen,
      page: () => PayrollFlowChart(),
    ),

    GetPage(
    name: AppRoutes.bottomNav, 
    page: () => CustomBottomNav(),
    ),
    GetPage(
    name: AppRoutes.mySubscription, 
    page: () => MySubscription(),
    ),
    GetPage(
    name: AppRoutes.availableSubscription, 
    page: () => AvailableSubscription(),
    ),
     GetPage(
    name: AppRoutes.cardFormScreen, 
    page: () => CardFormScreen(),
    ),

    // RecruitingScreen
    GetPage(
      name: AppRoutes.recruitingScreen,
      page: () => RecruitingScreen(),
    ),
    // RecruitingScreen
    GetPage(
      name: AppRoutes.paymentSuccessScreen,
      page: () => PaymentSuccess(),
    ),GetPage(
      name: AppRoutes.chooseCategoryScreen,
      page: () => ChooseCategory(),
    ),
    GetPage(
      name: AppRoutes.yourItemsScreen,
      page: () => YourItems(),
    ),
    GetPage(
      name: AppRoutes.subscriptionScreen,
      page: () => SubscriptionScreen(),
    ),
    GetPage(
      name: AppRoutes.helpDeskScreen,
      page: () => HelpDeskScreen(),
    ),
    GetPage(
      name: AppRoutes.detailScreen,
      page: () => DetailScreen(),
    ),
      GetPage(
      name: AppRoutes.planDetailsScreen,
      page: () => PlanDetailsScreen(),
    ),
    



    

  ];
}
