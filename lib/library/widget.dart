import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:origamiers/model/userProfile.dart';
import 'package:origamiers/pages/profile_pages/profile_page.dart';
import 'package:origamiers/providers/user_providers.dart';

Widget form(String hintText, TextEditingController _controller, {bool isPassword = false, void Function(String)? onChanged}) {
  return Container(
    height: 44,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      /*boxShadow: [
        BoxShadow(color: Colors.grey.withOpacity(0.5))
      ]*/
    ),
    child: Align(
      alignment: Alignment.center,
      child: TextField(
        obscureText: isPassword,
        controller: _controller,
        onChanged: onChanged,
        decoration: InputDecoration(hintText: hintText)
      )
    )
  );
}

Widget _profileIcon(
  UserProfile user,
  double size,
  BuildContext context,
  WidgetRef _ref
) {
  return ClipOval(
    child: GestureDetector(
      child: Image.network(user.icon, width: size, height: size),
      onTap: () {
        //_ref.read(userProvider)
        Navigator.of(context).push(
          MaterialPageRoute(
            builder:(context) => ProfilePage(),
          ),
        );
      },
    )
  );
}