import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:origamiers/auth/auth.dart';
import 'package:origamiers/library/colors.dart';
import 'package:origamiers/library/widget.dart';
import 'package:origamiers/registration/registerUserData.dart';

class RegisterUserNamePage extends ConsumerWidget {
  RegisterUserNamePage({Key? key}): super(key: key);

  String _userName = "";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child:Column(
            children: [
              Text("ユーザー名を登録してください。"),
              Container(
                height: 44,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  onChanged: (value) {
                    _userName = value;
                  },
                  decoration: InputDecoration(hintText: "ユーザー名"),
                )
              ),
              TextButton(
                onPressed: () {
                  // 登録処理をする
                  // ユーザ名の被りが無いようにする
                  registerUserName(_userName);
                }, 
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: Text("登録"),
                )
              )
            ]
          )
        ),
      ),
    );
  }
}