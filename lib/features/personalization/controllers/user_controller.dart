import 'package:ecommerce/common/widgets/loaders/loaders.dart';
import 'package:ecommerce/data/repositories/user/user_repository.dart';
import 'package:ecommerce/features/authentication/models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: userCredentials.user!.displayName ?? '',
            lastName: userCredentials.user!.displayName ?? '',
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '');

        await UserRepository().saveUserRecord(user);
      }
    } catch (e) {
      ALoaders.errorSnackBar(
          title: 'Мэдээллийг хадгалж чадсангүй.',
          message:
              'Таны мэдээллийг хадгалж байхад алдаа гарсан тул дахин оролдоно уу.');
    }
  }
}
