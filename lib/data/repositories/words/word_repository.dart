import 'package:ecommerce/app/models/WordModel.dart';
import 'package:ecommerce/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:ecommerce/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class WordRepository extends GetxController {
  static WordRepository get instance => Get.find();

  final _dbref = FirebaseDatabase.instance.ref();

  Future<WordModel> readWord({required String word}) async {
    try {
      final snapshot = await _dbref.child('words/$word').get();
      if (snapshot.exists) {
        return WordModel.fromSnapshot(snapshot);
      } else {
        return WordModel.empty();
      }
    } on FirebaseAuthException catch (e) {
      throw AFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw APlatformException(e.code).message;
    } catch (e) {
      throw 'Алдаа гарлаа. Та дахин оролдоно уу.';
    }
  }

  Future<List<WordModel>> readAllWords() async {
    try {
      final snapshot = await _dbref.get();
      final wordList = <WordModel>[];

      if (snapshot.exists) {
        // Check if the snapshot exists (contains data)

        // Ensure that snapshot.value is not null before iterating through it
        if (snapshot.value != null) {
          // Cast snapshot.value to Map<dynamic, dynamic>
          Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;

          // Iterate through each child of the database snapshot
          data.forEach((key, value) {
            // For each child, print out the key and value
            print('key: $key');
            print('value: $value');
          });
        }
      }

      return wordList;
    } on FirebaseAuthException catch (e) {
      throw AFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw APlatformException(e.code).message;
    } catch (e) {
      throw 'Алдаа гарлаа. Та дахин оролдоно уу.';
    }
  }
}
