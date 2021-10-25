import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:spicy_food_delivery/Helper/common.dart';
import 'package:spicy_food_delivery/Helper/sharedPref.dart';
import 'package:spicy_food_delivery/OrderFragment/AcceptedPickUp.dart';
import 'package:spicy_food_delivery/OrderFragment/PickUp.dart';
import 'package:spicy_food_delivery/OrderFragment/new.dart';
import 'package:spicy_food_delivery/OrderFragment/perpairing.dart';
import 'package:spicy_food_delivery/Utils/Const.dart';
import 'package:spicy_food_delivery/Utils/geoLoaction.dart';
import 'package:spicy_food_delivery/api/getProfileApi.dart';
import 'package:spicy_food_delivery/api/locationUpdateApi.dart';
import 'package:spicy_food_delivery/api/statusUpdationApi.dart';

class FeedsScreen extends StatefulWidget {
  @override
  _FeedsScreenState createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  final GlobalKey<SlideActionState> _key = GlobalKey();
  bool isSwitched = false;
  var stat = "Offline";
  var isLoading = true;
  var name;
  var email;
  var phoneNumber;
  Timer timer;
  var currentLat = 0.0;
  var currentLon = 0.0;
  var arrStoreDetails;
  var arrEarningDetails;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  void initState() {
    timer = Timer.periodic(Duration(minutes: 2), (Timer t) => getLoc());
    timer = Timer.periodic(
        Duration(seconds: 10), (Timer t) => createTrackingChannel());
    this.getStatus();
    super.initState();
    this.getDetails();

    this.getLoc();
  }

  void getLoc() async {
    var loc = await determinePosition();

    var send = await locationUpdateApi(loc[0], loc[1]);

    if (loc != 0) {
      setState(() {
        currentLat = loc[0];
        currentLon = loc[1];

        // isLoading=false;
      });
    }
  }

  Future createTrackingChannel() async {
    var orderId = await getSharedPrefrence("num");
    var loc = await determinePosition();
    if (orderId != null) {
      var docu =  await _firestore.collection('location').doc(orderId).get();
       if(docu.exists){
         print("updatingggg");

         await _firestore.collection('location').doc(orderId).update({
           "lat": loc[0].toString(),
           "long": loc[1].toString(),
         }).then((value) async {
           //Navigator.of(context).pop();
         }).catchError((error) {
           print(error);
         });
       }else{
         print("updatingggg");

         await _firestore.collection('location').doc(orderId).set({
           "lat": loc[0].toString(),
           "long": loc[1].toString(),
         }).then((value) async {
           //Navigator.of(context).pop();
         }).catchError((error) {
           print(error);
         });
       }
    }




  }

  Future<String> getStatus() async {
    var stati = await getSharedPrefrence(Common1.STATUS);

    print("44444444444");
    print(stati);
    //
    if (stati == "true") {
      setState(() {
        isSwitched = true;
        stat = "Online";
      });
    } else if (stati == "false") {
      setState(() {
        isSwitched = false;
        stat = "Offline";
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<String> getDetails() async {
    var rsp = await getProfileApi();
    print("rspppppppppppdataaaa");
    print(rsp['store']['altPhoneNumber']);
    if (rsp != null) {
      setState(() {
        arrStoreDetails = rsp['store'];
      });

      var orderId = await sharedPrefrence("num",rsp['store']['phoneNumber'].toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          // actions: [
          //   IconButton(
          //       visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
          //       icon: Padding(
          //         padding: EdgeInsets.zero,
          //         child: Icon(
          //           Icons.help_outline,
          //           color: Colors.black,
          //         ),
          //       ),
          //       onPressed: () {}),
          //   IconButton(
          //       visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
          //       icon: Padding(
          //         padding: EdgeInsets.zero,
          //         child: Icon(
          //           Icons.notifications_none,
          //           color: Colors.black,
          //         ),
          //       ),
          //       onPressed: () {
          //         // Navigator.push(
          //         //   context,
          //         //   MaterialPageRoute(builder: (context) => NewOrders()),
          //         // );
          //       })
          // ],
          title: Row(
            children: [
              CupertinoSwitch(
                value: arrStoreDetails != null
                    ? arrStoreDetails["isAvailable"]
                    : false,
                onChanged: (value) async {
                  if (arrStoreDetails["isAvailable"] == true) {
                    var rsp = await statusApi(false);
                    if (rsp != 0) {
                      setState(() {
                        arrStoreDetails["isAvailable"] = false;
                      });
                    }
                  } else {
                    var rsp = await statusApi(true);
                    if (rsp != 0) {
                      setState(() {
                        arrStoreDetails["isAvailable"] = true;
                      });
                    }
                  }
                },
                activeColor: themeColor,
              ),
              Text(
                arrStoreDetails != null
                    ? arrStoreDetails["isAvailable"] == true
                        ? "Online"
                        : "Offline"
                    : "",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
           //margin: EdgeInsets.only(bottom: 200),
              child: Column(
            children: [
              _tabSection(context),
              // Divider(),
              //
              // (isTap == true) ?
              // Center(child: CircularProgressIndicator())
              //     :OrderDetailsListView(),
              //   Divider(),
            ],
          )),
        ));
  }

  ConfirmOnline(var status) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        backgroundColor: Colors.white,
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setModelState) {
            return Stack(children: [
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
                                status == true
                                    ? "Confirm Online"
                                    : "Confirm Offline",
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
                    Divider(),
                    Text(
                      status == true ? onlineString : offlineString,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      height: 100,
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                child: Text(
                                  "No",
                                  style: profileText,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[100]),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                var online = await statusApi(status.toString());
                                print("online");
                                print(online);
                                if (online == "true") {
                                  setModelState(() {
                                    setState(() {
                                      isSwitched = true;
                                      stat = "Online";
                                    });
                                  });
                                  Navigator.pop(context);
                                } else if (online == "false") {
                                  setModelState(() {
                                    setState(() {
                                      isSwitched = false;
                                      stat = "Offline";
                                    });
                                  });
                                  Navigator.pop(context);
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: themeRed),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                          top: 10),
                    ),
                  ],
                ),
              ),
            ]);
          });
        });
  }

  Widget _tabSection(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  //  color: Color(0xff4236f1),
                  // border: Border.all(color: Colors.grey[400]),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TabBar(
                  tabs: [
                    Tab(
                      text: "New Orders",
                    ),
                    Tab(text: "Running Orders"),
                    Tab(text: "Pick Up"),
                    Tab(text: "Running Pick Up"),
                  ],
                  indicatorColor: Colors.red,
                  indicator: BoxDecoration(
                    color: themeRed,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  unselectedLabelColor: themeRed,

                  automaticIndicatorColorAdjustment: true,
                  //labelStyle: bold14,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(
                  children: [
                    NewOrder(),
                    PrepairingOrder(),
                    PickUpAndDroped(),
                    AcceptedPickUp(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
