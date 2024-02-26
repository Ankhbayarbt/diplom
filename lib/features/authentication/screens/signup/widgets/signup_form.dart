import 'package:ecommerce/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Form(
      child: Column(
        children: [
          Row(
            children: [
              // First & Last Name
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: ATexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: ASizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: ATexts.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              )
            ],
          ),
          const SizedBox(height: ASizes.spaceBtwInputFields),

          // Username
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: ATexts.userName,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: ASizes.spaceBtwInputFields),

          // Email
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: ATexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: ASizes.spaceBtwInputFields),

          // Phone Number
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: ATexts.phone, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: ASizes.spaceBtwInputFields),

          // Password
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: ATexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(height: ASizes.spaceBtwInputFields),

          // TermsCondition Checkbox
          Row(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(value: true, onChanged: (value) => {}),
              ),
              const SizedBox(width: ASizes.spaceBtwItems),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: '${ATexts.iAgreeTo} ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: ATexts.privacyPolicy,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? AColors.white : AColors.black,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? AColors.white : AColors.black,
                      ),
                ),
                TextSpan(
                    text: ' ${ATexts.and} ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: ATexts.termOfUse,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? AColors.white : AColors.black,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? AColors.white : AColors.black,
                      ),
                ),
              ]))
            ],
          ),
          const SizedBox(height: ASizes.spaceBtwSections),

          // Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => Get.to(() => const VerifyEmailScreen()),
                child: const Text(ATexts.createAccount)),
          )
        ],
      ),
    );
  }
}
