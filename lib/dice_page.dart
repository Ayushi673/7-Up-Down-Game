import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'first_page.dart';
import 'dart:math';

String msg,msg1;
class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}
class _DicePageState extends State<DicePage> {
  int ld= 1;
  int rd= 1;
  void mydice(){
    setState(
            () {
          ld= Random().nextInt(6)+1;
          rd= Random().nextInt(6)+1;
          var sum =ld+rd;
          print('Button pressed, sum=$sum');
          if((sum<7 && choice<7)||(sum==7 && choice==7)||(sum>7 && choice>7))
          {
            print(sum);
            print(choice);
            balance=balance+bid;
            msg='You won $bid points!';
            msg1='Correctly guessed';
            print('bid=$bid');
            print('balance= $balance');
            abc(context);
          }
          else
          {
            print(sum);
            print(choice);
            if(balance<bid){
              balance=0;
              msg='You have no coins left!';
              msg1='You\'ve lost the game';
              abc(context);
            }
            else
            {
              balance=balance-bid;
              msg='You lost $bid points!';
              msg1='Oops! Sour luck';
              abc(context);
            }
            print('bid=$bid');
            print('balance= $balance');
          }
        }
    );
  }
  void abc(BuildContext context) {
    var alertDialog = AlertDialog(
        title: Text(msg),
        content: Text(msg1),
    );
    showDialog(
        context: context,
        builder: (BuildContext context)
        {
          return alertDialog;
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('7 Up Down Game'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FlatButton(
                        onPressed: (){
                          if(balance>0 || balance>bid){
                            mydice();
                          }
                        },
                        child: Image.asset('images/dice$ld.png')
                    ),
                  )
              ),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FlatButton(
                        onPressed: (){
                          if(balance>0 || balance>bid){
                            mydice();
                          }
                        },
                        child: Image.asset('images/dice$rd.png')
                    ),
                  )
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                child:Text('Your balance: $balance'
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF1D1E33),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}