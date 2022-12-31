import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:origamiers/library/colors.dart';
import 'package:origamiers/sharedPreference/sharedPref.dart';

enum MainPages{
  timeline,
  profile
}

// 画面の状態のプロバイダ
final mainPageProvider = StateProvider((ref) => MainPages.timeline,);

class MainPage extends ConsumerWidget {
  MainPage({Key? key}) : super(key: key);
  late WidgetRef _ref;
  late MainPages _currentPage;
  @override 
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;
    // 現在表示させるページを取得
    _currentPage = ref.watch(mainPageProvider);

    return Scaffold(
      backgroundColor: backgroundColor, 
      body: SafeArea(
        child: Container(
          child: Text("ようこそ"),
        ),
      ),
      bottomNavigationBar: _bottomBar(),
    );
  }
  Widget _bottomBar() {
    return BottomAppBar(
      child: Row(
        children:[
          Spacer(),
          _bottomBarItem(
            MainPages.timeline, 
            Icon(Icons.home, size: 30,)
          ),
          Spacer(),
          SizedBox(width: 40,),
          Spacer(),
          _bottomBarItem(
            MainPages.profile, 
            Icon(Icons.person, size: 30),
          ),
          Spacer(),
        ]
      )
    );
  }
  Widget _bottomBarItem(
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
}