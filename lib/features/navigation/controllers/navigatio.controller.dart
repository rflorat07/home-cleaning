import 'package:get/get.dart';
import 'package:home_cleaning/features/explore/screens/explore.dart';
import 'package:home_cleaning/features/home/screens/home.dart';

class NavigatioController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const ExploreScreen(),
    /* const BookmarkScreen(),
    const ChatScreen()
    const ProfileScreen() */
  ];
}
