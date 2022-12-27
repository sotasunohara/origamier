import 'package:flutter/material.dart';

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
