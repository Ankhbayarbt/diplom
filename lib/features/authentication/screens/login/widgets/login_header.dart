import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(dark ? AImages.lightAppLogo : AImages.darkAppLogo),
        ),
        const SizedBox(height: ASizes.spaceBtwItems),
        Text(
          ATexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        )
      ],
    );
  }
}
