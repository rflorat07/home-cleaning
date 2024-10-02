import 'package:get/get.dart';
import 'package:home_cleaning/features/explore/screens/explore.dart';
import 'package:home_cleaning/features/home/screens/home.dart';
import 'package:home_cleaning/routes/routes.dart';

class AppRouters {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.explore, page: () => const ExploreScreen()),
  ];
}
