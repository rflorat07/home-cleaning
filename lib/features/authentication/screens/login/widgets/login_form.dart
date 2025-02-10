import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../../data/repositories/authentication/authentication.dart';
import '../../../../../utils/utils.dart';
import '../../../../navigation/screens/navigation_menu.dart';
import '../../forgot_password/forgot_password.dart';
import '../bloc/login_bloc.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LoginBloc(context.read<AuthenticationBlocRepository>()),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status.isInProgress) {
            TFullScreenLoader.openLoadingDialog(context);
          }

          if (state.status.isSuccess) {
            TFullScreenLoader.stopLoading(context);
            AppNavigator.pushAndRemove(context, const NavigationMenu());
          }

          if (state.status.isFailure) {
            TFullScreenLoader.stopLoading(context);
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 3),
                  content: Text(state.errorMessage ?? 'Authentication Failure'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(top: TSizes.size54),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _EmailInput(),
              const SizedBox(height: TSizes.size20),
              _PasswordInput(),
              const SizedBox(height: TSizes.size12),
              _RememberMeCheckbox(),
              const SizedBox(height: TSizes.spaceBtwSections),
              _LoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final blocState = context.select((LoginBloc bloc) => bloc.state);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: TSizes.size6,
      children: [
        /// Email
        Text(TTexts.email,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontWeight: FontWeight.w500)),

        TextFormField(
          key: const Key('loginForm_emailInput_textField'),
          onChanged: (email) =>
              context.read<LoginBloc>().add(EmailChanged(email)),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            errorText: blocState.email.isValid || blocState.email.isPure
                ? null
                : blocState.email.displayError,
          ),
        ),
      ],
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final blocState = context.select((LoginBloc bloc) => bloc.state);
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
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<LoginBloc>().add(PasswordChanged(password)),
          obscureText: blocState.obscureText,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () => context
                  .read<LoginBloc>()
                  .add(TogglePasswordVisibility(blocState.obscureText)),
              icon: Icon(
                blocState.obscureText
                    ? IconsaxPlusLinear.eye_slash
                    : IconsaxPlusLinear.eye,
              ),
            ),
            errorText: blocState.password.isValid || blocState.password.isPure
                ? null
                : blocState.password.displayError,
          ),
        ),
      ],
    );
  }
}

class _RememberMeCheckbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final blocState = context.select((LoginBloc bloc) => bloc.state);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Remember Me
        Row(
          children: [
            SizedBox(
              height: TSizes.size24,
              width: TSizes.size24,
              child: Checkbox(
                value: blocState.rememberMe,
                onChanged: (value) => context
                    .read<LoginBloc>()
                    .add(RememberMeChanged(value ?? false)),
              ),
            ),
            const SizedBox(width: TSizes.size4),
            Text(
              TTexts.rememberMe,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),

        /// Forget Password
        InkWell(
          onTap: () => AppNavigator.push(context, const ForgotPasswordScreen()),
          child: Text(
            TTexts.forgetPassword,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: TColors.green,
                  fontWeight: FontWeight.w500,
                  decorationColor: TColors.green,
                  decoration: TextDecoration.underline,
                ),
          ),
        ),
      ],
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: TSizes.buttonHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: () => context.read<LoginBloc>().add(LoginSubmitted()),
        child: const Text(TTexts.signIn),
      ),
    );
  }
}
