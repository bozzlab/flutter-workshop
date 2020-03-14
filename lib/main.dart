import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(
  title: 'My App',
  home: Scaffold(body: MyApp()),
    debugShowCheckedModeBanner: false,
));
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.teal,
                child: Text('heeloo')
            ),
        ),
    );
  }
}