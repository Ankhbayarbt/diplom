import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/authentication/models/UserModel.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to save user data
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } catch (e) {
      throw 'Error saving user: ${e.toString()}';
    }
  }
}