import 'package:codominio_app/screens/alerts/alert_screen.dart';
import 'package:codominio_app/screens/alerts/all_alert_by_user.dart';

import 'package:codominio_app/screens/auth/profile_screen.dart';
import 'package:codominio_app/screens/panic_screen.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const Color inActiveIconColor = Color(0xFFB6B6B6);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentSelectedIndex = 1;

  void updateCurrentIndex(int index) async {
    setState(() {
      currentSelectedIndex = index;
    });
  }

  final pages = [
    const AlertScreen(),
    // const EmergencyScreen(),
    const PanicScreen(),
    const AlertScreeUserAPI(),

    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: pages[currentSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10.2,
        fixedColor: Color.fromARGB(9, 6, 0, 29),
        onTap: updateCurrentIndex,
        currentIndex: currentSelectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.house,
              color: Color.fromRGBO(18, 83, 196, 1),
            ),
            activeIcon: FaIcon(
              FontAwesomeIcons.house,
              color: Color.fromRGBO(18, 83, 196, 1),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.shield,
              color: Color.fromRGBO(18, 83, 196, 1),
            ),
            activeIcon: FaIcon(
              FontAwesomeIcons.shield,
              color: Color.fromRGBO(18, 83, 196, 1),
            ),
            label: "Fav",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.personArrowDownToLine,
              color: Color.fromRGBO(18, 83, 196, 1),
            ),
            activeIcon: FaIcon(
              FontAwesomeIcons.personArrowUpFromLine,
              color: Color.fromRGBO(18, 83, 196, 1),
            ),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.userLock,
              color: Color.fromRGBO(18, 83, 196, 1),
            ),
            activeIcon: FaIcon(
              FontAwesomeIcons.userCheck,
              color: Color.fromRGBO(18, 83, 196, 1),
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
