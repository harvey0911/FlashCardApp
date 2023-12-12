import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Authentication/results_screen/ForgotPassword.dart';
import '../../Authentication/results_screen/GoogleDone.dart';
import '../../Authentication/main_screens/RegisterPage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../results_screen/Done.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  static const String id = '/LoginPage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? password;
  bool _showSpinner = false;
  bool _wrongEmail = false;
  bool _wrongPassword = false;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> _handleSignIn() async {
    bool isSignedIn = await _googleSignIn.isSignedIn();
    if (isSignedIn) {
      return _auth.currentUser;
    } else {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      return (await _auth.signInWithCredential(credential)).user;
    }
  }

  void onGoogleSignIn(BuildContext context) async {
    setState(() {
      _showSpinner = true;
    });

    User? user = await _handleSignIn();

    if (user != null) {
      Navigator.pushNamed(context, GoogleDone.id, arguments: user);
    } else {
      // Handle null user scenario
    }

    setState(() {
      _showSpinner = false;
    });
  }

  String emailText = 'Email doesn\'t match';
  String passwordText = 'Password doesn\'t match';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Adjust when keyboard shows up
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        color: Colors.blueAccent,
        child: SingleChildScrollView( // Make the layout scrollable
          child: Padding(
            padding: EdgeInsets.only(
                top: 60.0, bottom: 20.0, left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Login',
                  style: TextStyle(fontSize: 50.0),
                ),
                SizedBox(height: 30.0), // Adjust spacing as needed
                // Rest of your login form
                // ...
                // Login and social media buttons
                // ...
                // Sign up suggestion
                // ...
              ],
            ),
          ),
        ),
      ),
    );
  }
}
