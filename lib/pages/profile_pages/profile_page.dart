import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:origamiers/library/colors.dart';
import 'package:origamiers/model/userProfile.dart';
import 'package:origamiers/pages/main_pages/main_page.dart';
import 'package:origamiers/providers/user_providers.dart';
import 'package:origamiers/library/widget.dart';
import 'package:origamiers/sharedPreference/sharedPref.dart';

class ProfilePage extends ConsumerWidget {
  late WidgetRef _ref;
  late UserProfile userProfile;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

    AsyncValue<UserProfile> user = _ref.watch(userProvider);

    return user.when(
      loading: () => Container(child: Text("読み込み中")),
      error:(error, stackTrace) => Text("エラー発生 $error",),
      data:(data) {
        userProfile = data;
        return SafeArea(
          child:Scaffold(
            appBar: _appBar(context, userProfile, _ref),
            body: Container(),
            bottomNavigationBar: bottomBar(),
            ),
          );
      },
    );
  }
  
  PreferredSize _appBar(BuildContext _context, UserProfile userProfile, WidgetRef _ref) {
    String uId = SharedPref.getStringData(Keys.userId);
    // 編集できないようにする
    if(uId != userProfile.userId) {
      return PreferredSize(
        child: Column(
          children: [
            SizedBox(height: 5,),
            Row(
              children: [
                SizedBox(height: 5),
                _profileNamePlate(_context, userProfile, _ref)
              ],),
            SizedBox(height: 5,),
            Row(
              children: [
                SizedBox(height: 5),
                Text(userProfile.comment),
                SizedBox(height: 5),
              ]
            ),
            
          ],
        ),
        preferredSize: Size(MediaQuery.of(_context).size.height, 160),
      );
    }else {
      return PreferredSize(
        child: Column(
          children: [
            SizedBox(height: 5,),
            Row(
              children: [
                SizedBox(height: 5),
                _profileNamePlate(_context, userProfile, _ref)
              ],),
            SizedBox(height: 5,),
            Row(
              children: [
                SizedBox(height: 5),
                Text(userProfile.comment),
                SizedBox(height: 5),
              ]
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                child: Text("編集する", style: TextStyle(color:Color.fromRGBO(232, 10, 10, 1.0), fontSize: 12 ) ,),
                onPressed: () {},
              ),
            ),
            
          ],
        ),
        preferredSize: Size(MediaQuery.of(_context).size.height, 160),
      );
    }

  }

  Widget _profileNamePlate(BuildContext _context, UserProfile userProfile, WidgetRef _ref) {
    return GestureDetector(
      child: Row(
        children: [
          profileIcon(
            userProfile,
            50,
            _context,
            _ref
          ),
          SizedBox(width: 5,),
          Text(userProfile.userName, style: TextStyle(color: userNameTagColor, fontSize: 20),)
        ]
      )
    );
  }
  
  
}