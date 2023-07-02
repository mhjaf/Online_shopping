import 'package:flutter/material.dart';
import 'package:test1/screens/kids.dart';
import 'men.dart';
import 'women.dart';

class screen2 extends StatelessWidget {
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
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 80),
            child: Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  text: "H Z ",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
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
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 180,
            width: 350,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/man.jpg"),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: FlatButton(
              padding: EdgeInsets.all(0.0),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return screen3();
                }));
              },
            ),
          ),
          Container(
            height: 180,
            width: 350,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/www.jpg"),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: FlatButton(
              padding: EdgeInsets.only(top: 1),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return screen33();
                }));
              },
            ),
          ),
          Container(
            height: 180,
            width: 350,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/kkk.jpg"),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: FlatButton(
              padding: EdgeInsets.only(top: 1),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return screen333();
                }));
              },
            ),
          ),
        ],
      ),
    );
  }
}
