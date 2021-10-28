import 'package:flutter/material.dart';

class RegisterProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> registerApp(
      BuildContext context, String username, String password) async {
    _isLoading = true;
    // var tokenUser = notifyListeners();
  }
}
