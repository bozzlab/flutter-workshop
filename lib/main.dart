import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
void main() => runApp(
  MaterialApp(
    title: 'My App',
    home: Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: MyApp(),
    ),
  ),
);
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  String result = '0';
  String eval = '0';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            child: Text(
              result,
              style: TextStyle(fontSize: 36),
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                _buildKeyPadButton(title: '1'),
                _buildKeyPadButton(
                  title: '2',
                ),
                _buildKeyPadButton(
                  title: '3',
                ),
                _buildKeyPadButton(
                  title: '+',
                ),
              ],
            ),
            Row(
              children: <Widget>[
                _buildKeyPadButton(
                  title: '4',
                ),
                _buildKeyPadButton(
                  title: '5',
                ),
                _buildKeyPadButton(
                  title: '6',
                ),
                _buildKeyPadButton(
                  title: '-',
                ),
              ],
            ),
            Row(
              children: <Widget>[
                _buildKeyPadButton(
                  title: '7',
                ),
                _buildKeyPadButton(
                  title: '8',
                ),
                _buildKeyPadButton(
                  title: '9',
                ),
                _buildKeyPadButton(
                  title: 'x',
                ),
              ],
            ),
            Row(
              children: <Widget>[
                _buildKeyPadButton(
                  title: '0',
                ),
                _buildKeyPadButton(
                  title: 'C',
                ),
                _buildKeyPadButton(
                  title: '%',
                ),
                _buildKeyPadButton(
                  title: '=',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
  Expanded _buildKeyPadButton({String title}) {
    return Expanded(
      child: FlatButton(
        color: Colors.redAccent,
        padding: EdgeInsets.all(20),
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          _addKey(title);
        },
      ),
    );
  }
  void _addKey(String symbol) {
    setState(() {
      if (symbol == '=') {
        Parser p = Parser();
        Expression exp = p.parse(eval);
        ContextModel cm = ContextModel();
        double tmp = exp.evaluate(EvaluationType.REAL, cm);
        result = '$tmp';
        eval = '$tmp';
      } else if (symbol == 'C') {
        result = '0';
        eval = '0';
      } else {
        if (result == '0') {
          eval = symbol;
          result = symbol;
        } else {
          if (symbol == 'x') {
            eval += '*';
          } else if (symbol == '%') {
            eval += '/';
          } else {
            eval += symbol;
          }
          result += symbol;
        }
      }
    });
  }
}