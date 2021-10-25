import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spicy_food_delivery/Utils/Const.dart';

class Daily_TripHistory extends StatefulWidget {
  @override
  _Daily_TripHistoryState createState() => _Daily_TripHistoryState();
}

class _Daily_TripHistoryState extends State<Daily_TripHistory> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FilterTab(),
          Padding(
            padding: const EdgeInsets.only(top: 100, bottom: 20),
            child: SvgPicture.asset(
              "assets/images/EmptyBox.svg",
            ),
          ),
          Text(
            "Nothing here yet!",
            style: profileText,
          )
        ],
      ),
    );
  }

  Widget FilterTab() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 30,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border(
                    right: BorderSide(color: Colors.grey[400], width: 1))),
            // height: 50,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: DropdownButton(
                  icon: Icon(Icons.keyboard_arrow_down),
                  underline: SizedBox(),
                  isExpanded: true,
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text(
                        "Today: 23 Feb",
                        style: smallBlackText,
                      ),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("Second Item"),
                      value: 2,
                    ),
                    DropdownMenuItem(child: Text("Third Item"), value: 3),
                    DropdownMenuItem(child: Text("Fourth Item"), value: 4)
                  ],
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  }),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 30,
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: DropdownButton(
                  icon: Icon(Icons.keyboard_arrow_down),
                  underline: SizedBox(),
                  isExpanded: true,
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text(
                        "All Trips",
                        style: smallBlackText,
                      ),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("Second Item"),
                      value: 2,
                    ),
                    DropdownMenuItem(child: Text("Third Item"), value: 3),
                    DropdownMenuItem(child: Text("Fourth Item"), value: 4)
                  ],
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  }),
            ),
          ),
        ),
      ],
    );
  }
}
