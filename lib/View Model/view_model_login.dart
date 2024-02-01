import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:riverpod/riverpod.dart';

final loginScreenViewModelProvider = ChangeNotifierProvider((ref) => LoginScreenViewModel());

class LoginScreenViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showSpinner = false;

  Future<void> loginUser(BuildContext context) async {
    showSpinner = true;
    notifyListeners();

    try {
      final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (user != null) {
        Navigator.pushNamed(context, 'home_screen');
      }
    } catch (e) {
      print(e);
    }

    showSpinner = false;
    notifyListeners();
  }
}
