class Validator {
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName хоосон байж болохгүй.';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Хоосон байж болохгүй.';
    }

    final emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
      caseSensitive: false,
      multiLine: false,
    );

    if (!emailRegExp.hasMatch(value)) {
      return 'И-мэйл хаяг алдаатай байна.';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Хоосон байж болохгүй.';
    }

    if (value.length < 6) {
      return 'Хамгийн багадаа 6-н тэмдэгт шаардлагатай.';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Хамгийн багад 1 цифр шаардлагатай.';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Хамгийн багадаа 1 том үсэг шаардлагатай.';
    }

    if (!value.contains(RegExp(r'[!@#$%^&*,.<>|?/=+]'))) {
      return 'Хамгийн багадаа 1 тэмдэгт ашиглаарай.';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Хоосон байж болохгүй.';
    }

    final phoneRegExp = RegExp(r'^\d{8}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Утасны дугаар буруу байна.';
    }
    return null;
  }
}
