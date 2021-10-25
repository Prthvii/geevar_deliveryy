import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:spicy_food_delivery/Utils/Const.dart';

class SessionHistory extends StatefulWidget {
  @override
  _SessionHistoryState createState() => _SessionHistoryState();
}

class _SessionHistoryState extends State<SessionHistory> {
  CountDownController _controller = CountDownController();
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
          "Session History",
          style: HeadingTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              FilterTab(),
              Timer(),
              Points(),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: Colors.grey[400],
              ),
              SessionTime(),
              Divider(
                color: Colors.grey[400],
              ),
              SessionsList()
            ],
          ),
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

//TODO  check this link https://pub.dev/packages/circular_countdown_timer/example
  Widget Timer() {
    return CircularCountDownTimer(
      duration: 50,
      initialDuration: 0,
      controller: _controller,
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 2,
      ringColor: Colors.green,
      ringGradient: null,
      fillColor: Colors.grey[400],
      fillGradient: null,
      backgroundGradient: null,
      strokeWidth: 10.0,
      strokeCap: StrokeCap.round,
      textStyle: TextStyle(
          fontSize: 33.0, color: Colors.black, fontWeight: FontWeight.bold),
      textFormat: CountdownTextFormat.MM_SS,
      isReverse: false,
      isReverseAnimation: false,
      isTimerTextShown: true,
      autoStart: true,
      onStart: () {
        print('Countdown Started');
      },
      onComplete: () {
        print('Countdown Ended');
      },
    );
  }

  Widget Points() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                "0% Idle",
                style: redTextStyle,
              ),
              Text(
                "For the day",
                style: subTextStyleSmall,
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                "0 Touchpoints",
                style: TextStyle(
                    color: Colors.yellow[600],
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "For the day",
                style: subTextStyleSmall,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget SessionTime() {
    return Row(
      children: [
        Expanded(
          child: Text(
            "Sessions",
            textAlign: TextAlign.center,
            style: subTextStyle,
          ),
        ),
        Expanded(
          child: Text(
            "Time range",
            textAlign: TextAlign.center,
            style: subTextStyle,
          ),
        ),
        Expanded(
          child: Text(
            "Hours",
            textAlign: TextAlign.center,
            style: subTextStyle,
          ),
        ),
      ],
    );
  }

  Widget SessionsList() {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, index) => SizedBox(
        height: 15,
      ),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Sessions(index);
      },
    );
  }

  Sessions(int index) {
    return Row(
      children: [
        Expanded(
          child: Text(
            "Session 1",
            textAlign: TextAlign.center,
            style: subTextStyleSmallBalck,
          ),
        ),
        Expanded(
            child: Text(
          "11:33 PM - In progress",
          textAlign: TextAlign.center,
          style: subTextStyleSmallBalck,
        )),
        Expanded(
            child: Text(
          "00:00:24",
          textAlign: TextAlign.center,
          style: subTextStyleSmallBalck,
        )),
      ],
    );
  }
}
