


import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:rare_view_projects/View/roundedd_button.dart';
import '../Resource/constant.dart';
import '../View Model/view_model_signup.dart';

class RegistrationScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel =ref. watch(signupScreenViewModelProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: viewModel.showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  viewModel.email = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(height: 8.0),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  viewModel.password = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your password.'),
              ),
              SizedBox(height: 24.0),
              RoundedButton(
                colour: Colors.blueAccent,
                title: 'Register',
                onPressed: () => viewModel.registerUser(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
