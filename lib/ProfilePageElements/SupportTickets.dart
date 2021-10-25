import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spicy_food_delivery/Utils/Const.dart';

class SupportTickets extends StatefulWidget {
  @override
  _SupportTicketsState createState() => _SupportTicketsState();
}

class _SupportTicketsState extends State<SupportTickets> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        automaticallyImplyLeading: false,
        title: Row(children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Text(
            "Support Tickets",
            style: HeadingTextStyle,
          ),
        ]),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.pen,
                  color: Colors.green,
                ),
                Text(
                  "New Ticket",
                  style: TextStyle(color: Colors.green),
                )
              ],
            ),
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: double.infinity,
                child: FirstTab()),
            Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.tickets,
                    color: Colors.red,
                    size: MediaQuery.of(context).size.width * 0.3,
                  ),
                  Text(
                    "No tickets found",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Try different dates or status",
                    style: subTextStyleBig,
                  )
                ],
              ),
              alignment: Alignment.center,
            )
          ],
        ),
      ),
    );
  }

  Widget FirstTab() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey[200],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5)),
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
                          "Utran, Surat",
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
