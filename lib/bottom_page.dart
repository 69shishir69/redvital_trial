
import 'package:email_password_login/screens/home_screen.dart';
import 'package:email_password_login/screens/profile/components/image_upload.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_password_login/blood_request.dart';
import 'package:email_password_login/home_page.dart';
import 'package:email_password_login/screens/profile/profile_screen.dart';

import 'blood_banks.dart';
import 'hospitals.dart';
import 'model/user_model.dart';

class BottomPage extends StatefulWidget {
  var index;

  BottomPage({Key? key, required this.index}) : super(key: key);
  @override
  _BottomPageState createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  // int selectedIndex = widget.index;

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOption = <Widget>[
    HomePage(),

    BloodBanks(),

    BloodRequest(),

    Hospital(),

    ProfileScreen(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      widget.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0c0f14),
      body: Center(
        child: _widgetOption.elementAt(widget.index),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          elevation: 0.0,
          backgroundColor: Color(0xff0c0f14),
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_balance_rounded,
                size: 30,
              ),
              label: "Blood Bank",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bloodtype,
                size: 30,
              ),
              label: "Find Blood",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.local_hospital,
                size: 30,
              ),
              label: "notifications",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              label: "Settings",
            ),
          ],
          currentIndex: widget.index,
          unselectedItemColor: Color(0xff4e5053),
          selectedItemColor: Color(0xffd17842),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
