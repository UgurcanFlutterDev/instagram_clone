import 'package:instagram_clone/utils/utils.dart';

class Validators {
  // String? Function(String?)?

  static String? emailValidator(String? email) {
    if (Utils.isEmail(email)) {
      return null;
    }
    return "Please enter a valid e-mail adress!";
  }

  static String? emptyFieldValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      return null;
    }
    return "This field can't be empty.";
  }

  static String? minLengthValidator(int minLength, String? value) {
    if (value != null && value.length >= minLength) {
      return null;
    }
    return "Please enter atleast $minLength characters.";
  }
}
