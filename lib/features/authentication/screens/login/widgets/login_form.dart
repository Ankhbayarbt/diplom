import 'package:ecommerce/features/authentication/controllers/login/login_controller.dart';
import 'package:ecommerce/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:ecommerce/features/authentication/screens/signup/signup.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:ecommerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: ASizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              controller: controller.email,
              validator: (value) => Validator.validateEmail(value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email), label: Text(ATexts.email)),
            ),
            const SizedBox(height: ASizes.spaceBtwInputFields),
            // Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => Validator.validateEmptyText(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: ATexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.hidePassword.value =
                          !controller.hidePassword.value;
                    },
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                  ),
                ),
              ),
            ),
            const SizedBox(height: ASizes.spaceBtwInputFields / 2),
            // Remember me & Forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) {
                            controller.rememberMe.value =
                                !controller.rememberMe.value;
                          }),
                    ),
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
                onPressed: () => controller.emailAndPasswordSignIn(),
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
            const SizedBox(height: ASizes.spaceBtwItems),
          ],
        ),
      ),
    );
  }
}
