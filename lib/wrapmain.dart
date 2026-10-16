import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/Favorite.dart';
import 'package:grocery_delivery_app/colors.dart';
import 'package:grocery_delivery_app/home.dart';
import 'package:grocery_delivery_app/menu.dart';
import 'package:grocery_delivery_app/profile.dart';
import 'package:grocery_delivery_app/search.dart';

class Wrapmain extends StatefulWidget {
  const Wrapmain({super.key});

  @override
  State<Wrapmain> createState() => _WrapmainState();
}

class _WrapmainState extends State<Wrapmain> {
  int selectedindex = 0;
  List<Widget> screens = [Home(), Favorite(), Search(), Profile(), Menu()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedindex],
      bottomNavigationBar: NavigationBar(
        height: 55,
        backgroundColor: Colors.white,
        indicatorColor: Colors.transparent,
        indicatorShape: Border(top: BorderSide(color: AppColor.primary, width: 2.5)),
        selectedIndex: selectedindex,
        onDestinationSelected: (value) {
          setState(() {
            selectedindex = value;
          });
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home, color: AppColor.primary,), label: "Home"),
          NavigationDestination(icon: Icon(Icons.favorite_border), selectedIcon: Icon(Icons.favorite, color: AppColor.primary,), label: "Favorite"),
          NavigationDestination(icon: Icon(Icons.search),selectedIcon: Icon(Icons.search, color: AppColor.primary,), label: "Search"),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person, color: AppColor.primary,), label: "Profile"),
          NavigationDestination(icon: Icon(Icons.menu), selectedIcon: Icon(Icons.menu, color: AppColor.primary,), label: "Menu")
        ],
      ),
    );
  }
}

