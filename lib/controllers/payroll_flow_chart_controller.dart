import 'package:evolve/routers/app_routers.dart';
import 'package:get/get.dart';

class PayRollFlowChartController extends GetxController {
  // final controller =  Get.find<languageController>();

  List<Map<String, dynamic>> payRollFlowList = [
    {'title': 'Introduction', 'subTitle': '4 pages', 'isImage': true,'isButton': false,'isFav': false},
    {'title': 'Methodology', 'subTitle': '4 pages', 'isImage': true,'isButton': false,'isFav': true},
    {'title': 'Improvement', 'subTitle': '4 pages', 'isImage': false,'isButton': true, 'isFav': false},
    {'title': 'Quality of Hire, Time to...', 'subTitle': '4 pages', 'isImage': false,'isButton': true, 'isFav': false},
    {'title': 'HR and IT department co...', 'subTitle': '4 pages', 'isImage': false,'isButton': true,'isFav': false},
    {'title': 'Quality of Hire, Time to...', 'subTitle': '4 pages', 'isImage': false,'isButton': true,'isFav': false},
  ];

  @override
  void onInit() {
    super.onInit();

    // Future.delayed(Duration(seconds: 2), () {
    //
    //     Get.offAllNamed(AppRoutes.onboardingScreen);
    // });
  }
}