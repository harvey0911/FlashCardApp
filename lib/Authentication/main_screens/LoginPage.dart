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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        color: Colors.blueAccent,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset('assets/images/background.png'),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 60.0, bottom: 20.0, left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 50.0),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back,',
                        style: TextStyle(fontSize: 30.0),
                      ),
                      Text(
                        'please login',
                        style: TextStyle(fontSize: 30.0),
                      ),
                      Text(
                        'to your account',
                        style: TextStyle(fontSize: 30.0),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Email',
                          labelText: 'Email',
                          errorText: _wrongEmail ? emailText : null,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
                          errorText: _wrongPassword ? passwordText : null,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, ForgotPassword.id);
                          },
                          child: Text(
                            'Forgot Password?',
                            style:
                            TextStyle(fontSize: 20.0, color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff447def),
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                    ),
                    onPressed: () async {
                      setState(() {
                        _showSpinner = true;
                      });
                      try {
                        final newUser = await _auth.signInWithEmailAndPassword(
                            email: email!, password: password!);
                        if (newUser != null) {
                          Navigator.pushNamed(context, Done.id);
                        }
                      } catch (e) {
                        // Handle errors
                      }
                      setState(() {
                        _showSpinner = false;
                      });
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          height: 1.0,
                          width: 60.0,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        'Or',
                        style: TextStyle(fontSize: 25.0),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          height: 1.0,
                          width: 60.0,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: ContinuousRectangleBorder(
                              side: BorderSide(width: 0.5, color: Colors.grey),
                            ),
                          ),
                          onPressed: () {
                            onGoogleSignIn(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/google.png',
                                  fit: BoxFit.contain,
                                  width: 40.0,
                                  height: 40.0),
                              Text(
                                'Google',
                                style: TextStyle(
                                    fontSize: 25.0, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: ContinuousRectangleBorder(
                              side: BorderSide(width: 0.5, color: Colors.grey),
                            ),
                          ),
                          onPressed: () {
                            // TODO: Implement Facebook functionality
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/facebook.png',
                                  fit: BoxFit.cover, width: 40.0, height: 40.0),
                              Text(
                                'Facebook',
                                style: TextStyle(
                                    fontSize: 25.0, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(fontSize: 25.0),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterPage.id);
                        },
                        child: Text(
                          ' Sign Up',
                          style: TextStyle(fontSize: 25.0, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
