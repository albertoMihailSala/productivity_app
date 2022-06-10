import 'package:flutter/material.dart';
//ignore_for_file: prefer_const_constructors

class TaskFormWidget extends StatelessWidget {
  final String title;
  final String? priority;
  final String? category;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String?> onChangedPriority;
  final ValueChanged<String?> onChangedCategory;
  final VoidCallback onSavedTask;

  const TaskFormWidget({
    Key? key,
    this.title = '',
    this.priority = 'High',
    this.category ='Personal',
    required this.onChangedTitle,
    required this.onChangedPriority,
    required this.onChangedCategory,
    required this. onSavedTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      buildTitle(),
      SizedBox(height: 20),
      buildPriority(),
      SizedBox(height: 20),
      buildCategory(),
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
    //maxLines: 1,

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

  Widget buildPriority() => DropdownButton(
      value: priority,
      items: <String>['High', 'Medium', 'Low']
              .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                );
      }).toList(),
      onChanged: onChangedPriority);

  Widget buildCategory() => DropdownButton(
      value: category,
      items: <String>['Personal', 'Work', 'Other']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChangedCategory);

  Widget buildSaveButton() => SizedBox(
    //ALOWS SAVE BUTTON TO TAKE THE WHOLE WIDTH
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onSavedTask,
      child: Text(
          'Save',
          textAlign: TextAlign.center
      ),
    ),
  );
}
