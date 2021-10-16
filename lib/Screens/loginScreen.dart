import 'package:flutter/material.dart';
import 'file:///E:/flutter/tic_tac_toe/lib/Screens/tic_tac_toeBoard.dart';

class LoginScreen extends StatelessWidget {
  static String LoginScreenRoute='LoginScreenRoute';

  final  player1Controller=TextEditingController();
  final  player2Controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(40, 60, 79, 1.0),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(40, 60, 79, 1.0),
        title: Padding(
          padding: const EdgeInsets.all(70.0),
          child: Column(
            children: [
              Text(
                'Tic Tac Toe',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              Divider(
                color: Colors.white,
                thickness: 2,
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                controller: player1Controller,
                decoration: InputDecoration(
                  labelText: 'player1 name',
                  labelStyle: TextStyle(color: Colors.blue),
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                controller: player2Controller,
                decoration: InputDecoration(
                  labelText: 'player2 name',
                  labelStyle: TextStyle(color: Colors.blue),
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  print(player1Controller.text);
                  print(player2Controller.text);
                  Navigator.pushNamed(context, Board.boardRoute,arguments:
                  BoardArgument(
                      player1Name: player1Controller.text,
                      player2Name: player2Controller.text
                  )
                     );

                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue)),
                child: Text(
                  'Start Game',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                color: Colors.blue,
                minWidth: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
