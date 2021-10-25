import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spicy_food_delivery/Utils/Const.dart';

class RateCardScreen extends StatefulWidget {
  @override
  _RateCardScreenState createState() => _RateCardScreenState();
}

class _RateCardScreenState extends State<RateCardScreen> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Rate card",
          style: HeadingTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FirstTab(),
              SizedBox(
                height: 15,
              ),
              OrderPayHead(),
              OrderPay(),
              SizedBox(
                height: 15,
              ),
              WeeklyTargetHead(),
              WeeklyTarget(),
              SizedBox(
                height: 15,
              ),
              SurgePayHead(),
              SurgePay(),
              SizedBox(
                height: 15,
              ),
              Other(),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget FirstTab() {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: DropdownButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    size: 18,
                  ),
                  underline: SizedBox(),
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
                      child: Text(
                        "Second Item",
                        style: smallBlackText,
                      ),
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
            decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border(
                    left: BorderSide(color: Colors.grey[400], width: 1))),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: DropdownButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    size: 18,
                  ),
                  underline: SizedBox(),
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
      ],
    );
  }

  Widget OrderPayHead() {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellow[700],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order Pay",
                          style: profileTextBold,
                        ),
                        Text(
                          "Earnings per year",
                          style: subTextStyleSmall,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Color(0xffFFF7EA),
          border: Border.all(color: Colors.grey[300]),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10)),
        ));
  }

  Widget OrderPay() {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]),
          borderRadius: bottomRadius,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "10",
                        style: HeadingTextStyle,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "per pickup",
                    style: subTextStyleSmall,
                  )
                ],
              ),
              Text(
                "+",
                style: TextStyle(fontSize: 25, color: Color(0xff848891)),
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("15", style: HeadingTextStyle),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "per pickup",
                    style: subTextStyleSmall,
                  )
                ],
              ),
              Text(
                "=",
                style: TextStyle(fontSize: 25, color: Color(0xff848891)),
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("0", style: HeadingTextStyle),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "per pickup",
                    style: subTextStyleSmall,
                  )
                ],
              ),
            ],
          ),
        ));
  }

  Widget WeeklyTargetHead() {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Weekly Target Pay",
                          style: profileTextBold,
                        ),
                        Text(
                          "For reaching touchpoint targets",
                          style: subTextStyleSmall,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Color(0xffEAF7F0),
          border: Border.all(color: Colors.grey[300]),
          borderRadius: topRadius,
        ));
  }

  Widget WeeklyTarget() {
    return Column(
      children: [
        WeeklyTarget1(),
      ],
    );
  }

  Widget WeeklyTarget1() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: bottomRadius,
        border: Border.all(color: Colors.grey[300]),
      ),
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Weekly Target",
                      style: subTextStyleSmallBalck,
                    ),
                    Text(
                      "Mon - Sun (12am - 11:59 pm)",
                      style: subTextStyleSmall,
                    )
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  alignment: Alignment.center,
                  // width: 60,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          "Up to  ",
                          style: subTextStyle,
                        ),
                        Text(rs + "1200", style: subTextStyleSmallBalck),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          TimelineWidget(),
          WeeklyTarget3()
        ],
      ),
    );
  }

  Widget WeeklyTarget3() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffEAF7F0),
        borderRadius: bottomRadius,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Conditions",
              style: subTextStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "1 Denials",
              style: subTextStyle,
            ),
            Text(
              "0 Cancelations",
              style: subTextStyle,
            ),
            Text(
              "0 Food not deliered",
              style: subTextStyle,
            )
          ],
        ),
      ),
    );
  }

  Widget TimelineWidget() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 60,
        child: Row(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Target Pay",
                      style: subTextStyleSmall,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Line()),
                    Text(
                      "Touchpoints",
                      style: subTextStyleSmall,
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      rs + "300",
                      style: subTextStyleSmall,
                    ),
                    Dot(),
                    Text(
                      "100",
                      style: subTextStyleSmall,
                    )
                  ],
                ),
                Line(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      rs + "800",
                      style: subTextStyleSmall,
                    ),
                    Dot(),
                    Text(
                      "150",
                      style: subTextStyleSmall,
                    )
                  ],
                ),
                Line(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      rs + "800",
                      style: subTextStyleSmall,
                    ),
                    Dot(),
                    Text(
                      "200",
                      style: subTextStyleSmall,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget Line() {
    return Container(
      height: 3,
      width: MediaQuery.of(context).size.width * 0.1,
      color: Colors.grey[300],
    );
  }

  Widget Dot() {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green),
      height: 15,
      width: 15,
    );
  }

  Widget SurgePayHead() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: topRadius,
        border: Border.all(color: Colors.grey[300]),
        color: Color(0xffEAF7F0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red[400],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Surge pay",
                        style: profileTextBold,
                      ),
                      Text(
                        "For reaching touchpoint targets",
                        style: subTextStyleSmall,
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget SurgePay() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        // color: Color(0xffEAF7F0),
        borderRadius: bottomRadius,
        border: Border.all(color: Colors.grey[300]),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Text("Incentive"),
                Spacer(),
                Text("Up to" + rs + "1200")
              ],
            ),
            Row(
              children: [
                DropdownButton(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: 15,
                      color: Colors.red,
                    ),
                    isDense: true,
                    underline: SizedBox(),
                    value: _value,
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          "4 Slots",
                          style: TextStyle(fontSize: 12, color: Colors.red),
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
                Spacer(),
                Text(
                  "Per drop",
                  style: subTextStyleSmall,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget Other() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: DropdownButton(
            icon: Icon(
              Icons.keyboard_arrow_down,
              size: 16,
            ),
            isExpanded: true,
            isDense: true,
            underline: SizedBox(),
            value: _value,
            items: [
              DropdownMenuItem(
                child: Text(
                  "Other",
                  style: subTextStyleSmallBalck,
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
}
