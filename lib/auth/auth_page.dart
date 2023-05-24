import 'package:employees_db/auth/register_page.dart';
import 'package:employees_db/screens/login_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {


  bool _showLoginPage = true;
  
  void toggleScreens() {
    setState(() {
      _showLoginPage = !_showLoginPage;
    });

  }
  @override
  Widget build(BuildContext context) {
    if(_showLoginPage) {
      return LoginPage(showRegisterPage: toggleScreens);
    }
    return RegisterPage(showLoginPage: toggleScreens);
  }
}
