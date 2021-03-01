import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/indo.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/prov.dart';
import 'package:flutter_application_1/screens/glob.dart';
import 'package:flutter_application_1/config/palette.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List _screens = [
    Home(),
    Indo(),
    TableGlobal(),
    TableIndonesia(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Beranda'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            title: Text('Indonesia'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.functions),
            title: Text('Global'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text('Provinsi'),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blueGrey[900],
      ),
    );
  }
}
