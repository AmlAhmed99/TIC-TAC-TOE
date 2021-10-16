import 'package:flutter/material.dart';
import 'file:///E:/flutter/tic_tac_toe/lib/Screens/loginScreen.dart';
import 'file:///E:/flutter/tic_tac_toe/lib/Screens/tic_tac_toeBoard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     routes: {
        Board.boardRoute:(ctx)=>Board(),
       LoginScreen.LoginScreenRoute:(ctx)=>LoginScreen()
     },
      initialRoute:  LoginScreen.LoginScreenRoute,
    );
  }
}
