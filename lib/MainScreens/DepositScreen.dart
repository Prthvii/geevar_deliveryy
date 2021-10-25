import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:spicy_food_delivery/Screens/DepositAtStoreScreen.dart';
import 'package:spicy_food_delivery/Utils/Const.dart';

class DepositScreen extends StatefulWidget {
  @override
  _DepositScreenState createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  double _progress = 0;
  double _lowerValue = 50;
  double _upperValue = 180;
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        // actions: [
        //   IconButton(
        //       visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
        //       icon: Padding(
        //         padding: EdgeInsets.zero,
        //         child: Icon(
        //           Icons.help_outline,
        //           color: Colors.black,
        //         ),
        //       ),
        //       onPressed: () {}),
        //   IconButton(
        //       visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
        //       icon: Padding(
        //         padding: EdgeInsets.zero,
        //         child: Icon(
        //           Icons.notifications_none,
        //           color: Colors.black,
        //         ),
        //       ),
        //       onPressed: () {})
        // ],
        // title: Row(
        //   children: [
        //     CupertinoSwitch(
        //       value: isSwitched,
        //       onChanged: (value) {
        //         setState(() {
        //           isSwitched = value;
        //           print(isSwitched);
        //         });
        //       },
        //       activeColor: themeRed,
        //     ),
        //     SizedBox(
        //       width: 5,
        //     ),
        //     Text(
        //       "Online",
        //       style: TextStyle(color: Colors.black),
        //     ),
        //   ],
        // ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AvailableLimit(),
           // Slider(),
            Divider(),
            CashInHand(),
            Divider(),
            Advbal(),
            Divider(),
            GestureDetector(
              child: Button("Pay by UPI"),
              onTap: () {
                NewBottomSheet();
              },
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DepositAtStore()),
                );
              },
              child: Button("Deposit at store"),
            ),
            Button("Pay by Debit card / Netbanking"),
            Text(
              "Unpaid cash will be deducted from the next payout",
              style: TextStyle(
                  color: Colors.red, fontSize: 12, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 10,
            ),
            Divider()
          ],
        ),
      ),
    );
  }

  Widget AvailableLimit() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Available Limit",
                style: profileText,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "23 Feb, 2021",
                style: subTextStyleSmall,
              )
            ],
          ),
          Spacer(),
          Text(
            rs + "40",
            style: HeadingTextStyle,
          )
        ],
      ),
    );
  }

  Widget Slider() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: FlutterSlider(
          selectByTap: true,
          trackBar: FlutterSliderTrackBar(
              activeTrackBar: BoxDecoration(color: themeRed),
              inactiveTrackBar: BoxDecoration(color: Colors.red[100])),
          handler: FlutterSliderHandler(
            decoration: BoxDecoration(),
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300],
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                  border: Border.all(color: Colors.grey[100]),
                  shape: BoxShape.circle,
                  color: Colors.white),
              padding: EdgeInsets.all(5),
            ),
          ),
          values: [0],
          max: 800,
          fixedValues: [],
          min: 0,
          onDragging: (handlerIndex, lowerValue, upperValue) {
            _lowerValue = lowerValue;
            _upperValue = upperValue;
            setState(() {});
          },
          tooltip: FlutterSliderTooltip(
            format: (String value) {
              return value + ' ! ';
            },
            textStyle: TextStyle(fontSize: 17, color: themeRed),
          )),
    );
  }

  Widget CashInHand() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cash in hand",
                style: profileText,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Deposit cash when you reach limit",
                style: subTextStyleSmall,
              )
            ],
          ),
          Spacer(),
          Text(
            rs + "211.22",
            style: profileText,
          )
        ],
      ),
    );
  }

  Widget Advbal() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Text(
            "Advance balance",
            style: TextStyle(
                color: Colors.grey[400],
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
          Spacer(),
          Text(
            rs + "0",
            style: TextStyle(
                color: Colors.grey[400],
                fontWeight: FontWeight.w500,
                fontSize: 14),
          )
        ],
      ),
    );
  }

  Widget Button(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        alignment: Alignment.center,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Text(label,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              )),
        ),
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  NewBottomSheet() {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        backgroundColor: Colors.white,
        context: context,
        isScrollControlled: true,
        builder: (context) => Stack(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20.0)),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Text(
                              "Enter Amount",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18),
                            ),
                            Spacer(),
                            IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () {
                                  Navigator.pop(context);
                                })
                          ],
                        ),
                      ),
                    ),
                    TextField(
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      // controller:_phoneNumberController ,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        isDense: true,
                        prefixText: "₹ ",
                        contentPadding: EdgeInsets.all(0),
                      ),
                    ),
                    Container(
                      height: 100,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[100]),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              child: Text(
                                "Confirm",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: themeRed),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                          top: 10),
                    ),
                  ],
                ),
              ),
            ]));
  }
}
