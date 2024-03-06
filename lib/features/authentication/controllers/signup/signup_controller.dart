import 'package:ecommerce/common/widgets/loaders/loaders.dart';
import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce/data/repositories/user/user_repository.dart';
import 'package:ecommerce/features/authentication/models/UserModel.dart';
import 'package:ecommerce/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce/utils/helpers/network_manager.dart';
import 'package:ecommerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  // Valiables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // ----------------Sign Up --------------------------
  Future<void> signUp() async {
    try {
      // Start Loading
      AFullScreenLoader().startLoading();

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AFullScreenLoader().stopLoading();
        return;
      }

      // Form validation
      if (!signupFormKey.currentState!.validate()) {
        AFullScreenLoader().stopLoading();
        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        AFullScreenLoader().stopLoading();
        ALoaders.warningSnackBar(
            title: 'Үйлчилгээний нөхцөлийг зөвшөөрсөн байх шаардлагатай.',
            message: 'Үйлчилгээний нөхцөлтэй уншиж танилцаарай.');
        return;
      }

      // Register user in the Firebase Authentication & Save Userdata in the Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save authenticated user data in the Firebase Authentication
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      AFullScreenLoader().stopLoading();

      // Show success message
      ALoaders.successSnackBar(
          title: 'Congratulations!',
          message: "Your account has been successfully created");

      // Move to verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      AFullScreenLoader().stopLoading();
      ALoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
