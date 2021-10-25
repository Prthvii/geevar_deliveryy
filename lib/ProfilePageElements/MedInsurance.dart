import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spicy_food_delivery/Utils/Const.dart';

class MedicalInsurance extends StatefulWidget {
  @override
  _MedicalInsuranceState createState() => _MedicalInsuranceState();
}

class _MedicalInsuranceState extends State<MedicalInsurance> {
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
          "Medical Insurance",
          style: HeadingTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
          child: Wrap(
            runSpacing: 15,
            children: [
              GetCashlessTreatment(),
              GetReimursement(),
              Help(),
            ],
          ),
        ),
      ),
    );
  }

  Widget GetCashlessTreatment() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[400]),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Wrap(
          runSpacing: 10,
          children: [
            Text(
              "Get Cashless Treatment",
              style: profileText,
            ),
            Text(
              "Show this card at a nearby hospital to get cashless treatment",
              style: subTextStyle,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200]),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Wrap(
                  runSpacing: 15,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image(
                          image: NetworkImage(
                              "https://s3asura.s3-ap-southeast-1.amazonaws.com/company-files/413/7Rx7s1c8.jpg"),
                          height: 18,
                        ),
                        Spacer(),
                        Image(
                          image: NetworkImage(
                              "https://fhpl.net/FhplLogins/assets/images/logo_transparant.png"),
                          height: 18,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pandiyaraj B",
                          style: subTextStyleSmallBalck,
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'UHID:  ',
                              style: subTextStyleSmall,
                              children: [
                                TextSpan(
                                  text: 'ACK.Z0D00336778861.01',
                                  style: smallBlackText,
                                )
                              ]),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Policy number",
                                style: subTextStyleSmall,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              FittedBox(
                                child: Text(
                                  "SPI00336778861",
                                  style: subTextStyleBlack,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Valid From",
                                style: subTextStyleSmall,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              FittedBox(
                                child: Text(
                                  "01 Oct 20",
                                  style: subTextStyleBlack,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Valid Till",
                                style: subTextStyleSmall,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              FittedBox(
                                child: Text(
                                  "30 Sep 21",
                                  style: subTextStyleBlack,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Button2("See nearby Hospitals", Color(0xff27AE60))
          ],
        ),
      ),
    );
  }

  Widget GetReimursement() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[400]),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Wrap(
          runSpacing: 15,
          children: [
            Text(
              "Get Reimbursement",
              style: profileText,
            ),
            Text(
              "Did you already get treatment? Upload bills and get reimbursed here",
              style: subTextStyle,
            ),
            Button2("Register a Reimbursement Claim", Color(0xff27AE60))
          ],
        ),
      ),
    );
  }

  Widget Help() {
    return Wrap(
      children: [
        Text(
          "Need Help?",
          style: profileText,
        ),
        Text(
          "Get in touch with customer support or find an answer to FAQs in Help Centre",
          style: subTextStyle,
        ),
        Row(
          children: [
            Expanded(
              child: GreyButton("Call Customer Support"),
            ),
            Expanded(
              child: GreyButton("Go To Help Centre"),
            )
          ],
        )
      ],
      runSpacing: 10,
    );
  }

  Button2(String label, color) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: color),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              label,
              style: whiteText,
            ),
          ),
        ),
      ),
    );
  }

  GreyButton(
    String label,
  ) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.grey[200]),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
            child: Text(
              label,
              style: greenText,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
