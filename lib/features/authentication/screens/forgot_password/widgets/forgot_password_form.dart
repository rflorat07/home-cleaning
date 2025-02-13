import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../../common/common.dart';
import '../../../../../data/repositories/authentication/authentication.dart';
import '../../../../../utils/utils.dart';
import '../../login/login.dart';
import '../bloc/forgot_password_bloc.dart';

class TForgotPasswordForm extends StatelessWidget {
  TForgotPasswordForm({super.key});

  final _forgotPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ForgotPasswordBloc(context.read<AuthenticationBlocRepository>()),
      child: BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
        listener: (context, state) {
          if (state.status.isInProgress) {
            TFullScreenLoader.openLoadingDialog(context);
          }

          if (state.status.isSuccess) {
            TFullScreenLoader.stopLoading(context);
            AppSnackbar.success(context, TTexts.emailSentReset);
            AppNavigator.pushAndRemove(context, const LoginScreen());
          }

          if (state.status.isFailure) {
            TFullScreenLoader.stopLoading(context);
            AppSnackbar.error(
                context, state.errorMessage ?? TTexts.failedSendEmail);
          }
        },
        child: Form(
          key: _forgotPasswordFormKey,
          child: Padding(
            padding: const EdgeInsets.only(top: TSizes.size30),
            child: Column(
              spacing: TSizes.spaceBtwSections,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Email
                _EmailInput(),

                /// Submit button
                _SubmitButton(formKey: _forgotPasswordFormKey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
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
              key: const Key('forgotPassword_emailInput_textField'),
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              onChanged: (email) =>
                  context.read<ForgotPasswordBloc>().add(EmailChanged(email)),
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

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: TSizes.buttonHeight,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  context
                      .read<ForgotPasswordBloc>()
                      .add(SubmitForgotPassword());
                }
              },
              child: const Text(TTexts.submit)),
        );
      },
    );
  }
}
