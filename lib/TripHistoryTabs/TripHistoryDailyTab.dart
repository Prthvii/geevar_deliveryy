import 'package:flutter/material.dart';
import 'package:spicy_food_delivery/TripHistoryTabs/Daily_TripHis.dart';
import 'package:spicy_food_delivery/Utils/Const.dart';

class TripHisDaily extends StatefulWidget {
  @override
  _TripHisDailyState createState() => _TripHisDailyState();
}

class _TripHisDailyState extends State<TripHisDaily> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
            "Trip History",
            style: HeadingTextStyle,
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: themeRed,
                labelStyle: redText,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 2,
                    color: themeRed,
                  ),
                ),
                isScrollable: true,
                indicatorColor: themeRed,
                unselectedLabelColor: Colors.grey,
                onTap: (index) {
                  // Tab index when user select it, it start from zero
                },
                tabs: [
                  Tab(
                    text: "Daily",
                  ),
                  Tab(
                    text: "Weekly",
                  ),
                  Tab(
                    text: "Monthly",
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Daily_TripHistory(),
            Daily_TripHistory(),
            Daily_TripHistory(),
          ],
        ),
      ),
    );
  }
}
