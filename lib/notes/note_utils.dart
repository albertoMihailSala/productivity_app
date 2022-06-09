import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//ignore_for_file: prefer_const_constructors

class NoteUtils {
  //MESSAGES - Edited Note / Deleted Note
  static void showSnackBar(BuildContext context, String text) =>
      ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text)));

  //JSON FOR DATETIME
  static DateTime fromJsonToDateTime(Timestamp value){
    return value.toDate();
  }

  static dynamic fromDateTimeToJson(DateTime date){
    return date.toUtc();
  }
}