import 'package:flutter/material.dart';
import 'package:travel_app_flutter/pages/home_page.dart';
import 'package:travel_app_flutter/pages/navPages/my_page.dart';
import 'package:travel_app_flutter/pages/navPages/search_page.dart';

import 'bar_item_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    const HomePage(),
    const BarItemPage(),
    const SearchPage(),
    const MyPage(),
  ]; // list of pages to be routed by the NavBar
  int currentIndexSelected = 0;
  void onTap(int index) {
    setState(() {
      // to set the state of the current selected NavBar
      currentIndexSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndexSelected],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize:
            0, // so we wont get an error when we tounch the bottom of the NavBar
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: true,
        elevation: 0, // to delete the line of the BottomNavBar
        currentIndex: currentIndexSelected,
        onTap:
            onTap, // using the onTap function from above to pass the current index tp 'currentIndex: ' property,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              label: "Home" /*label is a required attribute of BottomNavBar */),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_sharp), label: "Bar"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
              activeIcon: Text("Search?") /* after being touched */),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "My"),
        ],
      ),
    );
  }
}
