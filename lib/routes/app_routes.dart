import 'package:get/get.dart';

import '../features/explore/screens/explore.dart';
import '../features/navigation/screens/navigation_menu.dart';
import '../features/profile/screens/manage_address.dart';
import '../features/profile/screens/your_profile.dart';
import 'routes.dart';

class AppRouters {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const NavigationMenu()),
    GetPage(name: TRoutes.explore, page: () => const ExploreScreen()),
    GetPage(name: TRoutes.yourProfile, page: () => const YourProfileScreen()),
    GetPage(
        name: TRoutes.manageAddress, page: () => const ManageAddressScreen()),
  ];

  static final unknownRoute =
      GetPage(name: TRoutes.notfound, page: () => const NavigationMenu());
}
