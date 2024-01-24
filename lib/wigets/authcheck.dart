import 'package:contakt/pages/home_page.dart';
import 'package:contakt/pages/signin_page.dart';
import 'package:contakt/pages/splashscreen.dart';
import 'package:contakt/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);
    if (auth.isLoading) {
      return const SplasshScreen();
    } else if (auth.user == null) {
      return const SigninPage();
    } else {
      return HomePage();
    }
  }
}
