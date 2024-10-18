import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/onboarding/screens/onboarding.dart';
import 'routes/app_routes.dart';
import 'utils/utils.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      getPages: AppRouters.pages,
      home: const OnBoardingScreen(),
      debugShowCheckedModeBanner: false,
      /* home: const Scaffold(
        backgroundColor: TColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ), */
    );
  }
}
