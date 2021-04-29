import 'package:flutter/material.dart';

import 'sendGoals.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool valuefirst = false;
  bool valuesecond = false;
  bool valuethird = false;
  bool valuefourth = false;
  bool valuefifth = false;
  bool valuesix = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('What is your goal?')),
        backgroundColor: Colors.red[300],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 100.0,
              color: Colors.white24,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    //     disabledColor: Colors.red,
                    // disabledTextColor: Colors.black,
                    padding: const EdgeInsets.all(20),
                    textColor: Colors.white,
                    color: Colors.red[400],
                    onPressed: () {
                      setState(() {
                        print('Gain Weight Clicked');
                      });
                    },
                    child: Text('Gain Weight'),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  RaisedButton(
                    //     disabledColor: Colors.red,
                    // disabledTextColor: Colors.black,
                    padding: const EdgeInsets.all(20),
                    textColor: Colors.white,
                    color: Colors.red[400],
                    onPressed: () {
                      setState(() {
                        print('Lose Weight Clicked');
                      });
                    },
                    child: Text('Lose Weight'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              //height: 200,
                padding: new EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Do you have dietary restrictions?',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    CheckboxListTile(
                      title: const Text('Gluten Free'),
                      value: this.valuefirst,
                      onChanged: (bool value) {
                        setState(() {
                          this.valuefirst = value;
                        });
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.trailing,
                      title: const Text('Vegetrian'),
                      value: this.valuesecond,
                      onChanged: (bool value) {
                        setState(() {
                          this.valuesecond = value;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Nut Alergy'),
                      value: this.valuethird,
                      onChanged: (bool value) {
                        setState(() {
                          this.valuethird = value;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Lactose Intolerant'),
                      value: this.valuefourth,
                      onChanged: (bool value) {
                        setState(() {
                          this.valuefourth = value;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Diabetic'),
                      value: this.valuefifth,
                      onChanged: (bool value) {
                        setState(() {
                          this.valuefifth = value;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Sugar Free'),
                      value: this.valuesix,
                      onChanged: (bool value) {
                        setState(() {
                          this.valuesix = value;
                        });
                      },
                    ),
                  ],
                )),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 100.0,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    //     disabledColor: Colors.red,
                    // disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(30),

                    textColor: Colors.white,
                    color: Colors.red[400],
                    onPressed: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SendGoals(),
                          ),
                        );
                        //print('Next Clicked');
                      });
                    },
                    child: Text('Next'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}