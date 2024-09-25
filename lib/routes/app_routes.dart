import 'package:get/get.dart';
import 'package:home_cleaning/features/authentication/screens/login/login.dart';
import 'package:home_cleaning/routes/routes.dart';

class AppRouters {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const LoginScreen()),
  ];
}
