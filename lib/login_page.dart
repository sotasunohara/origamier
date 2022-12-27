import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:origamiers/library/colors.dart';
import 'package:origamiers/library/widget.dart';

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
                onPressed: () {

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
          ]),
        ),
      ),
    );
  }
}