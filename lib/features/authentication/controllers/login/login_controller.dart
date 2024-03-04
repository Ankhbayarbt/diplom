import 'package:ecommerce/common/widgets/loaders/loaders.dart';
import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce/utils/helpers/network_manager.dart';
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

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL');
    password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    if (rememberMe.isFalse) {
      email.text = '';
      password.text = '';
    }
    super.onInit();
  }

  // Email and Password SIGN IN
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      // AFullScreenLoader.openLoadingDialog(
      //     'We are processing your information ...', AImages.docerAnimation);

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // AFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!loginFormKey.currentState!.validate()) {
        // AFullScreenLoader.stopLoading();
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

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // AFullScreenLoader.stopLoading();
      ALoaders.errorSnackBar(title: 'Алдаа гарлаа!', message: e.toString());
    }
  }
}
