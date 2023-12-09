import 'package:flutter/material.dart' show BuildContext, Key, MaterialApp, StatelessWidget, Widget, runApp;
import 'package:flutter_flashcards/Authentication/main_screens/LoginPage.dart';
import 'package:flutter_flashcards/notifiers/flashcards_notifier.dart';
import 'package:flutter_flashcards/notifiers/review_notifier.dart';
import 'package:flutter_flashcards/notifiers/settings_notifier.dart';
import 'package:flutter_flashcards/pages/home_page.dart';
import 'package:flutter_flashcards/utils/methods.dart';
import 'package:provider/provider.dart';

import 'configs/themes.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => FlashcardsNotifier()),
    ChangeNotifierProvider(create: (_) => SettingsNotifier()),
    ChangeNotifierProvider(create: (_) => ReviewNotifier()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    updatePreferencesOnRestart(context: context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyFlashcardsApp',
      theme: appTheme,
      home: const HomePage(),
    );
  }
}

//class Home extends StatelessWidget {
  //@override
  //Widget build(BuildContext context) {
    //return MaterialApp(
      //debugShowCheckedModeBanner: false,
      //theme: ThemeData(fontFamily: 'Abel'),
      //initialRoute: RegisterPage.id,
      //routes: {
        //RegisterPage.id: (context) => RegisterPage(),
        //LoginPage.id: (context) => LoginPage(),
        //ForgotPassword.id: (context) => ForgotPassword(),
        //Done.id: (context) => Done(),
      //},
    //);
  //}


