import 'package:flutter/material.dart';
//ignore_for_file: prefer_const_constructors

class TodoFormWidget extends StatelessWidget {
  final String title;
  final ValueChanged<String> onChangedTitle;
  final VoidCallback onSavedTodo;

  //CONSTRUCTOR
  const TodoFormWidget({
    Key? key,
    this.title = '',
    required this.onChangedTitle,
    required this. onSavedTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
    //mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      buildTitle(),
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

  Widget buildSaveButton() => SizedBox(
    //ALOWS SAVE BUTTON TO TAKE THE WHOLE WIDTH
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onSavedTodo,
      child: Text(
          'Save',
          textAlign: TextAlign.center
      ),
    ),
  );
}
