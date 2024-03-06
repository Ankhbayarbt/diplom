import 'package:ecommerce/common/widgets/loaders/loaders.dart';
import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:ecommerce/utils/helpers/network_manager.dart';
import 'package:ecommerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  ForgetPasswordController get instance => Get.find();

  // Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // Send Reset Password Email
  sendPasswordPResetEmail() async {
    try {
      AFullScreenLoader().startLoading();

      final isConnected = await NetworkManager().isConnected();
      if (!isConnected) {
        AFullScreenLoader().stopLoading();
        return;
      }

      if (!forgetPasswordFormKey.currentState!.validate()) {
        AFullScreenLoader().stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      AFullScreenLoader().stopLoading();

      ALoaders.successSnackBar(
          title: 'И-мэйл илгээлээ.',
          message:
              "Нууц үгээ солих линкийг таны мэйл хаяг руу илгээсэн тул мэйлээ шалгана уу.");

      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      AFullScreenLoader().stopLoading();
      ALoaders.errorSnackBar(
          title: 'Алдаа гарлаа.', message: "Та дахин оролдоно уу.");
    }
  }

  // Resend Reset Password Email
  resendPasswordPResetEmail(String email) async {
    try {
      AFullScreenLoader().startLoading();

      final isConnected = await NetworkManager().isConnected();
      if (!isConnected) {
        AFullScreenLoader().stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      AFullScreenLoader().stopLoading();

      ALoaders.successSnackBar(
          title: 'И-мэйл илгээлээ.',
          message:
              "Нууц үгээ солих линкийг таны мэйл хаяг руу илгээсэн тул мэйлээ шалгана уу.");
    } catch (e) {
      AFullScreenLoader().stopLoading();
      ALoaders.errorSnackBar(
          title: 'Алдаа гарлаа.', message: "Та дахин оролдоно уу.");
    }
  }
}
