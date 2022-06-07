import 'package:flutter/material.dart';
import 'package:productivity_app/notes/note_form_widget.dart';
import 'note_class.dart';
import 'note_form_widget.dart';
import 'package:provider/provider.dart';
import 'package:productivity_app/provider/note_provider.dart';
//ignore_for_file: prefer_const_constructors

class EditNotePage extends StatefulWidget {
  final Note note;

  const EditNotePage({
    Key? key,
    required this.note
  }) : super(key: key);

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  String title ='';
  String description = '';

  final _formKey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
    //TAKE THE CURRENT TITLE & DESCRIPTION
    title = widget.note.title;
    description = widget.note.description;
  }

  @override
  Widget build(BuildContext context) => Scaffold (
    appBar: AppBar(
      title: Text('Edit note'),
    ),
    body: Padding(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: NoteFormWidget(
          title: title,
          description: description,
          onChangedTitle: (title) => setState(() => this.title = title),
          onChangedDescription: (description) =>
            setState(() => this.description = description),
          onSavedNote: saveEditedNote,
        ),
      ),
    ),
  );

  void saveEditedNote() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid){
      return;
    }
    else {
      final provider = Provider.of<NoteProvider>(context, listen: false);

      provider.updateNote(widget.note, title, description);
      //EXIT EDIT PAGE AFTER UPDATE
      Navigator.of(context).pop();
    }
  }
}
