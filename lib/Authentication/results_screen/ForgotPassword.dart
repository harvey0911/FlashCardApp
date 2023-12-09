import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

// Using StatelessWidget as this widget does not need to maintain any state
class ForgotPassword extends StatelessWidget {
  static const String id = 'forgot_password_screen'; // Changed to const for best practice

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController(); // Using TextEditingController

  Future<bool> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset('assets/images/background.png'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 60.0, bottom: 20.0, left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Reset Password',
                  style: TextStyle(fontSize: 40.0),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter your email',
                      style: TextStyle(fontSize: 30.0),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      controller: _emailController, // Using the controller
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(hintText: 'Email'),
                    ),
                  ],
                ),
                ElevatedButton( // Replaced RaisedButton with ElevatedButton
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff447def), // Background color
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                  ),
                  onPressed: () async {
                    if (await resetPassword(_emailController.text)) {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.SUCCES,
                        animType: AnimType.SCALE,
                        title: 'Email Sent ✈️',
                        desc: 'Check your email to reset password!',
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {},
                      )..show();
                    } else {
                      // Handle error here
                    }
                  },
                  child: Text(
                    'Reset Password',
                    style: TextStyle(fontSize: 25.0, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
