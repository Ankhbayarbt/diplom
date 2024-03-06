class AFirebaseException implements Exception {
  final String code;

  AFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'unknown':
        return 'Firebase алдаа гарлаа.';
      case 'invalid-custom-token':
        return 'Токен формат буруу.';
      case 'user-not-found':
        return 'Өгөгдсөн mail, uid-тай хэрэглэгч олдсонгүй.';
      case 'invalid-email':
        return 'И-мэйл хаяг буруу.';
      case 'email-already-in-use':
        return 'И-мейл хаяг бүртгэлтэй байна. Та өөр мейл хаяг ашиглана уу';
      case 'wrong-password':
        return 'Нууц үг буруу байна.';
      default:
        print(code.toString());
        return 'Firebase алдаа гарлаа: ${code.toString()}';
    }
  }
}
