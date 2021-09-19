import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSiginController with ChangeNotifier {
  var _googleSigin = GoogleSignIn();
  GoogleSignInAccount? googleAccount;

  signin() async {
    this.googleAccount = await _googleSigin.signIn();
    print(googleAccount);
    notifyListeners();
  }

  signout() async {
    this.googleAccount = await _googleSigin.signOut();
    notifyListeners();
  }
}
