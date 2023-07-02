import 'package:flutter/material.dart';
import 'package:test1/screens/kids/all_kids_item.dart';
import 'package:test1/screens/kids/boys.dart';
import 'package:test1/screens/kids/girls.dart';
import 'package:test1/screens/men/all_men_items.dart';
import 'package:test1/screens/men/men_shirts.dart';
import 'package:test1/screens/men/men_tshirt.dart';
import 'package:test1/screens/women/all_women_item.dart';
import 'package:test1/screens/women/women_dress.dart';
import 'package:test1/screens/women/women_sweaters.dart';

class screen333 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: (3),
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 60,
          centerTitle: false,
          actions: [IconButton(icon: Icon(Icons.person), onPressed: null)],
          backgroundColor: Colors.white,
          title: RichText(
            text: TextSpan(
              text: "H Z ",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'B A R',
                  style: TextStyle(
                    color: Colors.black,
                    height: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          bottom: TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            tabs: [
              Tab(
                text: "KIDS",
              ),
              Tab(
                text: "WOMEN",
              ),
              Tab(
                text: "MEN",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Kids(),
            Women(),
            Men(),
          ],
        ),
      ),
    );
  }
}

class Men extends StatefulWidget {
  @override
  _MenState createState() => _MenState();
}

class _MenState extends State<Men> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Wrap(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    height: 240,
                    width: 440,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/man2.png"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ),
                    child: FlatButton(
                      padding: EdgeInsets.all(0.0),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return alldata();
                        }));
                      },
                    ),
                  ),
                  Container(
                      child: RichText(
                    text: TextSpan(
                      text: "#Shop By ",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Category',
                          style: TextStyle(
                            color: Colors.black,
                            height: 2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MenTshirt();
                }));
              },
              child: Column(
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 100,
                    margin: EdgeInsets.only(right: 5, left: 20),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/men/tshirt.jpg")),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MenShirts();
                }));
              },
              child: Column(
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 100,
                    margin: EdgeInsets.only(right: 5, left: 20),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/men/shirt.jpg")),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  width: 180,
                  height: 100,
                  margin: EdgeInsets.only(right: 5, left: 20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/men/sweat.jpg")),
                    //borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  width: 180,
                  height: 100,
                  margin: EdgeInsets.only(right: 5, left: 25),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/men/mco.jpg")),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  width: 180,
                  height: 100,
                  margin: EdgeInsets.only(right: 5, left: 20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/men/pens.jpg")),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  width: 180,
                  height: 100,
                  margin: EdgeInsets.only(right: 5, left: 20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/men/jaket.jpg")),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  width: 180,
                  height: 100,
                  margin: EdgeInsets.only(right: 5, left: 20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/men/jens.jpg")),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  width: 180,
                  height: 100,
                  margin: EdgeInsets.only(right: 5, left: 20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/men/shoes.jpg")),
                    //borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class Women extends StatefulWidget {
  @override
  _WomenState createState() => _WomenState();
}

class _WomenState extends State<Women> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Wrap(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    height: 240,
                    width: 440,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/women/women11.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ),
                    child: FlatButton(
                      padding: EdgeInsets.all(0.0),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return allwomen();
                        }));
                      },
                    ),
                  ),
                  Container(
                      child: RichText(
                    text: TextSpan(
                      text: "#Shop By ",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Category',
                          style: TextStyle(
                            color: Colors.black,
                            height: 2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Wdress();
                }));
              },
              child: Column(
                children: <Widget>[
                  Container(
                    width: 170,
                    height: 100,
                    margin: EdgeInsets.only(right: 5, left: 25),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/women/dress.jpg")),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Wseater();
                }));
              },
              child: Column(
                children: <Widget>[
                  Container(
                    width: 170,
                    height: 100,
                    margin: EdgeInsets.only(right: 5, left: 25),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/women/sweat.jpg")),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  width: 170,
                  height: 100,
                  margin: EdgeInsets.only(right: 5, left: 25),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/women/tshirt.jpg")),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  width: 170,
                  height: 100,
                  margin: EdgeInsets.only(right: 5, left: 25),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/women/blose.jpg")),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  width: 170,
                  height: 100,
                  margin: EdgeInsets.only(right: 5, left: 25),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/women/bottom.jpg")),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  width: 170,
                  height: 100,
                  margin: EdgeInsets.only(right: 5, left: 25),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/women/denm.jpg")),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class Kids extends StatefulWidget {
  @override
  _KidsState createState() => _KidsState();
}

class _KidsState extends State<Kids> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Wrap(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    height: 240,
                    width: 440,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/kids/kids.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ),
                    child: FlatButton(
                      padding: EdgeInsets.all(0.0),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return allkidsdata();
                        }));
                      },
                    ),
                  ),
                  Container(
                      child: RichText(
                    text: TextSpan(
                      text: "Shop By ",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Category',
                          style: TextStyle(
                            color: Colors.black,
                            height: 2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Boys();
                }));
              },
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 25, right: 5),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/kids/boys.jpg"),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0, left: 25, right: 5),
                    child: Text(
                      'Boys',
                      style: TextStyle(
                        height: 2,
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Girls();
                }));
              },
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 35, right: 5),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/kids/girls.jpg"),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0, left: 40, right: 5),
                    child: Text(
                      'Girls',
                      style: TextStyle(
                        height: 2,
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20, left: 35, right: 1),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/kids/tgirls.jpg"),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0, left: 40, right: 5),
                  child: Text(
                    'Toddler Girls',
                    style: TextStyle(
                      height: 2,
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20, left: 25, right: 5),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/kids/tboys.jpg"),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0, left: 25, right: 5),
                  child: Text(
                    'Toddler Boys',
                    style: TextStyle(
                      height: 2,
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20, left: 35, right: 5),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/kids/baby.jpg"),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0, left: 40, right: 5),
                  child: Text(
                    'Babies',
                    style: TextStyle(
                      height: 2,
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20, left: 35, right: 1),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/kids/shoes.jpg"),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0, left: 40, right: 5),
                  child: Text(
                    'Shoes',
                    style: TextStyle(
                      height: 2,
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
