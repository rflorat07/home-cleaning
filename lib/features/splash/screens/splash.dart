import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/utils.dart';
import '../../authentication/authentication.dart';
import '../../authentication/screens/login/login.dart';
import '../../authentication/screens/verify_email/verify_email.dart';
import '../../navigation/screens/navigation_menu.dart';
import '../../onboarding/screens/onboarding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationIsFirstTime) {
          AppNavigator.pushAndRemove(context, const OnBoardingScreen());
        }

        if (state is AuthenticationVerifyEmail) {
          AppNavigator.pushReplacement(context, const VerifyEmailScreen());
        }

        if (state is AuthenticationUnauthenticated) {
          AppNavigator.pushAndRemove(context, const LoginScreen());
        }

        if (state is AuthenticationAuthenticated) {
          AppNavigator.pushAndRemove(context, const NavigationMenu());
        }
      },
      child: Scaffold(
        backgroundColor: TColors.primary,
        body: Center(
          child: Column(
            spacing: TSizes.spaceBtwItems,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage(TImages.splash),
                width: TSizes.size80,
                height: TSizes.size80,
              ),
              Text(
                TTexts.splash,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: TColors.textWhite,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
