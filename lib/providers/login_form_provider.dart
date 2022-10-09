import 'package:flutter/material.dart';

class LoginFormProvider with ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  bool isPasswordVisible = true;

  bool get showPassword => isPasswordVisible;
  set showPassword(bool value) {
    isPasswordVisible = value;
    notifyListeners();
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print('$formKey ${formKey.currentState?.validate()}');
    print("$email $password");
    return formKey.currentState?.validate() ?? false;
  }
}
