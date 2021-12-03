import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:spicy_food_delivery/Helper/snackbar_toast_helper.dart';
import 'package:spicy_food_delivery/Screens/DepositAtStoreScreen.dart';
import 'package:spicy_food_delivery/Utils/Const.dart';
import 'package:spicy_food_delivery/api/getTotalCod.dart';
import 'package:spicy_food_delivery/api/payCod.dart';
import 'package:spicy_food_delivery/api/paySingleCod.dart';

class DepositScreen extends StatefulWidget {
  @override
  _DepositScreenState createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  double _progress = 0;
  double _lowerValue = 50;
  double _upperValue = 180;
  bool isSwitched = false;
  bool isTap = false;
  var isLoading = true;
  var codPending = [];
  var total = "0";
  var id;
  Razorpay _razorpay;
  final amntCtrl = TextEditingController();

  @override
  void initState() {
    this.getTotalAmout();
    this.getPayout();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    // this.getProducts();
    // timer = Timer.periodic(Duration(seconds: 10), (Timer t) =>NewBottomSheet());
  }

  Future<String> getTotalAmout() async {
    var rsp = await getTotalCodApi();
    print("totalll");
    print(rsp);
    print(rsp);
    if (rsp != 0) {
      setState(() {
        total = rsp['TotalCODAmount'].toString();
        codPending = rsp['codPending'];
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<String> getPayout() async {
    var rsp = await payCodApi();
    print("rsppppppppppp");

    print(rsp);
    if (rsp != 0) {
      setState(() {
        //  total = rsp['TotalCODAmount']!=null?rsp['TotalCODAmount'].toString():"0";
        id = rsp['onlinePaymentId'] != null
            ? rsp['onlinePaymentId'].toString()
            : null;
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  void openCheckout(oid) async {
    if (total.toString() == "0") {
      showToastSuccess("Invalid Amount");
      return;
    }
    var options = {
      'key': 'rzp_live_bByB0CpxZk2E7y',
      'Order_Id': oid != null ? oid : id.toString(),
      //  'amount': double.parse(typed.toString())* 100,
      'name': 'Yummitto.',
      'image':
          'https://firebasestorage.googleapis.com/v0/b/yummitto-app.appspot.com/o/Yummitto.png?alt=media&token=f7de3007-decc-4ca5-9703-7ed0a92e5898',
      // 'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    getTotalAmout();

    showToastSuccess("Payment Success");
    getTotalAmout();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    showToastSuccess(
        "ERROR: " + response.code.toString() + " - " + response.message);
    //   Navigator.pop(context);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    showToastSuccess("EXTERNAL_WALLET: " + response.walletName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Deposit",
          style: HeadingTextStyle,
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  //  AvailableLimit(),
                  // // Slider(),
                  //  Divider(),
                  //  CashInHand(),
                  Divider(),
                  Advbal(),
                  Divider(),
                  GestureDetector(
                    child: Button("Pay by UPI"),
                    onTap: () {
                      openCheckout(null);
                      // NewBottomSheet();
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DepositAtStore()),
                      );
                    },
                    child: Button1("Deposit at store"),
                  ),
                  Button("Pay by Debit card / Netbanking"),
                  Text(
                    "Unpaid cash will be deducted from the next payout",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),

                  OrderHis()
                ],
              ),
            ),
    );
  }

  Widget AvailableLimit() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Available Limit",
                style: profileText,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "23 Feb, 2021",
                style: subTextStyleSmall,
              )
            ],
          ),
          Spacer(),
          Text(
            rs + "40",
            style: HeadingTextStyle,
          )
        ],
      ),
    );
  }

  Widget Slider() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: FlutterSlider(
          selectByTap: true,
          trackBar: FlutterSliderTrackBar(
              activeTrackBar: BoxDecoration(color: themeRed),
              inactiveTrackBar: BoxDecoration(color: Colors.red[100])),
          handler: FlutterSliderHandler(
            decoration: BoxDecoration(),
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300],
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                  border: Border.all(color: Colors.grey[100]),
                  shape: BoxShape.circle,
                  color: Colors.white),
              padding: EdgeInsets.all(5),
            ),
          ),
          values: [0],
          max: 800,
          fixedValues: [],
          min: 0,
          onDragging: (handlerIndex, lowerValue, upperValue) {
            _lowerValue = lowerValue;
            _upperValue = upperValue;
            setState(() {});
          },
          tooltip: FlutterSliderTooltip(
            format: (String value) {
              return value + ' ! ';
            },
            textStyle: TextStyle(fontSize: 17, color: themeRed),
          )),
    );
  }

  Widget CashInHand() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cash in hand",
                style: profileText,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Deposit cash when you reach limit",
                style: subTextStyleSmall,
              )
            ],
          ),
          Spacer(),
          Text(
            rs + "211.22",
            style: profileText,
          )
        ],
      ),
    );
  }

  Widget Advbal() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Text(
            "Advance balance",
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.w500, fontSize: 14),
          ),
          Spacer(),
          Text(
            total != null ? rs + total : rs + "0",
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.w500, fontSize: 14),
          )
        ],
      ),
    );
  }

  Widget Button(String label) {
    return GestureDetector(
      onTap: () {
        openCheckout(null);
        //  return;
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          alignment: Alignment.center,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(label,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                )),
          ),
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget Button1(String label) {
    return GestureDetector(
      onTap: () {
        showToastSuccess("Feature coming soon!");
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          alignment: Alignment.center,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(label,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                )),
          ),
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(10)),
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
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20.0)),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Text(
                              "Enter Amount",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18),
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
                    ),
                    TextField(
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      controller: amntCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        isDense: true,
                        prefixText: "₹ ",
                        contentPadding: EdgeInsets.all(0),
                      ),
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
                                  "Cancel",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
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
                              onTap: () {
                                var type =
                                    double.parse(amntCtrl.text.toString());
                                var limit = double.parse(total.toString());
                                if (total != "0" && type < limit) {
                                  // openCheckout(type);
                                  Navigator.pop(context);
                                  showToastSuccess("Submitted!");
                                } else {
                                  Navigator.pop(context);

                                  showToastSuccess("Invalid Amount!");
                                }
                                // Navigator.pop(context);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                child: Text(
                                  "Confirm",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
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
            ]));
  }

  ///history list

  OrderHis() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order History",
            style: profileText,
          ),
          SizedBox(
            height: 10,
          ),
          ListView.separated(
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
            shrinkWrap: true,
            itemCount: codPending != null ? codPending.length : 0,
            itemBuilder: (context, index) {
              final item = codPending != null ? codPending[index] : null;
              return histryList(item, index);
            },
          )
        ],
      ),
    );
  }

  histryList(var item, int index) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order No:  " + "#" + item['orderNo'].toString(),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Amount:  " + rs + item['amount'].toString(),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                setState(() {
                  isLoading = true;
                });
                var rsp = await paySingleCodApi(item['order']);
                print("singleepaay");
                print(rsp);
                if (rsp != 0) {
                  openCheckout(rsp['onlinePaymentId'].toString());
                }
                setState(() {
                  isLoading = false;
                });
              },
              child: isTap == true
                  ? Container(
                      height: 30, width: 30, child: CircularProgressIndicator())
                  : Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Text(
                          "Pay",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
