import 'package:JobFinderApp/Screen/starting_page.dart';
import 'package:flutter/material.dart';
//import 'package:JobFinder/LoginScreen/SignInScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Job Finder',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: StartPage());
  }
}
