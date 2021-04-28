import 'package:flutter/material.dart';

class HomeDash  extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HomeDash> {
  double xOffSet=0;
  double yOffSet=0;
  double scale=1;
  bool isOpen=false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      transform: Matrix4.translationValues(xOffSet, yOffSet,0 )..scale(scale)..rotateY(isOpen ? -0.5:0.0),
      color: Colors.white,

      child:SingleChildScrollView (
        child: Column(
          children: [
            SizedBox(height: 50,),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    isOpen ? IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: (){
                          setState(() {
                            xOffSet=0;
                            yOffSet=0;
                            scale=1;
                            isOpen=false;
                          });

                        }):
                    IconButton(icon: Icon(Icons.menu), onPressed: (){
                      setState(() {
                        xOffSet=230;
                        yOffSet=150;
                        scale=0.6;
                        isOpen=true;


                      });

                    })
                  ],
                )
            ),
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10),
                margin: EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    Text("search Recipe"),

                  ],
                )
            ),
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10),
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Text("Meals For Day",
                        style: TextStyle(fontSize: 50, fontStyle: FontStyle.italic)
                    ),


                  ],
                )
            ),
            Container(
                height: 240,
                margin:EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  children: [
                    Expanded(
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              margin: EdgeInsets.only(top: 40, bottom: 20),
                              alignment: Alignment.centerLeft,
                            ),
                            Align(
                              child: Text("BREAK FAST",
                                style: TextStyle(fontSize: 20),),
                            )
                          ],
                        )
                    )

                  ],
                )
            ),
            Container(
                height: 240,
                margin:EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  children: [
                    Expanded(
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              margin: EdgeInsets.only(top: 40, bottom: 20),
                              alignment: Alignment.centerLeft,
                            ),
                            Align(
                              child: Text("Lunch",
                                style: TextStyle(fontSize: 20),),
                            )
                          ],
                        )
                    )

                  ],
                )
            ),
            Container(
                height: 240,
                margin:EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  children: [
                    Expanded(
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              margin: EdgeInsets.only(top: 40, bottom: 20),
                              alignment: Alignment.centerLeft,
                            ),
                            Align(
                              child: Text("Dinner",
                                style: TextStyle(fontSize: 20),),
                            )
                          ],
                        )
                    )

                  ],
                )
            ),
            SizedBox(height: 50,)


          ],
        ),
      ),
    );

  }
}