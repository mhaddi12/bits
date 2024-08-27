import 'package:bits/views/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'newcontact.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  List<Widget> screen=[
    HomeScreen(),
    NewContactScreen(),
    Setting()

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(_selectedIndex==0){
        //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
      }
      else if(_selectedIndex==1){
        //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        //  fixedColor: Colors.grey,
        selectedItemColor: Colors.orangeAccent
        ,
        items:  [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'New Contact',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        // Optionally, you can add a `currentIndex` and `onTap` callback to handle item selection.
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: screen[_selectedIndex],
    );
  }
}
