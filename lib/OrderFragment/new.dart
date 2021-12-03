import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:spicy_food_delivery/Helper/sharedPref.dart';
import 'package:spicy_food_delivery/Helper/timeHelper.dart';
import 'package:spicy_food_delivery/Utils/Const.dart';
import 'package:spicy_food_delivery/api/acceptOrderApi.dart';
import 'package:spicy_food_delivery/api/newListingApi.dart';

class NewOrder extends StatefulWidget {
  @override
  _ListTileItemState createState() => new _ListTileItemState();
}

class _ListTileItemState extends State<NewOrder> {
  var isLoading = true;
  List<dynamic> arrProdList = [];
  List<dynamic> arrList = [];
  final GlobalKey<SlideActionState> _key = GlobalKey();

  @override
  void initState() {
    this.getProducts();
  }

  Future<String> getProducts() async {
    setState(() {
      isLoading = true;
    });
    var rsp = await newListingApi();
    if (rsp != null) {
      arrProdList = rsp['orders'];

      setState(() {
        isLoading = false;
      });
    }

    print("catogerrrrry");
    print(rsp);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => getProducts(),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: AlwaysScrollableScrollPhysics(),
        child: isLoading == true
            ? Center(child: CircularProgressIndicator())
            : arrProdList.isEmpty
                ? Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Image(
                        image: AssetImage("assets/images/nodata.png"),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  )
                : SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Container(
                        margin: EdgeInsets.only(bottom: 200),
                        child: Column(
                          children: [
                            (isLoading == true)
                                ? Center(
                                    child: Padding(
                                    padding: const EdgeInsets.only(top: 200),
                                    child: CircularProgressIndicator(),
                                  ))
                                : OrderDetailsListView(),
                            // Divider(),
                          ],
                        )),
                  ),
      ),
    );
  }

  OrderDetailsListView() {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => DividerWidget,
      shrinkWrap: true,
      itemCount: arrProdList != null ? arrProdList.length : 0,
      itemBuilder: (context, index) {
        final item = arrProdList != null ? arrProdList[index] : null;
        return OrderDetails(item, index);
      },
    );
  }

  OrderDetails(item, index) {
    return Container(
      child: Column(
        children: [
          OrderIdDetails(item, index),
          OrderItem(item, index),
          Divider(),
          TotalBill(item, index),
          OrderReadyWidget(item, index)
        ],
      ),
    );
  }

  OrderIdDetails(var item, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "ID: " + item['orderNo'].toString(),
                style: subText,
              ),
              Spacer(),
              Text(
                parseTimeFromUtc(item['createdAt'].toString()).toString(),
                style: subTextStyle,
              ),
            ],
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.yellow[800],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    getStatus(item['orderStatus']).toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    parseDateFromUtc(item['createdAt'].toString()).toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              // SizedBox(
              //   width: 5,
              // ),
              // Text(
              //   "Aron's 5th order",
              //   style: greenText,
              // )
            ],
          ),
        ],
      ),
    );
  }

  OrderItem(var item, var index) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: item['products'] != null ? item['products'].length : 0,
      itemBuilder: (context, index) {
        final items = item['products'] != null ? item['products'][index] : null;
        return OrderItemDetails(items, index);
      },
    );
  }

  OrderItemDetails(var item, var index) {
    print("itemsssssssssssssss");
    print(item);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            item['quantity'].toString() + "x ",
            style: subText,
          ),
          Text(
            item['details']['name'].toString(),
            style: subText,
          ),
          Spacer(),
          Text(
            rs + item['sellPrice'].toString(),
            style: subText,
          )
        ],
      ),
    );
  }

  TotalBill(var item, var index) {
    return ExpansionTile(
      title: Row(
        children: [
          Text(
            "Earnings : " + rs + item['total'].toString(),
            style: TextStyle(fontSize: 14, color: Color(0xff848891)),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                getPayStatus(item['paymentStatus']).toString(),
                style: TextStyle(color: Colors.grey[500], fontSize: 10),
              ),
            ),
            color: Colors.grey[200],
          )
        ],
      ),
      children: [Text("aaaa")],
    );
  }

  OrderReadyWidget(var item, var index) {
    return GestureDetector(
      onTap: () async {
        _onBackPressed(item['orderNo'].toString(), index, item['id']);
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(10)),
        child: Text(
          "Accept",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed(var id, int index, var tacking) {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Accepting ?'),
            content: new Text('Did you want to accept this order !'),
            actions: <Widget>[
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Text("NO"),
              ),
              SizedBox(height: 16),
              new GestureDetector(
                onTap: () async {
                  var rsp = await acceptOrderApi(id);
                  if (rsp != 0) {
                    print("lengthh");
                    var orderId =
                        await sharedPrefrence("DID", tacking.toString());
                    print(arrProdList.length);
                    setState(() {
                      arrProdList.removeAt(index);
                    });

                    print(arrProdList.length);

                    Navigator.pop(context);
                    //  getProducts();
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Text("YES"),
              ),
            ],
          ),
        ) ??
        false;
  }
  // Future<bool> _rejectPressed(var id,int index) {
  //   return showDialog(
  //     context: context,
  //     builder: (context) => new AlertDialog(
  //       title: new Text('Accepting ?'),
  //       content: new Text(
  //           'Did you want to reject this order !'),
  //       actions: <Widget>[
  //         new GestureDetector(
  //           onTap: () => Navigator.of(context).pop(false),
  //           child: Text("NO"),
  //         ),
  //         SizedBox(height: 16),
  //         new GestureDetector(
  //           onTap: () async {
  //
  //             var rsp =await rejectOrderApi(id);
  //             if(rsp!=0){
  //               print("lengthh");
  //               print(arrProdList.length);
  //               setState(() {
  //                 arrProdList.removeAt(index);
  //               });
  //
  //               print(arrProdList.length);
  //
  //               Navigator.pop(context);
  //               //  getProducts();
  //             }else{
  //               Navigator.pop(context);
  //
  //             }
  //           }
  //           ,
  //           child: Text("YES"),
  //         ),
  //       ],
  //     ),
  //   ) ??
  //       false;
  // }
}
