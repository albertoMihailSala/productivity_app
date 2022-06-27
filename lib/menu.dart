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
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //Space between
            SizedBox(height: 30),
            //LISTS BUTTON
            Container(
              width: 250,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      //Colors.indigo.shade200,
                      Colors.deepPurple.shade50,
                      Theme.of(context).colorScheme.primary,
                    ],
                    //begin: Alignment.centerLeft,
                    //Alignment.centerRight,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.indigo.withOpacity(0.2),
                      spreadRadius: 4,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    )
                  ]
              ),
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TodoMenu()),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.format_list_bulleted_rounded,
                      size: 60,
                      color: Colors.white,
                    ),
                    Text('Lists',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 70,
                      ),
                    ),
                  ],

                ),
              ),
            ),
            //Space between
            SizedBox(height: 20),
            //NOTES BUTTON
            Container(
              width: 250,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      //Colors.indigo.shade200,
                      Colors.deepPurple.shade50,
                      Theme.of(context).colorScheme.primary,
                    ],
                    //begin: Alignment.centerLeft,
                    //Alignment.centerRight,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.indigo.withOpacity(0.2),
                      spreadRadius: 4,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    )
                  ]
              ),
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NoteMenu()),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.edit_note,
                      size: 60,
                      color: Colors.white,
                    ),
                    Text('Notes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 65,
                      ),
                    ),
                  ],

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
                    const TextStyle(fontSize: 30),
                  ),
                ),
            ),
            SizedBox(
              height: 20,
            ),
            //Politehnica Logo
            Image.asset('assets/Logo_Politehnica.png', height: 100, width: 100),
          ],
          ),
        ),
      ),
    );
  }
}