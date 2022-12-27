import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> signUp(email, password) async{
  try{
    final UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
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

Future<void> logIn(email, password) async{
  try{
    final UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
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