import 'package:flutter/material.dart';
import 'package:spicy_food_delivery/TripHistoryTabs/TripHistoryDailyTab.dart';
import 'package:spicy_food_delivery/Utils/Const.dart';

class TripHistory extends StatefulWidget {
  @override
  _tripHistoryState createState() => _tripHistoryState();
}

class _tripHistoryState extends State<TripHistory> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          actions: [
            IconButton(
                visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                icon: Padding(
                  padding: EdgeInsets.zero,
                  child: Icon(
                    Icons.help_outline,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {}),
            IconButton(
                visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                icon: Padding(
                  padding: EdgeInsets.zero,
                  child: Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => NewOrders()),
                  // );
                })
          ],
          title: Row(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              SizedBox(
                width: 5,
              ),
              Text(
                "Trip History",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 2,
                    color: themeRed,
                  ),
                ),
                isScrollable: true,
                indicatorColor: themeRed,
                onTap: (index) {
                  // Tab index when user select it, it start from zero
                },
                tabs: [
                  Tab(
                    child: Text(
                      "Daily",
                      style: redText,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Weekly",
                      style: redText,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Monthly",
                      style: redText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            TripHisDaily(),
            Center(
                child: Text(
              "Weekly",
              style: TextStyle(fontSize: 40),
            )),
            Center(
                child: Text(
              "Monthly",
              style: TextStyle(fontSize: 40),
            )),
          ],
        ),
      ),
    );
  }
}
