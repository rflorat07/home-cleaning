import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../utils/utils.dart';
import '../widgets/choice_chip_list.dart';
import '../widgets/list_view_bookmark_card.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: TTexts.bookmarkTab,
        actions: [
          IconButton.outlined(
            iconSize: TSizes.appBarIconSize,
            style: OutlinedButton.styleFrom(
                side: const BorderSide(color: TColors.borderPrimary)),
            onPressed: () {},
            icon: const Icon(IconsaxPlusLinear.search_normal_1),
          )
        ],
      ),
      body: const Column(
        children: [
          TChoiceChipList(),
          ListViewBookmarkCard(),
        ],
      ),
    );
  }
}
