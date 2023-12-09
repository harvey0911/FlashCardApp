import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleDone extends StatelessWidget {
  final GoogleSignIn _googleSignIn;
  final User _user;
  static const String id = 'google_done';
  // Constructor with required parameters
  GoogleDone({required User user, required GoogleSignIn signIn})
      : _user = user,
        _googleSignIn = signIn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: _user.photoURL != null
                  ? Image.network(
                _user.photoURL!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              )
                  : Image.network(
                'https://example.com/default_user_image.png', // Placeholder image URL
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              _user.displayName ?? 'Anonymous',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            ElevatedButton( // Replaced FlatButton with ElevatedButton
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () async {
                await _googleSignIn.signOut();
                Navigator.pop(context);
              },
              child: Text('Google sign in Done!'),
            ),
          ],
        ),
      ),
    );
  }
}
