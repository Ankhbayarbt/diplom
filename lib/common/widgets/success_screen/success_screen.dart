import 'package:ecommerce/common/styles/spacing_style.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SuccesScreen extends StatelessWidget {
  const SuccesScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      this.onPressed});

  final String image, title, subtitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: ASpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              // Image
              Image(
                image: AssetImage(image),
                width: HelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: ASizes.spaceBtwSections),

              // Title & Subtitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: ASizes.spaceBtwSections),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: ASizes.spaceBtwSections),

              // Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(ATexts.continuee),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
