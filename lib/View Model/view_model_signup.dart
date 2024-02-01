import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final signupScreenViewModelProvider = ChangeNotifierProvider((ref) => SignupScreenViewModel());

class SignupScreenViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showSpinner = false;

  Future<void> registerUser(BuildContext context) async {
    showSpinner = true;
    notifyListeners();

    try {
      final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if (newUser != null) {
        Navigator.pushNamed(context, 'home_screen');
      }
    } catch (e) {
      print(e);
    }

    showSpinner = false;
    notifyListeners();
  }
}
