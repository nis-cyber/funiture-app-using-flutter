import 'package:flutter/material.dart';
import 'package:furniture/features/user_auth/presentation/pages/login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key, required LoginPage child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("splash screen"),
    );
  }
}
