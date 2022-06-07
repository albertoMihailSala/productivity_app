import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:productivity_app/notes/note_menu.dart';
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
            //<ProductivityApp Logo>
            Text("What do you need?",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            //Space between
            SizedBox(height: 30,
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
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => FirebaseAuth.instance.signOut(),
                child: Text('Sign Out'),
            ),
            SizedBox(
              height: 20,
            ),
            //Politehnica Logo
            Image.asset('assets/Logo_Politehnica.png', height: 110, width: 110,),
          ],
          ),
        ),
      ),
    );
  }
}