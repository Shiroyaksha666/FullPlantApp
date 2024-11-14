extension ExtString on String {
// email validator
  bool get isValidEmail {
    final emailRegExp = RegExp(
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
    return emailRegExp.hasMatch(this);
  }

// password validator
  bool get isValidPassword {
    final passwordRegExp =
        RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");
    return passwordRegExp.hasMatch(this);
  }
}
