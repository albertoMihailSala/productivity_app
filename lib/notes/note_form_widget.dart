import 'package:flutter/material.dart';
//ignore_for_file: prefer_const_constructors

class NoteFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedNote;

  //CONSTRUCTOR
  const NoteFormWidget({
    Key? key,
    this.title = '',
    this.description = '',
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this. onSavedNote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
    //mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      buildTitle(),
      SizedBox(height: 20),
      buildDescription(),
      SizedBox(height: 20),
      buildSaveButton(),
    ],
  );

  Widget buildTitle() => TextFormField(
    //TITLE FIELD ALWAYS STARTS EMPTY
    initialValue: title,
    //GIVING THE TITLE THE CHARACTERS
    onChanged: onChangedTitle,

    //MAXIMUM LINES ALLOWED
    maxLines: 1,

    //TITLE CAN'T BE EMPTY
    validator: (title){
      if(title!.isEmpty){
        return 'Title cannot be empty';
      }
      return null;
    },

    decoration: InputDecoration(
        labelText: 'TITLE'),
  );

  Widget buildDescription() => TextFormField(
    //TITLE FIELD ALWAYS STARTS EMPTY
    initialValue: description,
    //GIVING THE TITLE THE CHARACTERS
    onChanged: onChangedDescription,

    //MAXIMUM LINES ALLOWED
    maxLines: 4,

    decoration: InputDecoration(
        labelText: 'DESCRIPTION'),
  );

  Widget buildSaveButton() => SizedBox(
    //ALOWS SAVE BUTTON TO TAKE THE WHOLE WIDTH
    width: double.infinity,
    child: ElevatedButton(
              onPressed: onSavedNote,
              child: Text(
                        'Save',
                        textAlign: TextAlign.center
                         ),
            ),
  );
}
