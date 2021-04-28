import 'package:flutter/material.dart';

import 'Dashboard.dart';
import 'MenuScreen.drt.dart';

void main() {
  runApp( Recipe());
}

class Recipe extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomePage()
    );
  }

}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Stack(
        children: [

          Menu(),
          HomeDash()
        ],
      ),
    );
  }
}