import 'package:animate_do/animate_do.dart';
import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../screens/cart.dart';
import '../screens/home.dart';
import '../screens/search.dart';
import '../utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeIn(
          delay: const Duration(milliseconds: 300),
          child: const Text(
            "Home",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
            size: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              LineIcons.search,
              color: Colors.black,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(
                LineIcons.shoppingBag,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Cart(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: const Home(),
      bottomNavigationBar: BottomBarBubble(
        color: primaryColor,
        selectedIndex: 0,
        items: [
          BottomBarItem(iconData: Icons.home),
          BottomBarItem(iconData: Icons.explore),
          BottomBarItem(iconData: Icons.settings),
          BottomBarItem(iconData: Icons.mail),
        ],
        onSelect: (index) {},
      ),
    );
  }
}
