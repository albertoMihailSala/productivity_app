import 'package:flutter/material.dart';
//ignore_for_file: prefer_const_constructors

class NoteDetail extends StatefulWidget {
  //const NoteDetail({Key? key}) : super(key: key);

  @override
  State<NoteDetail> createState() => _NoteDetailState();
}

//Editing the note
class _NoteDetailState extends State<NoteDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note Details'),
      ),

      body: Center(
        child: ListView(

        ),
      )
    );
  }
}
