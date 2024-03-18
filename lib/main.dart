import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'Resources/dependencies.dart' as de;
import 'resources/app_color.dart';
import 'routers/app_routers.dart';



String fcmToken = "";
String globalToken = "";

Future<void> main() async{
  await de.init();
  await GetStorage.init();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light
        ));
    return ScreenUtilInit(
      // designSize: const Size(375, 812),
      designSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
      child: GestureDetector(
        onTap: ()
        {if (FocusManager.instance.primaryFocus!.hasFocus) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
        },
        child: GetMaterialApp(
          title: 'evolve',
          locale: Get.deviceLocale,
          // translationsKeys: AppTranslation.translationsKeys,
          theme: ThemeData(
            primarySwatch: primaryColorShades,
            appBarTheme: AppBarTheme(color: AppColors.whiteColor),
            
            fontFamily: 'nourd',
          ),
          debugShowCheckedModeBanner: false,  
          // initialRoute: AppRoutes.bottomNav,
          initialRoute: AppRoutes.splashScreen,
          getPages: AppRoutes.getRoute,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), // Set the desired text scaling factor here
              child: child!,
            );
          },
          defaultTransition: Transition.noTransition,
          // transitionDuration: const Duration(milliseconds: 350),
        ),
      ),
    );
  }
}