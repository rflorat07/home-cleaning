import 'package:get/get.dart';
import 'package:home_cleaning/features/bookmark/screens/bookmark.dart';
import 'package:home_cleaning/features/chat/screens/chat.dart';
import 'package:home_cleaning/features/explore/screens/explore.dart';
import 'package:home_cleaning/features/home/screens/home.dart';
import 'package:home_cleaning/features/profile/screens/profile.dart';

class NavigatioController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const BookmarkScreen(),
    const ChatScreen(),
    const ProfileScreen()
  ];
}
