extension NullExceptionString on String? {
  bool get isNotNull {
    return this != null;
  }

  bool containsWithNull(String? e) {
    final val = this;
    if (val != null && e != null) {
      return val.toLowerCase().contains(e.toLowerCase());
    } else {
      return false;
    }
  }
}

extension ExtString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidName2 {
    final nameRegExp = RegExp(r"[a-zA-Z]+|\s");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?85620[0-9]{8}$");
    return phoneRegExp.hasMatch(this);
  }
}
