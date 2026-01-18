import 'package:banking_app/firebase_options.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'auth_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'qr_payment.dart';

//  1. App entry point
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking APP',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
      debugShowCheckedModeBanner: false,
      home: const AuthWrapper(),

      // Add named routes here
      routes: {
        '/home': (context) => const MyHomePage(),
        '/qr_payment': (context) => const QrPaymentPage(),
      },
    );
  }
}

// Wrapper to handel authentication stage
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Show loading indicator while checking auth state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // if user is logged in, show home screen
        if (snapshot.hasData && snapshot.data != null) {
          return const MyHomePage();
        }

        // if user is not logged in, show home screen
        return const AuthScreen();
      },
    );
  }
}
