import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:furniture/Auth/login_page.dart';
import 'package:furniture/firebase_options.dart';
import 'package:furniture/pages/homePage.dart';
import 'package:furniture/features/user_auth/presentation/pages/login_page.dart';
import 'package:furniture/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:furniture/pages/cart_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        title: 'Furniture Shop ',
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.idTokenChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              if (snapshot.hasData) {
                return const HomePage();
              }
              if (snapshot.hasError) {
                return const Text("Some error occured");
              }
              // return SignInNine();
              return LoginPage();
            }
          },
        ),
        routes: {
          "/login": (context) => LoginPage(),
          "/register": (context) => const SignUpPage(),
          "/home": (context) => const HomePage(),
          "/bookMark": (context) => const CartPage(),
        },

      ),
    );
  }
}
