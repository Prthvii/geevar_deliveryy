import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:spicy_food_delivery/Utils/Const.dart';

class OrderPrf extends StatefulWidget {
  @override
  _OrderPrfState createState() => _OrderPrfState();
}

class _OrderPrfState extends State<OrderPrf> {
  double _progress = 0;
  double _lowerValue = 50;
  double _upperValue = 180;
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Order Preference",
          style: HeadingTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Wrap(
            runSpacing: 20,
            children: [
              PreferedLoc(),
              Locality(),
              LocationsEdit(),
              Tile("Preferred Skills", () {}),
              ListTile(
                onTap: () {},
                title: Text(
                  "Reservations",
                  style: profileText,
                ),
                trailing: CupertinoSwitch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {});
                  },
                  activeColor: themeRed,
                ),
              ),
              Tile("Bootcash", () {}),
              Slider()
            ],
          ),
        ),
      ),
    );
  }

  Widget PreferedLoc() {
    return Text(
      "Preferred Localities",
      style: HeadingTextStyle,
    );
  }

  Widget Locality() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Default Locality",
              style: subTextStyleSmall,
            ),
            Spacer(),
            Text(
              "KK Nagar, Madurai",
              style: profileText,
            )
          ],
        ),
        Divider(
          color: Colors.grey[400],
        ),
        Row(
          children: [
            Text(
              "Cross Locality",
              style: subTextStyleSmall,
            ),
            Spacer(),
            CupertinoSwitch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {});
              },
              activeColor: themeRed,
            ),
          ],
        ),
      ],
    );
  }

  Widget LocationsEdit() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListView.separated(
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 5,
                  ),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return PlaceName(index);
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 1,
            child: Text(
              "Edit",
              style: redTextStyle,
            ),
          )
        ],
      ),
    );
  }

  PlaceName(int index) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.grey[200]),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Text(
          "Avaniyapuram , Madurai",
          style: subTextStyleSmall,
        ),
      ),
    );
  }

  // Widget NewTiles() {
  //   return ListView(
  //     children: [
  //       Tile("Preferred Skills", () {}),
  //       ListTile(
  //         onTap: () {},
  //         title: Text(
  //           "Reservations",
  //           style: profileText,
  //         ),
  //         trailing: CupertinoSwitch(
  //           value: isSwitched,
  //           onChanged: (value) {
  //             setState(() {});
  //           },
  //           activeColor: themeRed,
  //         ),
  //       ),
  //       Tile("Bootcash", () {}),
  //     ],
  //   );
  // }

  Widget Tile(String label, GestureTapCallback onTap) {
    return ListTile(
      onTap: onTap,
      title: Text(
        label,
        style: profileText,
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
}
