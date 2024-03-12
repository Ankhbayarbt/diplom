import 'package:ecommerce/app/controllers/forget_password/forget_password_controller.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:ecommerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ASizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Headings
              Text(
                ATexts.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: ASizes.spaceBtwItems),
              Text(
                ATexts.forgetPasswordSubtitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: ASizes.spaceBtwSections * 2),

              // Text Field
              Form(
                key: controller.forgetPasswordFormKey,
                child: TextFormField(
                  controller: controller.email,
                  validator: (value) => Validator.validateEmail(value),
                  decoration: const InputDecoration(
                      labelText: ATexts.email,
                      prefixIcon: Icon(Iconsax.direct_right)),
                ),
              ),
              const SizedBox(height: ASizes.spaceBtwSections),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.sendPasswordPResetEmail(),
                    child: const Text(ATexts.submit)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
