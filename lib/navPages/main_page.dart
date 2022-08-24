import 'package:flutter/material.dart';
import 'package:travel_app_flutter/navPages/home_page.dart';
import 'package:travel_app_flutter/navPages/my_page.dart';
import 'package:travel_app_flutter/navPages/search_page.dart';

import 'bar_item_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
   const BarItemPage(),
    const SearchPage(),
    const MyPage(),
  ];
  int currentIndexSelected = 0;
  void onTap(int index){
    setState(() {
      currentIndexSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndexSelected],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0, // to delete the line of the BottomNavBar
       currentIndex: currentIndexSelected,
       onTap: onTap,
        items:   const [
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Home" /*label is a required attribute of BottomNavBar */),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart_sharp), label: "Bar" ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search", activeIcon: Text("Search?") /* after being touched */  ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "My"  ),
        ],
      ),
    );
  }
}