import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

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
                  prefixIcon: Icon(Icons.directions),
                  label: Text(ATexts.email)),
            ),
            const SizedBox(height: ASizes.spaceBtwInputFields),
            // Password
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.directions),
                  label: Text(ATexts.password),
                  suffixIcon: Icon(Icons.remove_red_eye)),
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
                    onPressed: () {}, child: const Text(ATexts.forgetPassword))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
