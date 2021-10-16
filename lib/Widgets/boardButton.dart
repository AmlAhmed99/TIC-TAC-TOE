
import 'package:flutter/material.dart';

class BoardButton extends StatelessWidget {
  @required String text;
  @required Function onpress;
  @required int index;


  BoardButton(this.text,this.onpress,this.index);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        onpress(index);
      },
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 21, 53, 1.0),
            borderRadius: BorderRadius.circular(20),
            border:Border.all(color: Colors.blueAccent)
          ),
          alignment: Alignment.center,
          child: Text(text,style: TextStyle(
              fontSize: 30,
              color: Colors.white
          ),),
        ),

    );
  }
}
