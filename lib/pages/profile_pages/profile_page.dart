import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:origamiers/model/userProfile.dart';
import 'package:origamiers/providers/user_providers.dart';

class ProfilePage extends ConsumerWidget {
  late WidgetRef _ref;
  late UserProfile userProfile;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

    return FutureBuilder(
      future: _ref.read(userProvider.future),
      builder: ((BuildContext context, AsyncSnapshot<UserProfile> snapshot) {
        if(snapshot.hasData) {
          userProfile = snapshot.data!;
          return Scaffold(
          appBar: _appBar(context, userProfile),
          body: Container(),
        );
        }else {
          return Scaffold(body: Container());
        }

      }
      ));

  }
  
  PreferredSize _appBar(BuildContext context, UserProfile userProfile) {
    return PreferredSize(
      child: Column(
        children: [
          SizedBox(width: 100,),
          
        ],
      ),
      preferredSize: Size(MediaQuery.of(context).size.width, 60),
    );
  }
}