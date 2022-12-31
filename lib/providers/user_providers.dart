import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:origamiers/model/userProfile.dart';
import 'package:origamiers/sharedPreference/sharedPref.dart';

StateProvider<String> userIdProvider = StateProvider(((ref) => ""));

FutureProvider<UserProfile> userProvider = FutureProvider(((ref) async {
  // sharedpreference から userId を取得
  String userId = await SharedPref.getStringData(Keys.userId);

  // ユーザデータを取得
  DocumentSnapshot<Map<String, dynamic>> userDataSnapshot = await FirebaseFirestore.instance.collection('Users').doc(userId).get();
  if(!userDataSnapshot.exists) {
    throw Exception("user not found");
  }
  Map<String, dynamic> userData = userDataSnapshot.data()!;

  return UserProfile(
    userId: userId,
    userName: userData['userName'],
    icon: userData['icon'],
    comment: userData['comment']
  );
})); 