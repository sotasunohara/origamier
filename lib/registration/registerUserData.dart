import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:origamiers/auth/auth.dart';
import 'package:origamiers/sharedPreference/sharedPref.dart';

Future<bool> registerUserName(String userName) async {
  String userId = await SharedPref.getStringData(Keys.userId);
  // Firebase にないか確かめる

  QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance.collection('Users').get();
    // Firebase にあればエラー
    debugPrint("ok");
    List<QueryDocumentSnapshot<Map<String, dynamic>>> docs = querySnapshot.docs;
    bool isUserNameExisted = false;

    // Users コレクションの中身が存在する場合は userName がすでに存在するか確認
    if(docs.isNotEmpty) {
      for (QueryDocumentSnapshot<Map<String, dynamic>> doc in docs) {
        if(doc.exists) {
          if(doc.data()['userName'] == userName) {
            isUserNameExisted = true;
            break;
          }
        }
      }
    }
    if(isUserNameExisted) {
      debugPrint("同じユーザー名は存在します。");
      return false;
    }else {
      debugPrint("同じユーザー名は存在しない");
      // SharedPreference に登録
      SharedPref.saveStringData(Keys.userName, userName);
      DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore.instance.collection('Users').doc(userId).get();
      // userId がすでに存在する場合
      if(doc.exists) {
        // データをFirestore に更新
        await FirebaseFirestore.instance.collection('Users').doc(userId).set(
          {
            "userName": userName,
            "comment": doc.data()!['comment'],
            "userIcon": doc.data()!['userIcon']
          }
        );
        debugPrint("追加成功");
      } else {
        debugPrint("新規");
        // 新規のユーザの場合
        await FirebaseFirestore.instance.collection('Users').doc(userId).set(
          {
            "userName": userName,
            "comment": "",
            "userIcon": ""
          }
        );
        debugPrint("追加成功");
      }
      return true;
    }
}