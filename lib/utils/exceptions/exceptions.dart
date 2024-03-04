class AException implements Exception {
  final String code;

  AException(this.code);

  String get message {
    switch (code) {
      case '':
        return '';
      default:
        return '';
    }
  }
}
