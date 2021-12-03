import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:spicy_food_delivery/Helper/common.dart';
import 'package:spicy_food_delivery/Helper/sharedPref.dart';
import 'package:spicy_food_delivery/Helper/snackbar_toast_helper.dart';
import 'package:spicy_food_delivery/Utils/Const.dart';
import 'package:spicy_food_delivery/Widgets/BottomNav.dart';
import 'package:spicy_food_delivery/api/loginApi.dart';
import 'package:spicy_food_delivery/api/verifyApi.dart';

class EnterNum extends StatefulWidget {
  @override
  _EnterNumState createState() => _EnterNumState();
}

class _EnterNumState extends State<EnterNum> {
  final _otpController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  String _verificationCode;
  bool _send = false;

  @override
  void initState() {
    super.initState();
    // _verifyPhone();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Text(
                  "Continue with phone number",
                  style: HeadingTextStyle,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Enter your phone number to proceed ",
                  style: subTextStyle,
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Phone number",
                  style: subTextStyle,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(0),
                    prefixIcon: Text(
                      "+91 ",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                GestureDetector(
                  onTap: () async {
                    if (_phoneNumberController.text.length != 0) {
                      setState(() {
                        _send = true;
                      });
                      var rsp = await enterNumberApi(
                          _phoneNumberController.text.toString());
                      print("rspppp");
                      print(rsp);

                      if (rsp == 0) {
                        showToastSuccess(
                            "Something went wrong! Check your internet connection");
                        setState(() {
                          _send = false;
                        });
                      } else if (rsp['message'].toString() == "OTP Sended") {
                        setState(() {
                          _send = false;
                        });

                        NewBottomSheet();
                      } else if (rsp['message'].toString() ==
                          "Delivery Boy is not found with given phone number") {
                        showToastSuccess(rsp['message'].toString());
                        setState(() {
                          _send = false;
                        });
                      } else {
                        setState(() {
                          _send = false;
                        });
                      }
                    } else {
                      showToastSuccess("Empty Feilds!");

                      setState(() {
                        _send = false;
                      });
                    }
                  },
                  child: Button2("Send OTP", Colors.red),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 50,
          margin: EdgeInsets.only(left: 20, right: 20),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'By continuing you confirms that you agree with \n our ',
                style: TextStyle(fontSize: 13, color: Colors.grey[400]),
                children: [
                  TextSpan(
                    text: 'Terms and Conditions',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        fontSize: 13,
                        color: Colors.red),
                  )
                ]),
          ),
        ),
      ),
    );
  }

  // _verifyPhone() async {
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //       phoneNumber: '+91${_phoneNumberController.text.toString()}',
  //       verificationCompleted: (PhoneAuthCredential credential) async {
  //         await FirebaseAuth.instance
  //             .signInWithCredential(credential)
  //             .then((value) async {
  //           if (value.user != null) {
  //             // userCheck();
  //           } else {
  //             // Navigator.pushReplacement(
  //             //     context, MaterialPageRoute(builder: (context) => Reg()));
  //           }
  //         });
  //       },
  //       verificationFailed: (FirebaseAuthException e) {
  //         print(e.message);
  //       },
  //       codeSent: (String verificationID, int resendToken) {
  //         setState(() {
  //           _verificationCode = verificationID;
  //         });
  //       },
  //       codeAutoRetrievalTimeout: (String verificationID) {
  //         setState(() {
  //           _verificationCode = verificationID;
  //         });
  //       },
  //       timeout: Duration(seconds: 60));
  // }

  // _UserCheck() async {
  //   Map<String, String> queryParameters = {
  //     'mobile_number': item['product_id'].toString(),
  //     'product_qty': qty
  //   };
  // }

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
            _send == true ? "Sending..." : label,
            style: whiteText,
          ),
        ),
      ),
    );
  }

  NewBottomSheet() {
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
                                "Enter OTP to login",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              ),
                              Spacer(),
                              IconButton(
                                  icon: Icon(Icons.clear),
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
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Verify OTP",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 20),
                    Text("OTP sent to  " +
                        _phoneNumberController.text.toString()),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    OTP(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () async {
                          setState(() {
                            _send = true;
                          });

                          var rsp = await verifyOtpApi(
                              _otpController.text.toString(),
                              _phoneNumberController.text.toString());
                          print("resops");
                          print(_otpController.text);

                          if (rsp == 0) {
                            showToastSuccess(
                                "Something went wrong! Check your internet connection");
                            setState(() {
                              _send = false;
                            });
                          } else if (rsp['message'].toString() ==
                              "OTP Verified") {
                            var token = await sharedPrefrence(
                                Common1.TOKEN, rsp['token']);
                            var mobile = await sharedPrefrence(Common1.MOBILE,
                                _phoneNumberController.text.toString());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomNav()),
                            );
                          } else {
                            setState(() {
                              _send = false;
                            });
                          }

                          print("responsee");
                          print(rsp);

                          print("sub");
                        },
                        child: Button2("Submit", Color(0xff27AE60)),
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
            ]));
  }

  OTP() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Enter OTP ",
          textAlign: TextAlign.start,
        ),
        PinCodeTextField(
          appContext: context,
          // pastedTextStyle: TextStyle(
          //   color: Colors.green.shade600,
          //   fontWeight: FontWeight.bold,
          // ),
          length: 6,

          blinkWhenObscuring: true,
          animationType: AnimationType.fade,
          // validator: (v) {},
          pinTheme: PinTheme(
            inactiveFillColor: Colors.white,
            activeFillColor: Colors.white,
            selectedFillColor: Colors.white,
            borderWidth: 2,
            activeColor: themeRed,
            inactiveColor: themeRed,
            selectedColor: themeRed,
            shape: PinCodeFieldShape.underline,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 40,
            fieldWidth: 40,
          ),
          cursorColor: Colors.black,
          animationDuration: Duration(milliseconds: 300),
          enableActiveFill: true,
          // controller: _otpController,
          keyboardType: TextInputType.number,
          controller: _otpController,
          autoFocus: true,
          onCompleted: (v) {
            print("Completed");
          },
          onChanged: (value) {},
          beforeTextPaste: (text) {
            print("Allowing to paste $text");
            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
            //but you can show anything you want here, like your pop up saying wrong paste format or etc
            return true;
          },
        ),
      ],
    );
  }

  Future<bool> _onBackPressed() {
    SystemNavigator.pop();
  }
}
