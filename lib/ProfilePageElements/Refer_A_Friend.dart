import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spicy_food_delivery/Utils/Const.dart';

class ReferAFriend extends StatefulWidget {
  @override
  _ReferAFriendState createState() => _ReferAFriendState();
}

class _ReferAFriendState extends State<ReferAFriend> {
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
          "Refer a Friend",
          style: HeadingTextStyle,
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Wrap(
          runSpacing: 15,
          children: [
            TextBoxNum("Phone number"),
            TextBox("Name"),
            VehicleTypeDrop(),
            CityDrop(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height / 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Button2("Refer Now", Colors.green), ManageProfile()],
        ),
      ),
    );
  }

  Widget TextBoxNum(String label) {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [LengthLimitingTextInputFormatter(10)],
      decoration: new InputDecoration(
          labelText: label,
          prefixText: "+91",
          labelStyle: subTextStyle,
          fillColor: Colors.white,
          enabledBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(10),
            borderSide: new BorderSide(color: themeRed, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(10),
            borderSide: new BorderSide(color: themeRed, width: 2),
          )),
    );
  }

  Widget TextBox(String label) {
    return TextFormField(
      decoration: new InputDecoration(
          labelText: label,
          labelStyle: subTextStyle,
          fillColor: Colors.white,
          enabledBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(10),
            borderSide: new BorderSide(color: themeRed, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(10),
            borderSide: new BorderSide(color: themeRed, width: 2),
          )),
    );
  }

  Widget VehicleTypeDrop() {
    return DropdownButton(
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: Colors.grey,
        ),
        // underline: SizedBox(),
        isExpanded: true,
        value: _value,
        items: [
          DropdownMenuItem(
            child: Text(
              "Vehicle type",
              style: subTextStyle,
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
        });
  }

  Widget CityDrop() {
    return DropdownButton(
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: Colors.grey,
        ),
        // underline: SizedBox(),
        isExpanded: true,
        value: _value,
        items: [
          DropdownMenuItem(
            child: Text(
              "City",
              style: subTextStyle,
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
        });
  }

  Button2(String label, color) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        alignment: Alignment.center,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(8), color: color),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            label,
            style: whiteText,
          ),
        ),
      ),
    );
  }

  Widget ManageProfile() {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffF2F3F4), borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Manage Profile",
                    style: profileText,
                  ),
                  Text(
                    "2 Friends refered · ₹0 bonus earned",
                    style: subTextStyle,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 13,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
