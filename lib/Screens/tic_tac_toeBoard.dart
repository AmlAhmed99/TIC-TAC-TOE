import 'package:flutter/material.dart';
import 'file:///E:/flutter/tic_tac_toe/lib/Widgets/boardButton.dart';

class Board extends StatefulWidget {
  static String boardRoute='boardRoute';

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {

  var buttons=[
    BoardButton('',(){},0),
    BoardButton('',(){},1),
    BoardButton('',(){},2),
    BoardButton('',(){},3),
    BoardButton('',(){},4),
    BoardButton('',(){},5),
    BoardButton('',(){},6),
    BoardButton('',(){},7),
    BoardButton('',(){},8),
  ];
  int counter=0;
  int playerXscore=0;
  int playerOscore=0;
  void onButtonClick(int idx){
    if (buttons[idx].text.isNotEmpty)return;
    print('$idx');
    if(counter%2==0) {
      buttons[idx].text = 'X';
      playerXscore+=2;
      counter++;
    }
    else {
      buttons[idx].text = 'O';
      playerOscore+=2;
      counter++;
    }
   if(checkWinner('X'))
     {
       playerXscore+=5;
       resetBoard();
     }
   else if(checkWinner('O'))
    {
      playerOscore+=5;
      resetBoard();
    }
   if (counter==9)
     {
       resetBoard();
       counter=0;
     }

    setState(() {

    });
  }

  void resetBoard() {

    buttons=[
      BoardButton('',(){},0),
      BoardButton('',(){},1),
      BoardButton('',(){},2),
      BoardButton('',(){},3),
      BoardButton('',(){},4),
      BoardButton('',(){},5),
      BoardButton('',(){},6),
      BoardButton('',(){},7),
      BoardButton('',(){},8),
    ];

  }


  bool checkWinner(String playerCode){
    for(int i=0;i<9;i+=3){
      if(buttons[i+0].text==playerCode&&
          buttons[i+1].text==playerCode&&
          buttons[i+2].text==playerCode)
        return true;
    }
    for(int i=0;i<3;i++)
      {
        if(buttons[i].text==playerCode&&
            buttons[i+3].text==playerCode&&
            buttons[i+6].text==playerCode)
          return true;
      }

    if(buttons[0].text==playerCode&&
        buttons[4].text==playerCode&&
        buttons[8].text==playerCode)
      return true;

    if(buttons[4].text==playerCode&&
        buttons[4].text==playerCode&&
        buttons[6].text==playerCode)
      return true;

       return false;

  }
  @override
  Widget build(BuildContext context) {
    var arg=(ModalRoute.of(context).settings.arguments) as BoardArgument;
    return Scaffold(
      backgroundColor:Color.fromRGBO(40, 60, 79, 1.0) ,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(40, 60, 79, 1.0),
        title: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Text('Tic Tac Toe',style: TextStyle(
                fontSize: 30,
                color: Colors.white
              ),),
              Divider(color: Colors.white,
              thickness: 2,)
            ],
          ),
        ),
      ),
      body: Column(
    
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('${arg.player1Name} (X)'??'X',style: TextStyle(
                        fontSize: 25,
                        color: Colors.white
                    ),),
                    Text('${arg.player2Name} (O)'??'O',style: TextStyle(
                        fontSize: 25,
                        color: Colors.white
                    ),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('$playerXscore',style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),),
                    Text('$playerOscore',style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            flex: 3,
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15
            ),
       itemCount:buttons.length ,
       itemBuilder: (ctx,idx){
              return BoardButton(buttons[idx].text,onButtonClick,idx) ;
       }),
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: MaterialButton(
              onPressed: (){
                setState(() {
                  resetBoard();
                });
              },
              child: Text('Reset Board',style: TextStyle(
                  fontSize: 25,
                  color: Colors.white
              ),),
              color:  Color.fromRGBO(0, 21, 53, 1.0),
              minWidth: 30,
            ),
          )
        ],
      ),
    );
  }


}

class BoardArgument{
   String player1Name;
   String player2Name;

   BoardArgument({@required this.player1Name,@required  this.player2Name});
}


