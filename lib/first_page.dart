import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dice_page.dart';
int bid=1000;
String guess= 'none';
String t1,t2;
double balance=10000;
int choice;
class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  Future navigate(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> DicePage()));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('7 Up Down Game',
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w400,
            ),),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('\tBalance: '+balance.toInt().toString()+' coins',
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Select an option:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        color: Colors.red.shade400,
                        onPressed: (){
                          setState(() {
                            print("Less than 7");
                            guess="less than 7";
                            choice=1;
                          });
                        },
                        child: Text('\tLESS THAN \t\t\t\t\t7',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        color: Colors.red.shade600,
                        onPressed: (){
                          setState(() {
                            print("Equal to 7");
                            guess="equal to 7";
                            choice=7;
                          });
                        },
                        child: Text('EQUAL\t\t\t\tT0\n\t\t\t\t\t7',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        color: Colors.red.shade900,
                        onPressed: (){
                          setState(() {
                            print("More than 7");
                            guess="more than 7";
                            choice=10;
                          });
                        },
                        child: Text('MORE THAN \t\t\t\t\t7',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top:25),
                    child: Text(
                      'Make a bid',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      child: Text('1000',
                        style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      margin: EdgeInsets.only(left: 10.0),
                    ),
                    Expanded(
                      child: Slider(
                        value: bid.toDouble(),
                        max:10000,
                        min: 1000,
                        divisions: 10,
                        activeColor: Color(0xFFEB1555),
                        inactiveColor: Color(0xFFBD8E98),
                        onChanged: (double a){
                          setState(() {
                            print(a);
                            bid=a.round();
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Text('10,000',
                        style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      margin: EdgeInsets.only(left: 2,right: 10.0),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text("You're bidding $bid coins on $guess",
                    style: TextStyle(
                      fontSize: 20,
                    ),),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              if(check()==3||check()==1||check()==2){
                print('No option selected or low balance or lost game');
              }
              else{
                navigate(context);
              }
            },
            child: Container(
              color: Colors.red.shade600,
              margin: EdgeInsets.only(top:10),
              width: double.infinity,
              height: 60,
              child: Center(child: Text('ROLL DICE')),
            ),
          ),
        ],
      ),
    );
  }
  int check(){
    if(guess=='none'){
      t1='Please select an option to bid!';
      t2='Choose from the given options';
      invalidBid(context);
      return 3;
    }
    if(balance<=0){
      t1='You have no money!';
      t2='You lost the game';
      invalidBid(context);
      return 2;
    }
    else if(bid>balance) {
      t1='No enough balance';
      t2='Make lower bid';
      invalidBid(context);
      return 1;
    }
    else
      return 0;
  }
  void invalidBid(BuildContext context){
    var alert= AlertDialog(
      title:Text(t1),
      content: Text(t2),
    );
    showDialog(context: context,
        builder: (BuildContext context)
        {
          return alert;
        }
    );
  }
}