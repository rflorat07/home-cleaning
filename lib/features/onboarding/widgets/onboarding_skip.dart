import 'package:flutter/material.dart';

import '../../../utils/utils.dart';
import '../../authentication/screens/login/login.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: double.minPositive,
      child: TextButton(
        onPressed: () =>
            AppNavigator.pushAndRemove(context, const LoginScreen()),
        child: Text(
          'Skip',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: TColors.primary),
        ),
      ),
    );
  }
}
