import 'package:flutter/material.dart';
//ignore_for_file: prefer_const_constructors

class NoteUtils {
  static void showSnackBar(BuildContext context, String text) =>
      Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text)));
}