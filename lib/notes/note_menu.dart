import 'package:flutter/material.dart';
//ignore_for_file: prefer_const_constructors

class NoteMenu extends StatefulWidget {
  //const NoteMenu({Key? key}) : super(key: key);

  @override
  State<NoteMenu> createState() => _NoteMenuState();
}

//The page where all notes are displayed
class _NoteMenuState extends State<NoteMenu> {
  //Initial number of notes
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade600,
        title: Text('Notes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: getNoteListView(),

      floatingActionButton: FloatingActionButton(
          onPressed: () {
            addNotePopup();
          },
          //When long-pressed, button displays this text
          tooltip: 'Add',
          //Icon
          child: Icon(Icons.add),
      ),
    );
  }

  ListView getNoteListView(){

    //TextStyle titleStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
        //How many notes there are to build
        itemCount: count,
        //Convert each item into a widget
        itemBuilder: (BuildContext context, int position){
          return Card(
            color: Colors.yellow.shade600,
            child: ListTile(
              title: Text('To Be Continued'),
              onTap: (){

              }
            ),
          );
        }
    );
  }

  Future addNotePopup() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Note Title'),
        content: TextField(
          //Brings up keyboard when button is pressed
          autofocus: true,
          //Access the value
          decoration: InputDecoration(hintText: 'What is this note about?'),
        ),
        actions: [
          TextButton(
            child: Text('ADD'),
            onPressed: () {

              },
          ),
        ],
      ),
  );
}
