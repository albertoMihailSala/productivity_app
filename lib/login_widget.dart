import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
//import 'package:firebase_auth_email/main.dart';
//import 'package:firebase_auth_email/utils/utils.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'utils.dart';
import 'forgot_password_page.dart';
//ignore_for_file: prefer_const_constructors

class LoginWidget extends StatefulWidget {
  //const LoginWidget({Key? key}) : super(key: key);
  final VoidCallback onClickedSignUp;

  const LoginWidget({
    Key? key,
    required this.onClickedSignUp,
   }) :super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          //Câmpul pentru email
          TextField(
            controller: emailController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          SizedBox(height: 4),
          //Câmpul pentru parolă
          TextField(
            controller: passwordController,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          SizedBox(height: 20),
          //Buton de Sign In
          ElevatedButton.icon(
              onPressed: signIn,
              icon: Icon(
                Icons.fireplace_outlined,
              ),
              label: Text('Log In with Firebase')
          ),
          SizedBox(height: 20),
          //FORGOT PASSWORD
          GestureDetector(
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              )
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ForgotPasswordPage(),
            )),
          ),
          SizedBox(height: 20),
          //SIGN UP
          RichText(
              text: TextSpan(
                text: 'NO ACCOUNT?  ',
                style: TextStyle(
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = widget.onClickedSignUp,
                    text: 'Sign Up',
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
    );
  }
  Future signIn() async {
    //Indicator circular în timpul Sign In
    showDialog(
        context: context,
        builder: (context) => Center(child: CircularProgressIndicator())
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
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
