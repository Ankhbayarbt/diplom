import 'package:ecommerce/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:ecommerce/features/authentication/screens/signup/signup.dart';
import 'package:ecommerce/navigation_menu.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: ASizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email), label: Text(ATexts.email)),
            ),
            const SizedBox(height: ASizes.spaceBtwInputFields),
            // Password
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  label: Text(ATexts.password),
                  suffixIcon: Icon(Icons.visibility_off)),
            ),
            const SizedBox(height: ASizes.spaceBtwInputFields / 2),
            // Remember me & Forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(ATexts.rememberMe),
                  ],
                ),
                // Forget password
                TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: const Text(ATexts.forgetPassword))
              ],
            ),
            // SignIn Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const NavigationMenu()),
                child: const Text(ATexts.signin),
              ),
            ),
            const SizedBox(height: ASizes.spaceBtwItems),
            // Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(ATexts.createAccount),
              ),
            ),
            const SizedBox(height: ASizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
