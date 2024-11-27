import 'package:get/get.dart';

import '../../../../../data/repositories/help_center/help_center.repository.dart';
import '../models/help_center.model.dart';

class HelpCenterController extends GetxController {
  static HelpCenterController get instance => Get.find();

  RxBool isLoading = false.obs;

  RxList<String> chipList = <String>[].obs;
  RxList<HelpCenterModel> faqList = <HelpCenterModel>[].obs;
  RxList<HelpCenterModel> contactUsList = <HelpCenterModel>[].obs;

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
    fetchInitData();
    super.onInit();
  }

  Future<void> fetchInitData() async {
    try {
      isLoading(true);

      final faqListResult = await _helpCenterRepository.getAllHelpCenter();
      final contactUsResult = await _helpCenterRepository.getAllContactUs();

      chipList(_chips);
      faqList(faqListResult);
      contactUsList(contactUsResult);
    } catch (e) {
      chipList([]);
      faqList([]);
      contactUsList([]);
    } finally {
      isLoading(false);
    }
  }
}
