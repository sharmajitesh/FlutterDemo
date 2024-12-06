import 'package:flutter/material.dart';

const HT100List = [
  {
    "tabTitle": "HT @100",
    "icon": Icons.newspaper,
    "url": "https://www.hindustantimes.com/100-years-of-hindustan-times/?platform=app",
  },
  {
    "tabTitle": "HT @100 Photo Contest",
    "icon": Icons.camera_alt_outlined,
    "url": "https://www.hindustantimes.com/100-years-of-hindustan-times/my-country-my-lens-photo-contest",
  },
];

class HT100 extends StatefulWidget {
  @override
  _HT100State createState() => _HT100State();
}

class _HT100State extends State<HT100> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: HT100List.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HT @100"),
        bottom: TabBar(
          controller: _tabController,
          tabs: HT100List.map((tab) {
            return Tab(
              text: tab["tabTitle"] as String,
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: HT100List.map((tab) {
          return MaterialApp(
            home: Scaffold(
              appBar: AppBar(title: Text(tab["tabTitle"] as String)),
              body: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/check");
                  },
                  child: Text("Open ${tab["tabTitle"]}"),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
