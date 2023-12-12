import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  String email = '';
  String password = '';
  String confirmPassword = '';
  String name = '';
  String lastName = '';
  String team = '';
  bool showPassword = false;

  void setPassword(String str) {
    password = str;
    notifyListeners();
  }

  void showFalse() {
    showPassword = false;
    notifyListeners();
  }

  void handleShowPassword() {
    showPassword = !showPassword;
    notifyListeners();
  }

  void setConfirmPassword(String str) {
    confirmPassword = str;
    notifyListeners();
  }

  void setName(String str) {
    name = str;
    notifyListeners();
  }

  void setLastName(String str) {
    lastName = str;
    notifyListeners();
  }

  void setEmail(String str) {
    email = str;
    notifyListeners();
  }

  void setTeam(String str) {
    team = str;
    notifyListeners();
  }
}
