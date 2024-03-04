import 'dart:async';

import 'package:ecommerce/common/widgets/loaders/loaders.dart';
import 'package:ecommerce/common/widgets/success_screen/success_screen.dart';
import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  // Send email & Set timer
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoDirect();
    super.onInit();
  }

  // Send email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      ALoaders.successSnackBar(
          title: 'И-мэил илгээлээ.', message: 'Та цахим шуудангаа шалгана уу.');
    } catch (e) {
      ALoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }

  // Timer
  setTimerForAutoDirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccesScreen(
              image: AImages.successAnimation,
              title: ATexts.yourAccountCreatedTitle,
              subtitle: ATexts.yourAccountCreatedSubTitle,
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
            ));
      }
    });
  }

  // Check email verification
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccesScreen(
            image: AImages.successAnimation,
            title: ATexts.yourAccountCreatedTitle,
            subtitle: ATexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ));
    }
  }
}
