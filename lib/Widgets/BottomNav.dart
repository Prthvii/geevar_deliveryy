import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spicy_food_delivery/MainScreens/DepositScreen.dart';
import 'package:spicy_food_delivery/MainScreens/FeedsScreen.dart';
import 'package:spicy_food_delivery/MainScreens/PayoutScreen.dart';
import 'package:spicy_food_delivery/MainScreens/ProfileScreen.dart';
import 'package:spicy_food_delivery/Utils/Const.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  final List<Widget> viewContainer = [
    FeedsScreen(),
    Payout(),
    DepositScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: viewContainer[_currentIndex],
        bottomNavigationBar: CustomNavigationBar(
          scaleFactor: 0.5,
          unSelectedColor: Colors.grey,
          strokeColor: Colors.blue,
          elevation: 0,
          iconSize: 25,
          blurEffect: true,
          backgroundColor: Colors.white12,
          key: _bottomNavigationKey,
          currentIndex: _currentIndex,
          onTap: (index) {
            print(index);
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            CustomNavigationBarItem(
              icon: Icon(
                Icons.article_outlined,
                size: 20,
              ),
              selectedIcon: Icon(
                Icons.article_rounded,
                color: themeRed,
              ),
              selectedTitle: Text(
                "Feeds",
                style: TextStyle(color: themeRed, fontWeight: FontWeight.w600),
              ),
              title: Text(
                "Feeds",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ),
            CustomNavigationBarItem(
              selectedTitle: Text(
                "Payout",
                style: TextStyle(color: themeRed, fontWeight: FontWeight.w600),
              ),
              title: Text(
                "Payout",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              icon: Icon(
                FontAwesomeIcons.rupeeSign,
                size: 20,
              ),
              selectedIcon: Icon(
                FontAwesomeIcons.rupeeSign,
                size: 20,
                color: themeRed,
              ),
            ),
            CustomNavigationBarItem(
              selectedTitle: Text(
                "Deposit",
                style: TextStyle(color: themeRed, fontWeight: FontWeight.w600),
              ),
              title: Text(
                "Deposit",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              icon: Icon(
                FontAwesomeIcons.moneyBillAlt,
                size: 20,
              ),
              selectedIcon: Icon(
                FontAwesomeIcons.moneyBill,
                size: 20,
                color: themeRed,
              ),
            ),
            CustomNavigationBarItem(
              selectedTitle: Text(
                "Profile",
                style: TextStyle(color: themeRed, fontWeight: FontWeight.w600),
              ),
              title: Text(
                "Profile",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              icon: Icon(
                Icons.person_outline,
              ),
              selectedIcon: Icon(
                Icons.person,
                color: themeRed,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    HapticFeedback.mediumImpact();
    if (_currentIndex != 0) {
      print("aaaaaaaaaaaaaa");
      setState(() {
        _currentIndex = 0;
        print(_currentIndex);
      });
    } else {
      print("Exit?");
      _showDialog();
    }
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10)),
        elevation: 10,
        title: Text('Confirm Exit!'),
        titleTextStyle: TextStyle(
            fontSize: 16,
            letterSpacing: 0.6,
            color: Color(0xff333333),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold),
        content: Text('Are you sure you want to exit?'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('No'),
          ),
          FlatButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            child: Text('Yes'),
          ),
        ],
      ),
    );
  }
}
