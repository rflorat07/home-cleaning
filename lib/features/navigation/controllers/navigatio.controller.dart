import 'package:get/get.dart';

import '../../bookmark/screens/bookmark.dart';
import '../../explore/screens/explore.dart';
import '../../home/screens/home.dart';
import '../../profile/screens/profile.dart';

class NavigatioController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const BookmarkScreen(),
    /* const ChatScreen(), */
    const ProfileScreen()
  ];
}
