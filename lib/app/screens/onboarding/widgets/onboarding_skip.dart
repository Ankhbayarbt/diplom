import 'package:ecommerce/app/controllers/onboarding/onboarding_controller.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:ecommerce/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: DeviceUtilities.getAppBarHeight(),
        right: ASizes.defaultSpace,
        child: TextButton(
          onPressed: OnBoardingController.instansce.skipPage,
          child: const Text(ATexts.skip),
        ));
  }
}
