class Validation {
  static String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "Email cannot be empty";
    } else if (!value.endsWith("@gmail.com")) {
      return "Invalid email address";
    } else {
      return null;
    }
  }

  static String? passWordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "Password cannot be empty";
    } else if (value.length < 6) {
      return "Password must be at least 6 characters long";
    } else {
      return null;
    }
  }

  static String? nameValidate({required String? value,String comment = "Name"}) {
    if (value == null || value.isEmpty) {
      return "$comment is required";
    } else {
      return null;
    }
  }

}