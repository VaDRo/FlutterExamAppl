import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/general_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Almost Tinder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Almost Tinder'),
        ),
        body:
        Center(
          child: GeneralInfo(),
        ),
      ),
    );

  }
}
