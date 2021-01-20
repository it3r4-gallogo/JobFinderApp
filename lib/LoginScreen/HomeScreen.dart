import 'package:flutter/material.dart';
//import 'package:flutter_sample/pages/home_page.dart';
//import 'LoginScreen/SignUpScreen.dart';
//import 'LoginScreen/SignInScreen.dart';
import 'package:JobFinderApp/LoginScreen/SignInScreen.dart';
import 'package:JobFinderApp/LoginScreen/SignUpScreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JobFinder ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: 'SignIn',
      routes: {
        'SignIn': (context) => SignInScreen(),
        'SignUp': (context) => SignUpScreen(),
        'Home': (context) => HomeScreen(),
      },
    );
  }
}
