import 'package:get/get.dart';

import '../features/explore/screens/explore.dart';
import '../features/navigation/screens/navigation_menu.dart';
import '../features/profile/screens/help_center/screens/help_center.dart';
import '../features/profile/screens/invite_friends.dart';
import '../features/profile/screens/manage_address.dart';
import '../features/profile/screens/my_bookings.dart';
import '../features/profile/screens/payment_methods/screens/payment_methods.dart';
import '../features/profile/screens/privacy_policy.dart';
import '../features/profile/screens/your_profile.dart';
import 'routes.dart';

class AppRouters {
  AppRouters._();

  static final pages = [
    GetPage(name: TRoutes.home, page: () => const NavigationMenu()),
    GetPage(name: TRoutes.explore, page: () => const ExploreScreen()),
    GetPage(name: TRoutes.yourProfile, page: () => const YourProfileScreen()),
    GetPage(
        name: TRoutes.manageAddress, page: () => const ManageAddressScreen()),
    GetPage(name: TRoutes.myBookings, page: () => const MyBookingsScreen()),
    GetPage(
        name: TRoutes.privacyPolicy, page: () => const PrivacyPolicyScreen()),
    GetPage(
        name: TRoutes.inviteFriends, page: () => const InviteFriendsScreen()),
    GetPage(name: TRoutes.helpCenter, page: () => const HelpCenterScreen()),
    GetPage(
        name: TRoutes.paymentMethods, page: () => const PaymentMethodsScreen()),
  ];

  static final unknownRoute =
      GetPage(name: TRoutes.notfound, page: () => const NavigationMenu());
}
