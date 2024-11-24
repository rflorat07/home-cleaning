import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class CenterCircularProgressIndicator extends StatelessWidget {
  const CenterCircularProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: TColors.green,
      ),
    );
  }
}
