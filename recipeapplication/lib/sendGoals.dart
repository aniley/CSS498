import 'package:flutter/material.dart';

class SendGoals extends StatefulWidget {
  @override
  _SendGoalsState createState() => _SendGoalsState();
}

class _SendGoalsState extends State<SendGoals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Summary')),
        backgroundColor: Colors.red[300],
      ),
      body: Center(
        child: ElevatedButton(
          // Within the SecondScreen widget
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack.
            Navigator.pop(context);
          },
          child: Text('Go back!'),
          style: ElevatedButton.styleFrom(elevation: 10),
        ),
      ),
    );
  }
}
