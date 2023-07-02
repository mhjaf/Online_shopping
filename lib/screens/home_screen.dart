import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:test1/Account/login_screen.dart';
import 'package:test1/Account/signup_screen.dart';
import 'package:test1/screens/men.dart';
import 'package:video_player/video_player.dart';
import 'package:test1/screens/category_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('videos/vee2.mp4')
      ..initialize().then((_) {
        _controller.play();
        _controller.setVolume(0.0);
        _controller.setLooping(true);
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size?.width ?? 0,
                  height: _controller.value.size?.height ?? 0,
                  child: VideoPlayer(_controller),
                ),
              ),
            ),
            LoginWidget(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Center(
                child: Text(
                  '',
                  style: TextStyle(
                    height: 2,
                    letterSpacing: 9,
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              width: 300,
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: const Alignment(0.0, 0.9),
                  child: CupertinoButton(
                    color: Colors.black,
                    child: Text(
                      'Sign In',
                    ),
                    onPressed: () {
                      var route = new MaterialPageRoute(
                        builder: (BuildContext context) => Tabs(),
                      );
                      Navigator.of(context).push(route);
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 40, top: 5),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FlatButton(
                color: Colors.transparent,
                splashColor: Colors.black26,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.white,
                        width: 2,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(50)),
                minWidth: 300,
                height: 45,
                child: Text(
                  'Create an Account',
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
                onPressed: () {
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) => Tabs2(),
                  );
                  Navigator.of(context).push(route);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
