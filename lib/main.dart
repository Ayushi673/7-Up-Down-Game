import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sevenupdowngame/first_page.dart';
int bid=1000;
String guess= 'none';
double balance=10000;
void main() {
  return runApp(new App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        //accentColor: ,
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.white),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: FirstPage(),
      ),
    );
  }
}

