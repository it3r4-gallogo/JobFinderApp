import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'account_page.dart';
import '../UserView.dart';
import 'job_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  List<Widget> _screens = [UserView(), Job(), Account()];

  int _selectedIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(onTap: _onItemTapped, items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
            ),
            title: Text(
              'Dashboard',
              style: TextStyle(
                color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
              ),
            )),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
            ),
            title: Text("Job i'm in",
                style: TextStyle(
                  color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
                ))),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
            ),
            title: Text('Account',
                style: TextStyle(
                  color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
                ))),
      ]),
    );
  }
}
