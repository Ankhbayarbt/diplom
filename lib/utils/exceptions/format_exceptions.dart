class AFormatException implements Exception {
  final String message;

  AFormatException([this.message = 'An unexpected format error occurred']);

  factory AFormatException.fromMessage(String message) {
    return AFormatException(message);
  }

  String get formattedException => message;

  factory AFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-phone-number-format':
        return AFormatException(
            'Утасны дугаар буруу байна. Та дахин оролдоно уу.');
      default:
        return AFormatException(
            'FormatException алдаа гарлаа: ${code.toString()}');
    }
  }
}
