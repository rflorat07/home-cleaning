import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/utils.dart';
import '../bloc/signup_bloc.dart';

class TTermsAndConditionsCheckbox extends StatelessWidget {
  const TTermsAndConditionsCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: TSizes.size24,
          height: TSizes.size24,
          child: Transform.scale(
            scale: 1.2,
            child: BlocBuilder<SignupBloc, SignupState>(
              builder: (context, state) {
                return Checkbox(
                  key: const Key('signupForm_privacyPolicy_checkbox'),
                  value: state.agreeTerms,
                  onChanged: (value) => context
                      .read<SignupBloc>()
                      .add(AgreeTermsChanged(value ?? false)),
                );
              },
            ),
          ),
        ),
        const SizedBox(width: TSizes.size8),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: TTexts.agree,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              TextSpan(
                text: TTexts.termsCondition,
                recognizer: TapGestureRecognizer()..onTap = () {},
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: TColors.green,
                      decoration: TextDecoration.underline,
                      decorationColor: TColors.green,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
