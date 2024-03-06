import 'package:ecommerce/common/widgets/loaders/loaders.dart';
import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce/utils/helpers/network_manager.dart';
import 'package:ecommerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  LoginController get instance => Get.find();

  // Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    // email.text = localStorage.read('REMEMBER_ME_EMAIL');
    // password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();
  }

  // Email and Password SIGN IN
  Future<void> emailAndPasswordSignIn() async {
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
      if (!loginFormKey.currentState!.validate()) {
        AFullScreenLoader().stopLoading();
        return;
      }

      // Save data if remember me clicked
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login User
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      AFullScreenLoader().stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      AFullScreenLoader().stopLoading();
      ALoaders.errorSnackBar(title: 'Алдаа гарлаа!', message: e.toString());
    }
  }

  // Google Sign In
  Future<void> googleSignIn() async {
    try {
      AFullScreenLoader().startLoading();

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AFullScreenLoader().stopLoading();
        return;
      }

      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      await userController.saveUserRecord(userCredentials);
      AFullScreenLoader().stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      AFullScreenLoader().stopLoading();
      ALoaders.errorSnackBar(title: 'Алдаа гарлаа.', message: e.toString());
    }
  }
}
