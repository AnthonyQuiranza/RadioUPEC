import 'package:flutter/material.dart';

import 'fav_radios_page.dart';
import 'radio_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _childern = [
    new RadioPage(isFavouriteOnly: false),
    FavRadiosPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: Scaffold(
        body: _childern[_currentIndex],
        
      ),
    );
  }


  void onTabTapped(int index) {
    // Error : setState method called after dispose()?
    if (!mounted) return;
    setState(() {
      _currentIndex = index;
    });
  }
}
