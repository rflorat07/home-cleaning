import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../../data/repositories/authentication/authentication.dart';
import '../../../../../utils/utils.dart';
import '../../../../navigation/screens/navigation_menu.dart';
import '../../forgot_password/forgot_password.dart';
import '../cubit/login_cubit.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LoginCubit(context.read<AuthenticationBlocRepository>()),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status.isFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage ?? 'Authentication Failure'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
          }
          if (state.status.isSuccess) {
            AppNavigator.pushAndRemove(context, const NavigationMenu());
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
    final displayError =
        context.select((LoginCubit cubit) => cubit.state.email.displayError);

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
          onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            errorText: displayError != null ? TTexts.invalidEmail : null,
          ),
        ),
      ],
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubitState = context.select((LoginCubit cubit) => cubit.state);

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
              context.read<LoginCubit>().passwordChanged(password),
          obscureText: cubitState.obscureText,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () =>
                  context.read<LoginCubit>().togglePasswordVisibility(),
              icon: Icon(
                cubitState.obscureText
                    ? IconsaxPlusLinear.eye_slash
                    : IconsaxPlusLinear.eye,
              ),
            ),
            errorText: cubitState.password.displayError != null
                ? TTexts.invalidPassword
                : null,
          ),
        ),
      ],
    );
  }
}

class _RememberMeCheckbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubitState = context.select((LoginCubit cubit) => cubit.state);
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
                value: cubitState.rememberMe,
                onChanged: (value) =>
                    context.read<LoginCubit>().rememberMeChanged(),
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
    final isValid = context.select(
      (LoginCubit cubit) => cubit.state.isValid,
    );
    return SizedBox(
      width: double.infinity,
      height: TSizes.buttonHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: () => context.read<LoginCubit>().logInWithCredentials(),
        child: const Text(TTexts.signIn),
      ),
    );
  }
}
