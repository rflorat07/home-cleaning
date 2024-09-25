import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_cleaning/features/authentication/screens/login/login.dart';
import 'package:home_cleaning/utils/utils.dart';

import 'routes/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      getPages: AppRouters.pages,
      home: const LoginScreen(),
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
