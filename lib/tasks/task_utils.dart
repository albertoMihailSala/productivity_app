import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'task_class.dart';
import 'package:provider/provider.dart';
import 'package:productivity_app/provider/task_provider.dart';

class TaskUtils {
  //MESSAGES - Updated Task / Removed Task
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