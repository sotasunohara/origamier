import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:origamiers/library/colors.dart';
import 'package:origamiers/model/userProfile.dart';
import 'package:origamiers/pages/profile_pages/profile_page.dart';
import 'package:origamiers/pages/submition_pages/selectPhotos_page.dart';
import 'package:origamiers/providers/user_providers.dart';
import 'package:origamiers/sharedPreference/sharedPref.dart';

enum MainPages{
  timeline,
  profile
}

// 画面の状態のプロバイダ
final mainPageProvider = StateProvider((ref) => MainPages.timeline,);
  
late WidgetRef _ref;

class MainPage extends ConsumerWidget {
  MainPage({Key? key}) : super(key: key);

  late MainPages _currentPage;
  @override 
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;
    // 現在表示させるページを取得
    _currentPage = ref.watch(mainPageProvider);
    debugPrint(ref.watch(userIdProvider));
    return Scaffold(
      backgroundColor: backgroundColor, 
      body: SafeArea(
        child: switchPage(_currentPage.index),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 投稿する
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
            return SelectPhotosPage();
          }));
        },
      ),
    );
  }

  Widget switchPage(int index) {
    return IndexedStack(
      index: index,
      children: [
        ProfilePage(),
        ProfilePage()
      ],
    );
  }

}


  Widget bottomBar() {
    return BottomAppBar(
      child: Row(
        children:[
          Spacer(),
          bottomBarItem(
            MainPages.timeline, 
            Icon(Icons.home, size: 30,)
          ),
          Spacer(),
          SizedBox(width: 40,),
          Spacer(),
          bottomBarItem(
            MainPages.profile, 
            Icon(Icons.person, size: 30),
          ),
          Spacer(),
        ]
      )
    );
  }
  Widget bottomBarItem(
    MainPages page,
    Widget icon
  ) {
    return IconButton(
      onPressed: () {
        // ページの状態を変更
      _ref.read(mainPageProvider.notifier).state = page;
    }, icon: icon
    );
  }