import 'package:flutter/material.dart';
//ignore_for_file: prefer_const_constructors

class NoteUtils {
  //MESSAGES - Edited Note / Deleted Note
  static void showSnackBar(BuildContext context, String text) =>
      ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text)));
}