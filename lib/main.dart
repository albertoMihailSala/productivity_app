import 'package:flutter/material.dart';
//ignore_for_file: prefer_const_constructors
import 'package:productivity_app/notes/note_menu.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'ProductivityApp',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MainMenu(),
      //Disables Debug banner
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      //Centering the buttons
      body: Center(
        //Stacking the buttons vertically
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          //Adding the buttons
          children: [
            //<ProductivityApp Logo>
            Text("ProductivityApp",
                 style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                 ),
                ),
            //Space between
            SizedBox(
              height: 30,
            ),
            //Lists Button
              ElevatedButton.icon(
                //Function
                onPressed: () {
                },
                //Icon
                icon: Icon(
                  Icons.format_list_bulleted_rounded,
                  size: 95,
                ),
                //Text
                label: Text('Lists'),
                //Button proprieties
                style: ButtonStyle(
                  //Change default background color
                  backgroundColor: MaterialStateProperty.all(Colors.blue),

                  //Size for consistency
                  minimumSize: MaterialStateProperty.all(const Size(370, 40)),

                  //Distance between text & container
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),

                  //Text Font
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(fontSize: 95),
                  ),

                  //Color animation when pressing button
                  overlayColor: MaterialStateProperty.all(Colors.blue.shade700),
                ),
              ),
            //Space between
            SizedBox(
              height: 20,
            ),
            //Notes Button
            ElevatedButton.icon(
              //Function
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NoteMenu()),
                );
              },
              //Icon
              icon: Icon(
                Icons.edit_note,
                size: 94,
              ),
              //Text
              label: Text('Notes'),
              //Button proprieties
              style: ButtonStyle(
                //Change default background color
                backgroundColor: MaterialStateProperty.all(Colors.yellow.shade600),
                //Distance between text & container
                padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                //Text Font
                textStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 94),
                ),
                //Color animation when pressing button
                overlayColor: MaterialStateProperty.all(Colors.yellow.shade700),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //Politehnica Logo
            Image.asset('assets/Logo_Politehnica.png', height: 110, width: 110,),
          ],
          ),
        ),
    );
  }
}
