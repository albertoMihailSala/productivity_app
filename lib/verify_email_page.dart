import 'dart:async'; //PENTRU TIMER
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'menu.dart';
import 'utils.dart';
//ignore_for_file: prefer_const_constructors

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  Timer? timer;

  bool canResendEmail = false;

  @override
  void initState(){
    super.initState();

    //VERIFICĂM DACĂ EMAILUL UTILIZATORULUI ESTE VERIFICAT
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    //DACĂ NU, TRIMITEM UN EMAIL DE VERIFICARE
    if(!isEmailVerified){
      sendVerificationEmail();

      //VERIFICĂM LA FIECARE 3 SECUNDE DACĂ EMAILUL A FOST VERIFICAT
      timer = Timer.periodic(
        Duration(seconds: 3),
          (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose(){
    timer?.cancel();

    super.dispose();
  }

  Future checkEmailVerified() async {
    //RELOAD PENTRU A LUA NOUL STATUS DUPĂ VERIFICAREA EMAILULUI
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    //OPRIM TIMER-UL DUPĂ VERIFICARE
    if(isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResendEmail = false);
      await Future.delayed(Duration(seconds: 5));
      setState(() => canResendEmail = true);

    } catch (e) {
      Utils.showSnackBar(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? Menu()
      : Scaffold(
          appBar: AppBar(
          title: Text('Verify your email'),
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'A verification email has been sent'
                ),
                SizedBox(height: 20),
                //RESEND EMAIL BUTTON
                ElevatedButton.icon(
                    onPressed: canResendEmail
                               ? sendVerificationEmail
                               :null,
                    icon: Icon(Icons.check_box_outlined),
                    label: Text('Resend email'),
                ),
                SizedBox(height: 20),
                //CANCEL
                TextButton(
                    onPressed: () => FirebaseAuth.instance.signOut(),
                    child: Text('Cancel')
                ),
              ],
            ),
          ),
        );
}

