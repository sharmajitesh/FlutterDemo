import 'package:HT_ONE/Home/Screen/PremiumScreen.dart';
import 'package:HT_ONE/Home/Screen/Check.dart';
import 'package:flutter/material.dart';
import 'package:HT_ONE/Home/Controller/HomeScreen.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({super.key});

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}
class _BottomTabBarState extends State<BottomTabBar> {

  int selectedTabIndex = 0;

  static List<Widget> tabs = <Widget>[
    Center(child: HomeScreen()),
    Center(child: Premiumscreen()),
    Center(child: Text('Shopping Page', style: TextStyle(fontSize: 24))),
    // Center(child: Text('Messages Page', style: TextStyle(fontSize: 24))),
    // Center(child: Text('Shopping Page', style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.workspace_premium_sharp), label: 'Premium'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Shopping'),
          // BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Explore'),
          // BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Shopping'),
        ],
        currentIndex: selectedTabIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
        elevation: 8.0,
        // backgroundColor: Color.fromRGBO(34, 34, 34, 0.3),
      ),
    );
  }
}
