import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(
  title: 'My App',
  home: Scaffold(body: MyApp()),
));
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Image.asset("assets/images/avatar.jpeg"),
        InkWell(
        onTap: () {
          final snackBar = SnackBar(
            content: Text('Hey!'),
          );
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Container(
          height: 100,
          width: 300,
          alignment: Alignment.center,
          child: Text(
            'hello bozz!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontFamily: 'Prompt',
              fontStyle: FontStyle.italic,
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.greenAccent,
            border: Border.all(color: Colors.black38, width: 3),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
                spreadRadius: 0,
                offset: Offset(10, 10),
              ),
            ],
          ),
        ),
      ),
    ],
    ),
    );
  }
}