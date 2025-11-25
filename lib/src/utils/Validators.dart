import 'package:ecommerce_flutter/src/utils/Constants.dart';



class Validators {

  String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return kTextVacio;
    }

    if (!kEmailRegExp.hasMatch(email)) {
      return kEmailFormatError;
    }
    return null;
  }

  String? textValidator(String? text) {
    if (text == null || text.isEmpty) {
      return kTextVacio;
    }

    if (text.length < 2) {
      return kMinLengthError;
    }
    return null;
  }

  String? phoneValidator(String? phone) {
    if (phone == null || phone.isEmpty) {
      return kTextVacio;
    }

    if (phone.length < 8) {
      return kPhoneLengthError;
    }
    return null;
  }


  String? 
  passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return kTextVacio;
    }
    
    if (password.length < 8) {
      return kPasswordFormatError;
    }

    if (!kPasswordRegExp.hasMatch(password)) {
      return kPasswordFormatError2;
    }

    return null;
  }

  String? confirmPasswordValidator(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return kTextVacio;
    }

    if (password != confirmPassword) {
      return kPasswordMismatchError;
    }

    return null;
  }
}
