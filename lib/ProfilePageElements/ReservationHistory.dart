import 'package:flutter/material.dart';
import 'package:spicy_food_delivery/Utils/Const.dart';

class ReservationHis extends StatefulWidget {
  @override
  _ReservationHisState createState() => _ReservationHisState();
}

class _ReservationHisState extends State<ReservationHis> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Reservation History",
          style: HeadingTextStyle,
        ),
      ),
      body: Container(
        child: Column(
          children: [FilterTab(), Text("No Reservations Found")],
        ),
      ),
    );
  }

  Widget FilterTab() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(6)),
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
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(6)),
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
        ),
      ],
    );
  }
}
