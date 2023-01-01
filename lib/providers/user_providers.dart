import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:origamiers/model/userProfile.dart';
import 'package:origamiers/sharedPreference/sharedPref.dart';

StateProvider<String> userIdProvider = StateProvider(((ref) => SharedPref.getStringData(Keys.userId)));

// アカウントのプロバイダ
FutureProvider<UserProfile> userProvider = FutureProvider(((ref) async {
  // userId を取得
  String userId = ref.watch(userIdProvider);

  // ユーザデータを取得
  DocumentSnapshot<Map<String, dynamic>> userDataSnapshot = await FirebaseFirestore.instance.collection('Users').doc(userId).get();
  if(!userDataSnapshot.exists) {
    debugPrint("ユーザなし");
    throw Exception("user not found");
  }
  Map<String, dynamic> userData = userDataSnapshot.data()!;
  debugPrint(userData.toString());
  return UserProfile(
    userId: userId,
    userName: userData['userName'],
    icon: userData['userIcon'],
    comment: userData['comment']
  );
})); 

