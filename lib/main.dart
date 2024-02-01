// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'View/home_screen.dart';
// import 'View/login_screen.dart';
// import 'View/signup_screen.dart';
// import 'View/welcome_screen.dart';
//
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   try {
//     await Firebase.initializeApp();
//     runApp(MyApp());
//   } catch (e) {
//     print('Firebase initialization error: $e');
//   }
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//
//     return MaterialApp(
//       initialRoute: 'welcome_screen',
//       routes: {
//         'welcome_screen': (context) => WelcomeScreen(),
//         'registration_screen': (context) => RegistrationScreen(),
//         'login_screen': (context) => LoginScreen(),
//         'home_screen': (context) => HomeScreen()
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'View/home_screen.dart';
import 'View/login_screen.dart';
import 'View/signup_screen.dart';
import 'View/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'welcome_screen',
      routes: {
        'welcome_screen': (context) => WelcomeScreen(),
        'registration_screen': (context) => RegistrationScreen(),
        'login_screen': (context) => LoginScreen(),
        'home_screen': (context) => HomeScreen(),
      },
    );
  }
}
