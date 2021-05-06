import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recipeapplication/recipeeAPI/Webview.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:recipeapplication/recipeeAPI/recipeStructure.dart';

class HomeDash extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HomeDash> {
  double xOffSet = 0;
  double yOffSet = 0;
  double scale = 1;
  bool isOpen = false;
  bool loading = false;

  List<Model> allRecipees = <Model>[];
  TextEditingController recipedSearch = new TextEditingController();

  final String applicationID = "fbe24732";
  final String applicationKey = "6483feed4308d5b82001d97ce88d8a42";

  void getRecipees(String query) async {
    String base =
        "https://api.edamam.com/search?q=$query&app_id=$applicationID&app_key=$applicationKey";
    var url = Uri.parse(base);
    var result = await http.get(url);

    Map<String, dynamic> data = jsonDecode(result.body);
    data["hits"].forEach((element) {
      Model newRecipe = new Model();
      newRecipe = Model.fromMap(element['recipe']);
      allRecipees.add(newRecipe);
    });

    print("$allRecipees.toString()");
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      transform: Matrix4.translationValues(xOffSet, yOffSet, 0)
        ..scale(scale)
        ..rotateY(isOpen ? -0.5 : 0.0),
      color: Colors.white,
      child: Column(children: [
        SizedBox(
          height: 50,
        ),
        SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  isOpen
                      ? IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            setState(() {
                              xOffSet = 0;
                              yOffSet = 0;
                              scale = 1;
                              isOpen = false;
                            });
                          })
                      : IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            setState(() {
                              xOffSet = 230;
                              yOffSet = 150;
                              scale = 0.6;
                              isOpen = true;
                            });
                          })
                ],
              )),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: EdgeInsets.symmetric(vertical: 30),
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: recipedSearch,
                  decoration: InputDecoration(hintText: "search recipe"),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              InkWell(
                  onTap: () async {
                    getRecipees(recipedSearch.text);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(
                            colors: [
                              const Color(0xffA2834D),
                              const Color(0xffBC9A5F)
                            ],
                            begin: FractionalOffset.topRight,
                            end: FractionalOffset.bottomLeft)),
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.search, size: 18, color: Colors.white),
                      ],
                    ),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          child: GridView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200, mainAxisSpacing: 10.0),
            physics: ClampingScrollPhysics(),
            children: List.generate(allRecipees.length, (index) {
              return GridTile(
                  child: recipeView(
                title: allRecipees[index].label,
                imgUrl: allRecipees[index].image,
                desc: allRecipees[index].source,
                url: allRecipees[index].url,
              ));
            }),
          ),
        )
      ]),
    );
  }
}

class recipeView extends StatefulWidget {
  final String title, desc, imgUrl, url;

  recipeView({this.title, this.desc, this.imgUrl, this.url});

  @override
  _recipeViewState createState() => _recipeViewState();
}

class _recipeViewState extends State<recipeView> {
  _launchURL(String url) async {
    print(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not open $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            if (kIsWeb) {
              _launchURL(widget.url);
            } else {
              print(widget.url + " this is what we are going to see");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RecipeView(
                            postUrl: widget.url,
                          )));
            }
          },
          child: Container(
            margin: EdgeInsets.all(8),
            child: Stack(
              children: <Widget>[
                Image.network(
                  widget.imgUrl,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: 200,
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.white30, Colors.white],
                          begin: FractionalOffset.centerRight,
                          end: FractionalOffset.centerLeft)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.title,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                              fontFamily: 'Overpass'),
                        ),
                        Text(
                          widget.desc,
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.black54,
                              fontFamily: 'OverpassRegular'),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Card extends StatelessWidget {
  final Color topColor;
  final Color bottomColor;
  final String topColorCode;
  final String bottomColorCode;

  Card(
      {this.topColor,
      this.bottomColor,
      this.topColorCode,
      this.bottomColorCode});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  height: 160,
                  width: 180,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [topColor, bottomColor],
                          begin: FractionalOffset.topLeft,
                          end: FractionalOffset.bottomRight)),
                ),
                Container(
                  width: 180,
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.white30, Colors.white],
                          begin: FractionalOffset.centerRight,
                          end: FractionalOffset.centerLeft)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          topColorCode,
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        Text(
                          bottomColorCode,
                          style: TextStyle(fontSize: 16, color: bottomColor),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
