class Validator {
  Validator._();

  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Bạn chưa nhập tài khoản';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? value) {
    const String pattern = r'^.{6,}$';
    final RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Bạn chưa nhập mật khẩu';
    } else if (!regex.hasMatch(value)) {
      return 'Mật khẩu phải có tối thiểu 6 ký tự';
    } else {
      return null;
    }
  }

  static String? validateEmpty(String? value) {
    return value != null && value.isEmpty ? "Can't be left blank" : null;
  }

  static String? validateName(String? value) {
    return value != null && value.isEmpty ? "Please enter a name" : null;
  }
}