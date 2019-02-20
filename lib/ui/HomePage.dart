import 'package:flutter/material.dart';
import 'package:nicehash/ui/DashboardPage.dart';
import 'package:nicehash/ui/SettingsPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nicehash Monitor",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: bodySelector(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.insert_chart), title: Text("Dashboard")),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text("Settings"))
        ],
        onTap: (int index) => onItemTap(index),
        currentIndex: selectedIndex,
      ),
    );
  }

  onItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  bodySelector() {
    switch (selectedIndex) {
      case 0:
        return DashboardPage();
      case 1:
        return SettingsPage();
    }
  }
}
