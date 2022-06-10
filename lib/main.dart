import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:productivity_app/provider/note_provider.dart';
import 'package:productivity_app/provider/task_provider.dart';
import 'package:productivity_app/provider/todo_provider.dart';
import 'package:provider/provider.dart';
import 'auth_page.dart';
import 'verify_email_page.dart';
import 'utils.dart';

//ignore_for_file: prefer_const_constructors

//void main () => runApp(MyApp());
//FIREBASE SYNTAX
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

// NAVIGAREA ÎNTRE LOG IN - SIGN UP
final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) => MultiProvider(
    //STATE MANAGEMENT FOR LISTS, TASKS & NOTES
    providers: [
        ChangeNotifierProvider(create: (context) => NoteProvider()),
        ChangeNotifierProvider(create: (context) => TaskProvider()),
        ChangeNotifierProvider(create: (context) => TodoProvider()),
    ],
    child: MaterialApp(
      //For Utils
      scaffoldMessengerKey: Utils.messengerKey,
      //For Sign Up - Sign In navigation
      navigatorKey: navigatorKey,
      title: 'ProductivityApp',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Authentication(),
      //Disables Debug banner
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Authentication extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        //authStateChanges - Vedem dacă utilizatorul s-a logat
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          else if(snapshot.hasError){
            return Center(child: Text('An error occured.'));
          }
          else if(snapshot.hasData){
            return VerifyEmailPage();
          }
          else {
            return AuthPage();
          }
        },
      ),
    );
  }
}

