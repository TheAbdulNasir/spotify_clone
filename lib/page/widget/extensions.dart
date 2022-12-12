import 'package:flutter/material.dart';


extension ValiationExtensions on String {
  validateEmail() {
    var regExp = RegExp(emailPattern);
    if (isEmpty) {
      return 'Email is required';
    } else if (!regExp.hasMatch(this)) {
      return 'Invalid email';
    } else {
      return null;
    }
  }

  String? validateConfirmPassword(String v, String password) {
    if (v.isEmpty || password.isEmpty) {
      return 'Confrim password must be at least 6 characters';
    } else if (v.length < 6 || password.length < 6 || v != password) {
      return 'Password not match';
    } else {
      return null;
    }
  }

  validatePassword() {
    if (isEmpty) {
      return 'Password is required';
    } else if (length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  validateMobile() {
    var regExp = RegExp(mobilePattern);
    if (replaceAll(" ", "").isEmpty) {
      return 'Mobile is required';
    } else if (replaceAll(" ", "").length != 10) {
      return 'Mobile number must 10 digits';
    } else if (!regExp.hasMatch(replaceAll(" ", ""))) {
      return 'Mobile number must be digits';
    }
    return null;
  }

  String? birthdayValidation() {
    if (isEmpty) {
      return 'Please enter Date';
    }
    return null;
  }

  String? addressValidation() {
    if (isEmpty) {
      return 'Please enter Address';
    }
    return null;
  }

  String? eductionValidation() {
    if (isEmpty) {
      return 'Please enter eduction';
    }
    return null;
  }

  String? instaValidation() {
    if (isEmpty) {
      return 'Please enter Instagram';
    }
    return null;
  }

  String? faceboookValidation() {
    if (isEmpty) {
      return 'Please enter Facebook';
    }
    return null;
  }

  String? firstNameValidation() {
    if (isEmpty) {
      return 'Please enter First Name';
    }
    return null;
  }

  String? lastNameValidation() {
    if (isEmpty) {
      return 'Please enter Last Name';
    }
    return null;
  }

  String? validatePinCode() {
    if (isEmpty) {
      return 'Pin code is required';
    } else if (length < 6) {
      return 'Pin code must be 6 characters';
    }
    return null;
  }

  String? emergencyName1Validation() {
    if (isEmpty) {
      return 'Please enter  Name';
    }
    return null;
  }

  String? emergencyNumber1Validation() {
    if (isEmpty) {
      return 'Please enter  Number';
    }
    return null;
  }
}

extension WidgetExtensions on Widget {
  circleProgressIndicator() => Container(
      alignment: FractionalOffset.center,
      child: const CircularProgressIndicator(strokeWidth: 1));

  myText(
          { required String title,
          Color textColor = Colors.white,
          FontWeight fontWeight = FontWeight.normal,
          double titleSize = 18}) =>
      Text(
        title,
        style: TextStyle(
            color: textColor, fontSize: titleSize, fontWeight: fontWeight),
      );

  inputField({
     ValueChanged<String>? onChanged,
    TextEditingController? controller,
    double? height,
    double? width,
    int? maxLength,
    TextInputType? keyboardType,
    String? hintText,
    String? labelText,
    int maxLines = 1,
    bool obscureText = false,
    InkWell? inkWell,
    FormFieldValidator<String>? validation,
    bool? editable,
    bool readonly = false,
   
  }) =>
      Padding(
        padding: const EdgeInsets.only(top:5,bottom: 2),
        child: TextFormField(
          readOnly: readonly,
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          maxLength: maxLength,
          // style: TextStyle(color: loginBox),
          maxLines: maxLines,
          onChanged: onChanged,
          enabled: editable,
          decoration: InputDecoration(
            counterText: "",
            border: InputBorder.none,
            // hintStyle: TextStyle(color: textGreyColor,fontFamily:regularItalicFont),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(25.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(25.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(25.0),
            ),
            enabledBorder:OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(25.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(25.0),
            ),
            fillColor: Colors.white,
            hintText: hintText,
            suffixIcon: Padding(
              padding: const EdgeInsets.all(7.0),
              child: inkWell,
            ),
          ),
          validator: validation,
        ),
      );
}

var emailPattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
var mobilePattern = r'(^[0-9]*$)';