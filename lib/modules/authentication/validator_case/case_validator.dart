class CaseValidator {
  CaseValidator._();

  static String? validator(String value, String? validationType, [String? comp1, String? comp2]) {
    final RegExp isEmail = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    final RegExp passwordRegExp = RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$');

    switch (validationType) {
      case "email":
        {
          if (value.isEmpty) {
            return "Please enter your email";
          }
          if (!isEmail.hasMatch(value)) {
            return "Please enter a valid email";
          }
        }
      case "password":
        {
          if (value.isEmpty) {
            return "Please enter password";
          }
          if (!passwordRegExp.hasMatch(value)) {
            return 'Password must be at least 6 characters long, '
                'contain at least one uppercase letter, one digit, '
                'and one special character (@, \$, !, %, *, ?, or &).';
          }
        }
    }
    return null;
  }
}
