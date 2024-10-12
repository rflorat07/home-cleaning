import 'package:flutter/material.dart';
import 'package:home_cleaning/common/widgets/appbar/appbar.dart';

import '../../../utils/utils.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
          title: Text(TTexts.chatTab,
              style: Theme.of(context).textTheme.titleMedium)),
      body: const Center(
        child: Text('ChatScreen'),
      ),
    );
  }
}
