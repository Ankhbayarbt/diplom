import 'package:get/get.dart';

class AFirebaseAuthException implements Exception {
  final String code;

  AFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'И-мейл хаяг бүртгэлтэй байна. Та өөр мейл хаяг ашиглана уу.';
      case 'invalid-email':
        return 'И-мэйл хаяг алдаатай байна.';
      case 'weak-password':
        return 'Хэтэрхий сул нууц үг байна.';
      case 'user-not-found':
        return 'Хэрэглэгч олдсонгүй';
      case 'wrong-password':
        return 'Нууц үг буруу байна.';
      case 'invalid-verification-code':
        return 'Баталгаажуулах код буруу.';
      case 'invalid-credential':
        return 'И-мэйл хаяг эсвэл нууц үг буруу байна.';
      case 'too-many-requests':
        return 'Түр хүлээгээд дахин оролдоно уу.';
      default:
        print(code.toString());
        return 'FirebaseAuth Алдаа гарлаа: ${code.toString()}';
    }
  }
}
