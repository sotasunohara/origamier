import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:origamiers/pages/auth_pages/signup_page.dart';
import 'package:origamiers/pages/main_pages/main_page.dart';
import 'package:origamiers/sharedPreference/sharedPref.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(
      child:MaterialApp(
        title: 'Origamier',
        home: OrigamierApp()
      ),
    ),
  );
}

class OrigamierApp extends ConsumerStatefulWidget {
  const OrigamierApp({Key? key}): super(key: key);

  @override 
  ConsumerState<OrigamierApp> createState() => _OrigamierAppState();
}

class _OrigamierAppState extends ConsumerState<OrigamierApp> {
  // 初期化処理
  @override 
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: SharedPref.getStringData(Keys.userId).asStream(),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          if(snapshot.data == null || snapshot.data == "") {
            return const SignupPage();
          }else {
            return MainPage();
          }
        } else {
          return Container(child: Text("エラー"));
        }
      },
    );
  }
}

