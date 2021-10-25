import 'package:flutter/material.dart';
import 'package:spicy_food_delivery/Utils/Const.dart';

class MonthlyPayout extends StatefulWidget {
  @override
  _MonthlyPayoutState createState() => _MonthlyPayoutState();
}

class _MonthlyPayoutState extends State<MonthlyPayout> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FirstTab(),
        Text("Bar graph here"),
        PerformanceThisWeek(),
        TripsLoginTouchPoints(),
        EarningForThisWeek()
      ],
    );
  }

  FirstTab() {
    return Container(
      // height: 50,
      width: double.infinity,
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: DropdownButton(
            isExpanded: true,
            icon: Icon(Icons.keyboard_arrow_down),
            underline: SizedBox(),
            value: _value,
            items: [
              DropdownMenuItem(
                child: Text(
                  "Today: 23 Feb",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
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
    );
  }

  PerformanceThisWeek() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Text(
            "Performance for this month",
            style: profileText,
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => TripHistory()),
              // );
            },
            child: Container(
              child: Row(
                children: [
                  Text(
                    "See trips",
                    style: redText,
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: themeRed,
                    size: 18,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  TripsLoginTouchPoints() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400]),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: Text(
                          "0",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ),
                    ),
                    Text(
                      "Trips",
                      style: subTextStyleSmall,
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[400]),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: [
                    Container(
                      // alignment: Alignment.center,
                      // width: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: Text(
                          "0.0",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ),
                    ),
                    Text(
                      "Login hours",
                      style: subTextStyleSmall,
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400]),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: Text(
                          "0",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ),
                    ),
                    Text(
                      "Touchpoints",
                      style: subTextStyleSmall,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  EarningForThisWeek() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EarningsToday(),
            OrderPay(),
          ],
        ),
      ),
    );
  }

  EarningsToday() {
    return Container(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Earnings for this month",
                    style: profileText,
                  ),
                  Spacer(),
                  Text(
                    rs + "40",
                    style: profileText,
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "Earnings for last tuesday",
                    style: subTextStyleSmall,
                  ),
                  Spacer(),
                  Text(
                    rs + "40",
                    style: subTextStyleSmall,
                  )
                ],
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10)),
        ));
  }

  OrderPay() {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey[300])),
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellow,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.shopping_bag_outlined),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order Pay",
                          style: subTextStyleSmallBalck,
                        ),
                        Text(
                          "Earnings per day",
                          style: subTextStyleSmall,
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(rs + "40",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600))
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.shopping_bag_outlined),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Target Pay", style: subTextStyleSmallBalck),
                        Text(
                          "For reaching touchpoint targets",
                          style: subTextStyleSmall,
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(rs + "40",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
