import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class WordModel {
  final String word;
  String translation;
  String description;
  String category;
  String picture;

  WordModel({
    required this.word,
    required this.translation,
    required this.description,
    required this.category,
    required this.picture,
  });

  static WordModel empty() => WordModel(
      word: '', translation: '', description: '', category: '', picture: '');

  factory WordModel.fromSnapshot(DataSnapshot snapshot) {
    if (snapshot.exists) {
      final data = snapshot.value as Map<dynamic, dynamic>;
      return WordModel(
        word: snapshot.key!,
        translation: data['Translation'] ?? '',
        description: data['Description'] ?? '',
        category: data['Category'] ?? '',
        picture: data['Picture'] ?? '',
      );
    } else {
      return WordModel.empty();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'Key': word,
      'Translation': translation,
      'Description': description,
      'Category': category,
      'Picture': picture,
    };
  }
}
