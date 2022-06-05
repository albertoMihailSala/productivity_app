import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
//import 'package:firebase_auth_email/main.dart';
//import 'package:firebase_auth_email/utils/utils.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'utils.dart';
//ignore_for_file: prefer_const_constructors

class SignUpWidget extends StatefulWidget {
  //const SignUpWidget({Key? key}) : super(key: key);
  final Function() onClickedSignIn;

  const SignUpWidget({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           SizedBox(height: 40),
            //CÂMPUL PENTRU EMAIL
           TextFormField(
              controller: emailController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: 'Email'),
              //VALIDARE EMAIL
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email) =>
                  email != null && !EmailValidator.validate(email)
                      ? 'Please enter a valid email'
                     : null,
            ),
           SizedBox(height: 4),
            //CÂMPUL PENTRU PAROLĂ
           TextFormField(
              controller: passwordController,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => value != null && value.length < 6
                  ? 'Please enter minimum 6 characters'
                 : null,
            ),
           SizedBox(height: 20),
            //SIGN UP BUTTON
            ElevatedButton.icon(
                onPressed: signUp,
               icon: Icon(
                    Icons.lock
               ),
                label: Text('Sign Up')
           ),
            SizedBox(height: 20),
            //SIGN IN TEXT
            RichText(
               text: TextSpan(
                    text: 'ALREADY HAVE AN ACCOUNT?  ',
                   style: TextStyle(
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = widget.onClickedSignIn,
                          text: 'Sign In',
                          style: TextStyle(
                            //decoration: TextDecoration.underline,
                            color: Theme.of(context).colorScheme.secondary,
                          )
                      )
                    ]
                )
           ),
         ],
        ),
      ),
    );
  }
  Future signUp() async {
    //Verificăm validitatea datelor cu formKey
    final isValid = formKey.currentState!.validate();
    if(!isValid) return;

    //LOADING INDICATOR
    showDialog(
        context: context,
        builder: (context) => Center(child: CircularProgressIndicator())
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e){
      print(e);

      Utils.showSnackBar(e.message);
    }

    //Ascundem indicatorul de Loading după ce utilizatorul s-a logat
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
