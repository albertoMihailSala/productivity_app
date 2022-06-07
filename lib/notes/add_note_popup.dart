import 'package:flutter/material.dart';
import 'note_form_widget.dart';
import 'note_class.dart';
import 'package:provider/provider.dart';
import 'package:productivity_app/provider/note_provider.dart';
//ignore_for_file: prefer_const_constructors

class AddNotePopup extends StatefulWidget {
  //const AddNotePopup({Key? key}) : super(key: key);

  @override
  State<AddNotePopup> createState() => _AddNotePopupState();
}

class _AddNotePopupState extends State<AddNotePopup> {
  //GLOBAL KEY TO VALIDATE TITLE
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
    content: Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
              'New Note',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
          ),
          NoteFormWidget(
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDescription: (description) => setState(() => this.description = description),
            onSavedNote: addNote,
          ),
        ],
      ),
    ),
  );

  void addNote() {
    final isValid = _formKey.currentState!.validate();

    if(!isValid){
      return;
    }
    else {
      final newNote = Note(
        id: DateTime.now().toString(),
        title: title,
        description: description,
      );
      final provider = Provider.of<NoteProvider>(context, listen: false);
      provider.addNote(newNote);
      //HIDE ALERT DIALOG
      Navigator.of(context).pop();
    }
  }
}
