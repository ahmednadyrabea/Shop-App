import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/widgets/bottem_nav/cart_sc2.dart';
import 'package:shop/widgets/bottem_nav/home_sc1.dart';
import 'package:shop/widgets/bottem_nav/me_sc3.dart';

import 'view//auth/sign_in.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> screens = [
    Screen1(),
    Screen2(),
    Screen3(),
  ];
  FirebaseAuth auth = FirebaseAuth.instance;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (val) {
            setState(() {
              index = val;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_shopping_cart), label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Me'),
          ],
        ),
        body: screens[index]);
  }
}
