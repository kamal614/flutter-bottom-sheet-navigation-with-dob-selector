import 'package:flutter/material.dart';
import 'package:navigations/UI/dob_selector.dart';
import 'package:navigations/UI/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> mainWidgets = <Widget>[
      // const Center(child: Text("Home")),
      const DOBSelector(),
      const Center(child: Text("Activity")),
      const Center(child: Text("Search")),
      const Center(child: Text("Meetings")),
      const Center(child: Text("Profile")),
    ];

    void onItemTap(int index) {
      setState(() {
        selectedIndex = index;
      });
      if (index == 2) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SearchScreen()));
      }
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.graphic_eq), label: "Activity"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Messages"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.pink,
        onTap: onItemTap,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
      ),
      // body: const Center(
      //   child: Text("HOMESCREEN"),
      // ),
      body: mainWidgets.elementAt(selectedIndex),
    );
  }
}
