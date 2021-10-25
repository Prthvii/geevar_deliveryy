import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spicy_food_delivery/ProfilePageElements/Agreement.dart';
import 'package:spicy_food_delivery/ProfilePageElements/Courses.dart';
import 'package:spicy_food_delivery/ProfilePageElements/ManageProfile.dart';
import 'package:spicy_food_delivery/ProfilePageElements/MedInsurance.dart';
import 'package:spicy_food_delivery/ProfilePageElements/OrderHistory.dart';
import 'package:spicy_food_delivery/ProfilePageElements/OrderPreference.dart';
import 'package:spicy_food_delivery/ProfilePageElements/RateCard.dart';
import 'package:spicy_food_delivery/ProfilePageElements/Refer_A_Friend.dart';
import 'package:spicy_food_delivery/ProfilePageElements/ReservationHistory.dart';
import 'package:spicy_food_delivery/ProfilePageElements/SessionHistory.dart';
import 'package:spicy_food_delivery/ProfilePageElements/SupportTickets.dart';
import 'package:spicy_food_delivery/Screens/EnterNumber.dart';
import 'package:spicy_food_delivery/TripHistoryTabs/TripHistoryDailyTab.dart';
import 'package:spicy_food_delivery/Utils/Const.dart';
import 'package:spicy_food_delivery/api/getProfileApi.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var isLoading = true;
  var name;
  var email;
  var phoneNumber;
  var altPhn;
  var city;
  var aadhar;
  var bnkName;
  var accNo;
  var IFSC;

  @override
  void initState() {
    this.getProfile();
    super.initState();
  }

  Future<String> getProfile() async {
    var rsp = await getProfileApi();

    //
    if (rsp != null) {
      setState(() {
        name = rsp['store']['name'].toString();
        email = rsp['store']['email'].toString();
        phoneNumber = rsp['store']['phoneNumber'].toString();
        city = rsp['store']['city']['name'].toString();
        altPhn = rsp['store']['altPhoneNumber'].toString();
        aadhar = rsp['store']['adhaarNo'].toString();
        bnkName = rsp['store']['bankName'].toString();
        accNo = rsp['store']['bankAccountNo'].toString();
        IFSC = rsp['store']['bankIfscCode'].toString();
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: Column(
                children: [NameSection(), Divider(), NewTiles()],
              ),
            ),
    );
  }

  NameSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                            "https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png",
                          ),
                          fit: BoxFit.cover))),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name.toString(),
                    style: HeadingTextStyle,
                  ),
                  Text(
                    email.toString(),
                    style: subTextStyle,
                  )
                ],
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text(
                      "4.9",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow[600],
                      size: 18,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  ContactDetails() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.phone_android_sharp,
                color: themeRed,
                size: 18,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "+91" + phoneNumber.toString(),
                style: subTextStyle,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.location_on,
                color: themeRed,
                size: 18,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                city.toString(),
                style: subTextStyle,
              )
            ],
          ),
        )
      ],
    );
  }

  NewTiles() {
    return Flexible(
      // fit: FlexFit.loose,
      child: ListView(
        children: ListTile.divideTiles(context: context, tiles: [
          ContactDetails(),
          Tile("Manage Profile", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ManageProfile()),
            );
          }),
          Tile("Orders History", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrderHistory()),
            );
          }),
          // ExpansionTile(
          //   childrenPadding: EdgeInsets.all(5),
          //   children: [
          //     ListTile(
          //       tileColor: Colors.grey[200],
          //       onTap: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => MedicalInsurance()),
          //         );
          //       },
          //       title: Row(
          //         children: [
          //           Text(
          //             "Medical Insurance",
          //             style: subTextStyle,
          //           ),
          //           SizedBox(
          //             width: 10,
          //           ),
          //           Icon(
          //             Icons.arrow_forward_ios,
          //             size: 13,
          //             color: Colors.grey[400],
          //           )
          //         ],
          //       ),
          //     ),
          //   ],
          //   title: Text(
          //     "Benifits",
          //     style: profileText,
          //   ),
          //   trailing: Icon(Icons.keyboard_arrow_down),
          // ),
          // ExpansionTile(
          //   childrenPadding: EdgeInsets.all(5),
          //   children: [
          //     ListTile(
          //       tileColor: Colors.grey[200],
          //       onTap: () {
          //         LngSelect();
          //       },
          //       title: Row(
          //         children: [
          //           Text(
          //             "Language Preference",
          //             style: subTextStyle,
          //           ),
          //           SizedBox(
          //             width: 10,
          //           ),
          //           Icon(
          //             Icons.arrow_forward_ios,
          //             size: 13,
          //             color: Colors.grey[400],
          //           )
          //         ],
          //       ),
          //     ),
          //     Container(
          //       width: double.infinity,
          //       height: 1,
          //       color: Colors.grey[400],
          //     ),
          //     ListTile(
          //       tileColor: Colors.grey[200],
          //       onTap: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => OrderPrf()),
          //         );
          //       },
          //       title: Row(
          //         children: [
          //           Text(
          //             "Order Preference",
          //             style: subTextStyle,
          //           ),
          //           SizedBox(
          //             width: 10,
          //           ),
          //           Icon(
          //             Icons.arrow_forward_ios,
          //             size: 13,
          //             color: Colors.grey[400],
          //           )
          //         ],
          //       ),
          //     ),
          //   ],
          //   title: Text(
          //     "Preference",
          //     style: profileText,
          //   ),
          //   trailing: Icon(Icons.keyboard_arrow_down),
          // ),
          // ExpansionTile(
          //   childrenPadding: EdgeInsets.all(5),
          //   children: [
          //     ListTile(
          //       tileColor: Colors.grey[200],
          //       onTap: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => TripHisDaily()),
          //         );
          //       },
          //       title: Row(
          //         children: [
          //           Text(
          //             "Trip History",
          //             style: subTextStyle,
          //           ),
          //           SizedBox(
          //             width: 10,
          //           ),
          //           Icon(
          //             Icons.arrow_forward_ios,
          //             size: 13,
          //             color: Colors.grey[400],
          //           )
          //         ],
          //       ),
          //     ),
          //     Container(
          //       width: double.infinity,
          //       height: 1,
          //       color: Colors.grey[400],
          //     ),
          //     ListTile(
          //       tileColor: Colors.grey[200],
          //       onTap: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => SessionHistory()),
          //         );
          //       },
          //       title: Row(
          //         children: [
          //           Text(
          //             "Session History",
          //             style: subTextStyle,
          //           ),
          //           SizedBox(
          //             width: 10,
          //           ),
          //           Icon(
          //             Icons.arrow_forward_ios,
          //             size: 13,
          //             color: Colors.grey[400],
          //           )
          //         ],
          //       ),
          //     ),
          //     Container(
          //       width: double.infinity,
          //       height: 1,
          //       color: Colors.grey[400],
          //     ),
          //     ListTile(
          //       tileColor: Colors.grey[200],
          //       onTap: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => ReservationHis()),
          //         );
          //       },
          //       title: Row(
          //         children: [
          //           Text(
          //             "Reservation History",
          //             style: subTextStyle,
          //           ),
          //           SizedBox(
          //             width: 10,
          //           ),
          //           Icon(
          //             Icons.arrow_forward_ios,
          //             size: 13,
          //             color: Colors.grey[400],
          //           )
          //         ],
          //       ),
          //     ),
          //   ],
          //   title: Text(
          //     "History",
          //     style: profileText,
          //   ),
          //   trailing: Icon(Icons.keyboard_arrow_down),
          // ),
          // Tile("Refer a friend", () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => ReferAFriend()),
          //   );
          // }),
          // Tile("Issue & Ticket", () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => SupportTickets()),
          //   );
          // }),
          // ExpansionTile(
          //   childrenPadding: EdgeInsets.all(5),
          //   children: [
          //     ListTile(
          //       tileColor: Colors.grey[200],
          //       onTap: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => CoursesScreen()),
          //         );
          //       },
          //       title: Row(
          //         children: [
          //           Text(
          //             "Courses",
          //             style: subTextStyle,
          //           ),
          //           SizedBox(
          //             width: 10,
          //           ),
          //           Icon(
          //             Icons.arrow_forward_ios,
          //             size: 13,
          //             color: Colors.grey[400],
          //           )
          //         ],
          //       ),
          //     ),
          //   ],
          //   title: Text(
          //     "Training",
          //     style: profileText,
          //   ),
          //   trailing: Icon(Icons.keyboard_arrow_down),
          // ),
          Tile("Agreement", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AgreementScreen()),
            );
          }),
          SizedBox(
            height: 10,
          ),
          LogoutButton(),
          SizedBox(
            height: 20,
          )
        ]).toList(),
      ),
    );
  }

  Widget Tile(String label, GestureTapCallback onTap) {
    return ListTile(
      onTap: onTap,
      title: Text(
        label,
        style: profileText,
      ),
      trailing: Icon(Icons.keyboard_arrow_right),
    );
  }

  LogoutButton() {
    return GestureDetector(
      onTap: () {
        showAlertDialog(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Logout",
              style: redTextStyle,
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: themeRed)),
        ),
      ),
    );
  }

  LngSelect() {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        backgroundColor: Colors.white,
        context: context,
        isScrollControlled: true,
        builder: (context) => Stack(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Text(
                                "Choose prefered language",
                                style: HeadingTextStyle,
                              ),
                              Spacer(),
                              IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  })
                            ],
                          ),
                        ),
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20.0)),
                        )),
                    Row(
                      children: [
                        GestureDetector(onTap: () {}, child: Text("English")),
                        Spacer(),
                        Radio(
                          groupValue: null,
                          value: null,
                          onChanged: null,
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey[400],
                    ),
                    Row(
                      children: [
                        GestureDetector(onTap: () {}, child: Text("Hindi")),
                        Spacer(),
                        Radio(
                          groupValue: null,
                          value: null,
                          onChanged: null,
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey[400],
                    ),
                    Row(
                      children: [
                        GestureDetector(onTap: () {}, child: Text("Gujarati")),
                        Spacer(),
                        Radio(
                          groupValue: null,
                          value: null,
                          onChanged: null,
                        ),
                      ],
                    ),
                    Container(
                      height: 100,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              child: Text(
                                "Cancel",
                                style: profileText,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[100]),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              child: Text(
                                "Ok",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]));
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => EnterNum()),
        );
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirm Logout?"),
      content: Text("Are you sure you want to logout?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
