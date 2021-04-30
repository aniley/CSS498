import 'package:flutter/material.dart';
import 'package:recipeapplication/config.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: primaryGreen,
        padding: EdgeInsets.only(top:50,bottom: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Abdirahman Hassan",
                      style:
                      TextStyle(color: Colors.white,
                          fontWeight:FontWeight.bold ),)
                  ],
                )
              ],
            ),
            Column(
                children: drawerItems.map((e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(e['icon'],color: Colors.white,size: 30,),
                      SizedBox(width: 10,),
                      Text(e['title'], style:TextStyle(color: Colors.white,
                          fontWeight:FontWeight.bold ),)
                    ],
                  ),
                )).toList()
            ),
            Row(
              children: [
                Icon(Icons.logout,color: Colors.white,),
                SizedBox(width: 10,),
                Text("Logout",
                  style:
                  TextStyle(color: Colors.white,
                      fontWeight:FontWeight.bold ),
                ),

              ],
            )
          ],
        )
    );
  }
}