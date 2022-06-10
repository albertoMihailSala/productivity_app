import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productivity_app/notes/note_menu.dart';
import 'package:productivity_app/todos/todo_menu.dart';
//ignore_for_file: prefer_const_constructors

//MENIUL PRINCIPAL

class Menu extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    //Informații utilizator
    //final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      //Centering the buttons
      body: Center(
        //padding: EdgeInsets.all(16),
        //Stacking the buttons vertically
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          //Adding the buttons
          children: [
            Text("What do you need?",
              style: GoogleFonts.prompt(
                textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //Space between
            SizedBox(height: 30),
            //Lists Button
            OutlinedButton.icon(
              //Function
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TodoMenu()),
                );
              },
              //Icon
              icon: Icon(
                Icons.format_list_bulleted_rounded,
                size: 95,
                color: Colors.black,
              ),
              //Text
              label: Text(
                  'Lists',
                  style: TextStyle(
                    color: Colors.black,
                  ),
              ),
              //Button proprieties
              style: ButtonStyle(
                //Change border
                side: MaterialStateProperty.all(BorderSide(
                    color: Colors.black,
                    width: 4,
                    style: BorderStyle.solid)),
                //Change shape to a more rodunded one
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0))),
                //Size for consistency
                minimumSize: MaterialStateProperty.all(const Size(370, 40)),

                //Distance between text & container
                padding: MaterialStateProperty.all(const EdgeInsets.all(10)),

                //Text Font
                textStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 95),
                ),
              ),
            ),
            //Space between
            SizedBox(height: 20),
            //Notes Button
            OutlinedButton.icon(
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
                color: Colors.black,
              ),
              //Text
              label: Text(
                  'Notes',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              //Button proprieties
              style: ButtonStyle(
                //Change border width & color
                side: MaterialStateProperty.all(BorderSide(
                      color: Colors.black,
                      width: 4,
                      style: BorderStyle.solid)),
                //Change shape to a more rodunded one
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0))),
                //Distance between text & container
                padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                //Text Font
                textStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 94),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => FirebaseAuth.instance.signOut(),
                child: Text('Sign Out'),
                style: ButtonStyle(
                  //Distance between text & container
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  //Text Font
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(fontSize: 40),
                  ),
                ),
            ),
            SizedBox(
              height: 20,
            ),
            //Politehnica Logo
            Image.asset('assets/Logo_Politehnica.png', height: 120, width: 120),
          ],
          ),
        ),
      ),
    );
  }
}