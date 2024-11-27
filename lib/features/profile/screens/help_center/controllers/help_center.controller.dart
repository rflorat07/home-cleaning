import 'package:get/get.dart';

import '../../../../../data/repositories/help_center/help_center.repository.dart';
import '../models/help_center.model.dart';

class HelpCenterController extends GetxController {
  static HelpCenterController get instance => Get.find();

  RxBool isLoading = false.obs;

  RxList<HelpCenterModel> allFAQ = <HelpCenterModel>[].obs;
  RxList<String> chipList = <String>[].obs;

  final _helpCenterRepository = Get.put(HelpCenterRepository());

  final List<String> _chips = [
    'All',
    'Services',
    'General',
    'Account',
    'Booking',
    'Profile'
  ];

  @override
  void onInit() {
    fetchHelpCenterRecord();
    super.onInit();
  }

  fetchHelpCenterRecord() async {
    try {
      isLoading(true);
      final result = await _helpCenterRepository.getAllAddress();
      allFAQ(result);
      chipList(_chips);
    } catch (e) {
      allFAQ([]);
      chipList([]);
    } finally {
      isLoading(false);
    }
  }
}
