import 'package:JobFinderApp/LoginScreen/SignInScreen.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_sample/pages/home_page.dart';

class StartPage extends StatefulWidget {
  StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("JobFinder"),
      ),
      body: new ListView(
        children: <Widget>[
          Center(
            child: Container(
              //margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              color: Colors.pink[50],
              //width: 300.0,
              height: 600.0,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
              alignment: Alignment.center,
              child: Column(children: <Widget>[
                Image.asset('images/label.jpg', height: 200),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("User Type:",
                      style: TextStyle(
                          fontSize: 35,
                          //letterSpacing: 0,
                          color: Colors.black54,
                          fontWeight: FontWeight.w800)),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new RaisedButton(
                      padding: const EdgeInsets.all(12.0),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                        );
                      },
                      child: new Text(
                        "Employer",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    new RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                        );
                      },
                      textColor: Colors.white,
                      color: Colors.red,
                      padding: const EdgeInsets.all(12.0),
                      child: new Text(
                        "Finder",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
