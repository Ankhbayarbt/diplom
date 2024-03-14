import 'package:ecommerce/data/repositories/words/word_repository.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WordController extends GetxController {
  static WordController get instance => Get.find();

  final wordRepository = Get.put(WordRepository());
  final filter = TextEditingController();
  final ref = FirebaseDatabase.instance.ref('words');
  Key listKey = UniqueKey();

  @override
  void onInit() {
    super.onInit();
    ref.keepSynced(true);
  }

  Query buildQuery(String filter) {
    if (filter.isEmpty) {
      return ref;
    } else {
      return ref.orderByKey().startAt(filter).endAt('$filter\uf8ff');
    }
  }
}
