import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:origamiers/auth/auth.dart';
import 'package:origamiers/library/colors.dart';
import 'package:origamiers/library/widget.dart';
import 'package:origamiers/pages/auth_pages/login_page.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({Key? key}) : super(key: key);
  @override 
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  final TextEditingController _userNameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _secondPasswordController = new TextEditingController();


  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child:SingleChildScrollView(
          child: Column(
            children:[
              const Text("Origamier"),
              const Text("Sign Up"),
              form("e-mail", _emailController),
              form("password", _passwordController, isPassword: true),
              form("repeat password", _secondPasswordController, isPassword: true),
              TextButton(
                onPressed: () async {
                  debugPrint(_emailController.text);
                  // signup
                  Auth().signUp(_emailController.text, _passwordController.text, context);
                }, 
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(color: Colors.red)
                    ]
                  ),child: Text("Sign Up", style: TextStyle(color: Colors.white)),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: ((context) {
                      return LoginPage();
                    }))
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(color: Colors.red)
                    ]
                  ),child: Text("アカウントを作成済みの方はこちら", style: TextStyle(color: Colors.white)),
                ),),
          ]),
        ),
      ),
    );
  }
}