import 'package:get/get.dart';

import '../features/explore/screens/explore.dart';
import '../features/home/screens/home.dart';
import 'routes.dart';

class AppRouters {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.explore, page: () => const ExploreScreen()),
  ];
}
