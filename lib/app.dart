import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopeasy_getx/bindings/general_bindings.dart';
import 'package:shopeasy_getx/features/authentication/screens/onboarding/onboarding.dart';
import 'package:shopeasy_getx/utils/constants/colors.dart';

import 'utils/constants/text_strings.dart';
import 'utils/device/web_material_scroll.dart';
import 'utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      initialBinding: GeneralBindings(),
      //home: OnBoardingScreen(),

      /// Show Loader or Circular Progress indicator meanwhile Authentication Repository is deciding to show relevant screen
      home: Scaffold(
        backgroundColor: TColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
