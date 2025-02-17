import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../../common/common.dart';
import '../../../../../data/repositories/authentication/authentication.dart';
import '../../../../../utils/utils.dart';
import '../../verify_email/verify_email.dart';
import '../bloc/signup_bloc.dart';
import 'terms_conditions_checkbox.dart';

class TSignupForm extends StatelessWidget {
  TSignupForm({super.key});

  final _signupFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SignupBloc(context.read<AuthenticationBlocRepository>()),
      child: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state.status.isInProgress) {
            TFullScreenLoader.openLoadingDialog(context);
          }

          if (state.status.isSuccess) {
            TFullScreenLoader.stopLoading(context);
            AppSnackbar.success(context, TTexts.congratulationMessage);
            AppNavigator.pushAndRemove(
                context, VerifyEmailScreen(email: state.email.value));
          }

          if (state.status.isFailure) {
            TFullScreenLoader.stopLoading(context);
            AppSnackbar.error(
                context, state.errorMessage ?? TTexts.signupFailedMessage);
          }
        },
        child: Form(
          key: _signupFormKey,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
            child: Column(
              spacing: TSizes.size20,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Name
                _NameInput(),

                /// Email
                _EmailInput(),

                /// Password
                _PasswordInput(),

                /// Agree with Terms & Condition
                const TTermsAndConditionsCheckbox(),

                /// Sign In button
                _SubmitButton(formKey: _signupFormKey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return Column(
          spacing: TSizes.size6,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(TTexts.name,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontWeight: FontWeight.w500)),
            TextFormField(
              key: const Key('signupForm_nameInput_textField'),
              onChanged: (name) => context.read<SignupBloc>().add(
                    NameChanged(name),
                  ),
              decoration: InputDecoration(
                errorText: state.name.isValid || state.name.isPure
                    ? null
                    : state.name.displayError,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return Column(
          spacing: TSizes.size6,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(TTexts.email,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontWeight: FontWeight.w500)),
            TextFormField(
              key: const Key('signupForm_emailInput_textField'),
              keyboardType: TextInputType.emailAddress,
              onChanged: (email) =>
                  context.read<SignupBloc>().add(EmailChanged(email)),
              decoration: InputDecoration(
                errorText: state.email.isValid || state.email.isPure
                    ? null
                    : state.email.displayError,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.obscureText != current.obscureText,
      builder: (context, state) {
        final bloc = context.read<SignupBloc>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: TSizes.size6,
          children: [
            /// Password
            Text(
              TTexts.password,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontWeight: FontWeight.w500),
            ),

            TextFormField(
              key: const Key('signupForm_passwordInput_textField'),
              onChanged: (password) => bloc.add(PasswordChanged(password)),
              obscureText: state.obscureText,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () =>
                      bloc.add(TogglePasswordVisibility(state.obscureText)),
                  icon: Icon(
                    state.obscureText
                        ? IconsaxPlusLinear.eye_slash
                        : IconsaxPlusLinear.eye,
                  ),
                ),
                errorText: state.password.isValid || state.password.isPure
                    ? null
                    : state.password.displayError,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: TSizes.buttonHeight,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  context.read<SignupBloc>().add(SignupSubmitted());
                }
              },
              child: const Text(TTexts.submit)),
        );
      },
    );
  }
}
