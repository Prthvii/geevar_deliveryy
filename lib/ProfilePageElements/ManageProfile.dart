import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spicy_food_delivery/Utils/Const.dart';
import 'package:spicy_food_delivery/api/getProfileApi.dart';

class ManageProfile extends StatefulWidget {
  @override
  _ManageProfileState createState() => _ManageProfileState();
}

class _ManageProfileState extends State<ManageProfile> {
  var isLoading = true;
  var name;
  var email;
  var phoneNumber;
  var altPhn;
  var city;
  var state;
  var aadhar;
  var bnkName;
  var accNo;
  var IFSC;
  var rating;

  @override
  void initState() {
    this.getProfile();
    super.initState();
  }

  Future<String> getProfile() async {
    var rsp = await getProfileApi();

    if (rsp != null) {
      setState(() {
        name = rsp['store']['name'].toString();
        email = rsp['store']['email'].toString();
        phoneNumber = rsp['store']['phoneNumber'].toString();
        city = rsp['store']['city']['name'].toString();
        state = rsp['store']['state']['name'].toString();
        altPhn = rsp['store']['altPhoneNumber'].toString();
        aadhar = rsp['store']['adhaarNo'].toString();
        bnkName = rsp['store']['bankName'].toString();
        accNo = rsp['store']['bankAccountNo'].toString();
        IFSC = rsp['store']['bankIfscCode'].toString();
        rating = rsp['rating'].toString();
      });
    }

    print("ratingggggggggggg");
    print(rating);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Profile",
          style: HeadingTextStyle,
        ),
      ),
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PersonalDetails(),
                ],
              ),
            ),
    );
  }

  Widget SellerDetails() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: Container(
        child: Center(
          child: Column(
            children: [
              Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                            "https://cdn-cf.sharechat.com/vff_blur_1aae35b5_1592058176502_1.jpeg",
                          ),
                          fit: BoxFit.cover))),
              Text(
                name.toString(),
                style: HeadingTextStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "City: " + city.toString(),
                style: subTextStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "State: " + state.toString(),
                style: subTextStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        rating == "null" ? "4" : rating.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow[600],
                        size: 16,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget PersonalDetails() {
    return Flexible(
      child: ListView(
        children: ListTile.divideTiles(context: context, tiles: [
          SellerDetails(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Personal details",
              style: subTextStyle,
            ),
          ),
          Tile("Phone", "+91 " + phoneNumber.toString(), () {}),
          Tile("Alternate Phone", "+91 " + altPhn.toString(), () {}),
          Tile("Aadhar No.", aadhar.toString(), () {}),
          Tile("DL No.", "DDS6585545", () {}),
          Tile("DL Expiry", "20-03-2040", () {}),
          Tile("Rating", "4.92", () {}),
          Tile("Extra Cash", "-₹200.00", () {}),
          Tile("App Version", "5.2.5", () {}),
          DividerWidget,
          Padding(
            padding: const EdgeInsets.all(
              10,
            ),
            child: Text(
              "Bank Details",
              style: subTextStyle,
            ),
          ),
          Tile("Bank Name", bnkName.toString(), () {}),
          Tile("Account No.", accNo.toString(), () {}),
          Tile("IFSC Code", IFSC.toString(), () {}),
          Tile("PAN Card No.", "123456789", () {}),
          Tile("Max Security Deposit", "0", () {}),
          DividerWidget,
          Padding(
            padding: const EdgeInsets.all(
              10,
            ),
            child: Text(
              "Other Details",
              style: subTextStyle,
            ),
          ),
          Tile("Reserved For Merchand", "", () {}),
          Tile("Current State", "Not Reserved", () {}),
          Tile("Upcoming Reservation", "NA", () {}),
          Tile("Assets", "Bibs, bag, Tshirt", () {}),
          SizedBox(
            height: 20,
          )
        ]).toList(),
      ),
    );
  }

  Widget Tile(String label, String trail, GestureTapCallback onTap) {
    return ListTile(
      onTap: onTap,
      title: Text(
        label,
        style: subTextStyleSmallBalck,
      ),
      trailing: Text(
        trail,
        style: subTextStyleSmall,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
