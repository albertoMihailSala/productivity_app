import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utils.dart';
//ignore_for_file: prefer_const_constructors

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Reset your password'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                    'A link will be sent to your email',
                    style: GoogleFonts.redHatDisplay(
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                ),
                ),
                Text(
                  'Make sure to check your Junk folder',
                  style: GoogleFonts.redHatDisplay( //assistant
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                 ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  textInputAction: TextInputAction.done,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                  email != null && !EmailValidator.validate(email)
                      ? 'The provided email is invalid'
                      : null,
                ),
                SizedBox(height: 20),
                //RESET PASSWORD BUTTON
                ElevatedButton.icon(
                    onPressed: resetPassword,
                    icon: Icon(Icons.email_outlined),
                    label: Text('Reset Password'),
                  style: ButtonStyle(
                    //Distance between text & container
                    padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                    //Text Font
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

  Future resetPassword() async {
    //LOADING INDICATOR
    showDialog(
        context: context,
        builder: (context) => Center(child: CircularProgressIndicator())
    );

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emailController.text.trim());

      Utils.showSnackBar('An email has been sent to reset the password');
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
      Navigator.of(context).pop();
    }
  }
}
