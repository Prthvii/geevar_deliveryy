import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spicy_food_delivery/Helper/common.dart';
import 'package:spicy_food_delivery/Helper/sharedPref.dart';
import 'package:spicy_food_delivery/Utils/Const.dart';
import 'package:spicy_food_delivery/Widgets/BottomNav.dart';

import 'EnterNumber.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    super.initState();
    this._loadWidget();
  }

  void _loadWidget() async {
    var token = await getSharedPrefrence(Common1.TOKEN);

    print("strId");
    print(token);
    if (token != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNav()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SvgPicture.asset(
                  "assets/images/initial.svg",
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                "Welcome to Geevar Delivery app",
                style: profileText,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Please register or login to continue",
                style: subTextStyle,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 60,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: Button("Register now", Colors.grey[200]),
              ),
              // SizedBox(
              //   width: 15,
              // ),
              Expanded(
                child: Button2("Login", Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }

  Button(String label, color) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        alignment: Alignment.center,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(8), color: color),
        child: Text(
          label,
          style: profileText,
        ),
      ),
    );
  }

  Button2(String label, color) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EnterNum()),
          );
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: color),
          child: Text(
            label,
            style: whiteText,
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    SystemNavigator.pop();
  }
}
