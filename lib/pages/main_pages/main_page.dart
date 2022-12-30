import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:origamiers/library/colors.dart';
import 'package:origamiers/sharedPreference/sharedPref.dart';

class MainPage extends ConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: backgroundColor, 
      body: SafeArea(
        child: Container(
          child: Text("ようこそ"),
        ),
      ),
    );
  }
}