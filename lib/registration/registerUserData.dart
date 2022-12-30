import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:origamiers/auth/auth.dart';
import 'package:origamiers/model/users.dart';

Future<void> registerUserName(String userName) async {
  // Firebase にないか確かめる

  QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance.collection('Users').get();
    // Firebase にあればエラー
    debugPrint("ok");
    List<QueryDocumentSnapshot<Map<String, dynamic>>> docs = querySnapshot.docs;
    bool isUserNameExisted = false;
    if(docs.isNotEmpty) {
      for (QueryDocumentSnapshot<Map<String, dynamic>> doc in docs) {
        if(doc.exists) {
          Users u = Users.fromFirestore(doc, null);
          if(u.userName == userName) {
            isUserNameExisted = true;
            break;
          }
        }
      }
    }
    // Firebase になければ登録する
    if(docs.isEmpty || !isUserNameExisted) {
      Auth auth = Auth();
      Users u = Users(
        userName: userName,
        userIcon: "",
        comment: "",
        artworks: [],
      );
      await FirebaseFirestore.instance.collection('Users').doc(auth.userId).set(u.toFirestore());
      debugPrint("追加成功");
    }else {
      debugPrint("そのユーザー名は登録済みです。");
    }
}