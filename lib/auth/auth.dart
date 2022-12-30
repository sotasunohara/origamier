import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:origamiers/library/otherMethods.dart';
import 'package:origamiers/pages/auth_pages/login_page.dart';
import 'package:origamiers/pages/main_pages/main_page.dart';
import 'package:origamiers/pages/registration_pages/register_userName.dart';
import 'package:origamiers/providers/user_providers.dart';
import 'package:origamiers/registration/registerUserData.dart';
import 'package:origamiers/sharedPreference/sharedPref.dart';

// Singleton にする
class Auth {
  late UserCredential _credential;
  String userId = "";
  bool isLogedIn = false;

  // サインアップする
  Future<void> signUp(String email, String password, BuildContext context) async{
    try{
      debugPrint("signUp");
      // credential にユーザIDが渡される
      _credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      debugPrint("登録成功");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) {
          return LoginPage();
        },),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');

      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } 
    catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> logIn(email, password, BuildContext context) async{
    try{
      _credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      debugPrint("ログイン");
      // sharedpreference でローカルにcredential情報を保存
      SharedPref.saveStringData(Keys.userId, _credential.user!.uid);
      SharedPref.saveStringData(Keys.email, _credential.user!.email!);
      // ユーザー名の初期値はランダムな値
      bool result = await registerUserName(generateCode(10));
      if(!result) {
        debugPrint("ユーザー名の登録失敗");
      }
      
      
      // メイン画面へ遷移
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: ((context) {
            return MainPage();
          }),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
    } 
    catch (e) {
      debugPrint(e.toString());
    }
  }
}
