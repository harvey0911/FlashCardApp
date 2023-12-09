import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Using a StatefulWidget to manage state
class Done extends StatefulWidget {
  static const String id = 'done_screen'; // Changed to const for best practice

  @override
  _DoneState createState() => _DoneState();
}

class _DoneState extends State<Done> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? loggedInUser; // Nullable type for loggedInUser

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser; // Directly getting the current user
      if (user != null) {
        setState(() {
          loggedInUser = user; // Assigning user to loggedInUser if not null
        });
      }
    } catch (e) {
      print(e); // Error handling
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/done.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              stops: [0.5, 1],
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.2),
              ],
            ),
          ),
          child: Center(
            child: Text(
              'Welcome ${loggedInUser?.email ?? "User"}!', // Displaying the user's email if available
              style: TextStyle(fontSize: 50.0, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
