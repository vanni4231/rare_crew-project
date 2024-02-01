// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:rare_view_projects/View/roundedd_button.dart';
//
//
// //code for designing the UI of our text field where the user writes his email id or password
//
// const kTextFieldDecoration = InputDecoration(
//     hintText: 'Enter a value',
//     hintStyle: TextStyle(color: Colors.grey),
//     contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.all(Radius.circular(32.0)),
//     ),
//     enabledBorder: OutlineInputBorder(
//       borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
//       borderRadius: BorderRadius.all(Radius.circular(32.0)),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
//       borderRadius: BorderRadius.all(Radius.circular(32.0)),
//     ));
//
// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// final _auth = FirebaseAuth.instance;
//
// class _LoginScreenState extends State<LoginScreen> {
//   late String email;
//   late String password;
//   bool showSpinner = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: ModalProgressHUD(
//         inAsyncCall: showSpinner,
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               TextField(
//                   keyboardType: TextInputType.emailAddress,
//                   textAlign: TextAlign.center,
//                   onChanged: (value) {
//                     email = value;
//                     //Do something with the user input.
//                   },
//                   decoration: kTextFieldDecoration.copyWith(
//                     hintText: 'Enter your email',
//                   )),
//               SizedBox(
//                 height: 8.0,
//               ),
//               TextField(
//                   obscureText: true,
//                   textAlign: TextAlign.center,
//                   onChanged: (value) {
//                     password = value;
//                     //Do something with the user input.
//                   },
//                   decoration: kTextFieldDecoration.copyWith(
//                       hintText: 'Enter your password.')),
//               SizedBox(
//                 height: 24.0,
//               ),
//               RoundedButton(
//                   colour: Colors.lightBlueAccent,
//                   title: 'Log In',
//                   onPressed: () async {
//                     setState(() {
//                       showSpinner = true;
//                     });
//                     try {
//                       final user = await _auth.signInWithEmailAndPassword(
//                           email: email, password: password);
//                       if (user != null) {
//                         Navigator.pushNamed(context, 'home_screen');
//                       }
//                     } catch (e) {
//                       print(e);
//                     }
//                     setState(() {
//                       showSpinner = false;
//                     });
//                   }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:riverpod/riverpod.dart';
import 'package:rare_view_projects/View/roundedd_button.dart';
import '../Resource/constant.dart';
import '../View Model/view_model_login.dart';

class LoginScreen extends ConsumerWidget {
  final myProvider = Provider((watch) => 'Hello, Riverpod!');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(loginScreenViewModelProvider);

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
                colour: Colors.lightBlueAccent,
                title: 'Log In',
                onPressed: () => viewModel.loginUser(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
