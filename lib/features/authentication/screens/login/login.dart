import 'package:ecommerce/common/styles/spacing_style.dart';
import 'package:ecommerce/common/widgets/login_signup/form_divider.dart';
import 'package:ecommerce/common/widgets/login_signup/social_button.dart';
import 'package:ecommerce/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ecommerce/features/authentication/screens/login/widgets/login_header.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: ASpacingStyle.paddingWithAppBarHeight,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo, Title, Subtitle
              const LoginHeader(),

              // Form
              const LoginForm(),

              // SignIn Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(ATexts.signin),
                ),
              ),
              const SizedBox(height: ASizes.spaceBtwItems),
              // Create Account Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text(ATexts.createAccount),
                ),
              ),
              const SizedBox(height: ASizes.spaceBtwSections),

              // Divider
              FormDivider(dividerText: ATexts.orSignInWith.capitalize!),
              const SizedBox(height: ASizes.spaceBtwSections),

              // Footer
              const SocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
