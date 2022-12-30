import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:origamiers/library/colors.dart';
import 'package:origamiers/library/widget.dart';
import 'package:origamiers/pages/auth_pages/signup_page.dart';
import 'package:origamiers/auth/auth.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override 
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child:SingleChildScrollView(
          child: Column(
            children:[
              const Text("Origamier"),
              const Text("Log In"),
              form("e-mail", _emailController),
              form("password", _passwordController, isPassword: true),
              TextButton(
                onPressed: () async{
                  await Auth().logIn(_emailController.text, _passwordController.text);
                }, 
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(color: Colors.blue)
                    ]
                  ),child: Text("Log In", style: TextStyle(color: Colors.white),),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return SignupPage();
                    },),
                  );
                }, 
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(color: Colors.blue)
                    ]
                  ),child: Text("アカウントを作成する。", style: TextStyle(color: Colors.white),),
                ),
              ),
          ]),
        ),
      ),
    );
  }
}