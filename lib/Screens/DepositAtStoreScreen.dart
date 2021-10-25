import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spicy_food_delivery/Utils/Const.dart';

class DepositAtStore extends StatefulWidget {
  @override
  _DepositAtStoreState createState() => _DepositAtStoreState();
}

class _DepositAtStoreState extends State<DepositAtStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        backgroundColor: Colors.white,
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
              "Deposit at airtel store",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Wrap(
            runSpacing: 15,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Share your FEID with the Airtel Merchant",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ),
              DottedBox(),
              Text(
                "How it works",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              HowItWorksRow(
                  "1", "Provide FE ID and Login Phone Number at Store"),
              HowItWorksRow("2", "Handover cash to the Store person"),
              HowItWorksRow("3", "You will recieve OTP in your Phone number"),
              HowItWorksRow("4",
                  "Check the amount and if correct, give OPT to The store Person "),
              HowItWorksRow("5", "Payment confirmation will be sent via SMS"),
              HowItWorksRow("6", "Cash limit will be updated in your app"),
              DividerWidget,
              StoreNearYouText(),
              StoresList()
            ],
          ),
        ),
      ),
    );
  }

  Widget DottedBox() {
    return DottedBorder(
      color: themeRed,
      strokeWidth: 1,
      child: Container(
        alignment: Alignment.center,
        color: Color(0xffF4F4F5),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: SelectableText(
            "FE737852",
            style: redTextStyle,
          ),
        ),
      ),
    );
  }

  Widget HowItWorksRow(
    String Num,
    String text,
  ) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffF4F4F5),
            ),
            height: 30,
            width: 30,
            child: Text(
              Num,
              style: subTextStyleSmallBalck,
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            text,
            style: subTextStyleSmallBalck,
          ),
        )
      ],
    );
  }

  Widget StoreNearYouText() {
    return Row(
      children: [
        Text(
          "Airtel Stores near you",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {},
          child: Text(
            "View all",
            style: TextStyle(
                color: Colors.red, fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: themeRed,
          size: 12,
        )
      ],
    );
  }

  Widget StoresList() {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(
        height: 10,
      ),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Stores(index);
      },
    );
  }

  Stores(int index) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[400])),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Wrap(
          runSpacing: 10,
          children: [
            Row(
              children: [
                Text(
                  "Pandian travels and mobiles",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Text(
                  "0.541 km",
                  style: subTextStyleBlack,
                )
              ],
            ),
            Text(
              "75 , Saphalya Bldg, Currey Rd, Lower Parel, Mumbai,  Maharashtra 400013, India",
              style: subTextStyleSmall,
            ),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.directions,
                    color: Colors.green,
                  ),
                  Text(
                    "Get directions",
                    style: greenText,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
