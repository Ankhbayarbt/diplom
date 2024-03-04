class APlatformException implements Exception {
  final String code;

  APlatformException(this.code);

  String get message {
    switch (code) {
      case 'invalid-password':
        return 'Нууц үг буруу байна.';
      case 'sign_in_failed':
        return 'Нэвтрэх хүсэлт амжилтгүй боллоо. Та дахин оролдоно уу.';
      case 'internal-error':
        return 'Дотоод алдаа гарлаа. Та дахин оролдоно уу.';
      case 'invalid-verification-code':
        return 'Баталгаажуулах код буруу байна.';
      default:
        return 'Platform алдаа гарлаа: ${code.toString()}';
    }
  }
}
