import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:spicy_food_delivery/Helper/snackbar_toast_helper.dart';
import 'package:spicy_food_delivery/Utils/Const.dart';
import 'package:spicy_food_delivery/Utils/geoLoaction.dart';
import 'package:spicy_food_delivery/Widgets/BottomNav.dart';
import 'package:spicy_food_delivery/api/deliverOrderApi.dart';
import 'package:spicy_food_delivery/api/deliverPickupApi.dart';
import 'package:spicy_food_delivery/api/orderDetailsApi.dart';
import 'package:spicy_food_delivery/api/pickOrderApi.dart';
import 'package:spicy_food_delivery/api/pickUpOrderApi.dart';
import 'package:url_launcher/url_launcher.dart';

class PickupDetailsPg extends StatefulWidget {
  final data;

  PickupDetailsPg({this.data});
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<PickupDetailsPg> {
  final GlobalKey<SlideActionState> _key = GlobalKey();
  var arrOrder;
  var arrOrderedProducts = [];
  var isLoading = false;
  var status = 0;

  @override
  void initState() {

 print("datttttttta");
 print(widget.data);
 setState(() {
   status =widget.data['pickUpStatus'];
 });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(height: 60, child:isLoading==true?SizedBox(height: 2,): SlideButtonn()),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        backgroundColor: Colors.white,
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  "Cancel",
                  style: redTextStyle12,
                ),
              ),
            ),
          )
        ],
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
              "Order Details",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          children: [
            RestaurantLoc(),
            Divider(
              thickness: 1,
            ),
            DeliveryLoc(),
            Divider(
              thickness: 1,
            ),
           // OrderDetails(),
            Divider(
              thickness: 1,
            ),
           // OrderCallWidget(),
            // OrderReadyWidget(),
          ],
        ),
      ),
    );
  }


  Widget SlideButtonn() {
    return SlideAction(
      child: Text(
        status.toString()=="3"?"Slide to deliver order":"Reached for pickup",
        style: TextStyle(
            color: Colors.white60, fontWeight: FontWeight.w600, fontSize: 18),
      ),
      height: 60,
      submittedIcon: Icon(
        Icons.done,
        size: 20,
        color: Colors.white,
      ),
      key: _key,
      onSubmit: () async {
        print("fff");
        print(widget.data['pickUpStatus'].toString());
        _key.currentState.reset();
        if(status.toString()!="3"){
          showToastSuccess("Changing....");
          //  var loc = await determinePosition();
          //  var dist = await calculateDistance(loc[0], loc[1],  double.parse(arrOrder['store']['LatLng']['coordinates'][0].toString()),
          //      double.parse(arrOrder['store']['LatLng']['coordinates'][1].toString()));
          // print("distance4eeeee");
          //
          // var n = num.parse(dist.toStringAsFixed(0));
          //  print("distanceeeeee");
          //  print(n);
          //  if(n<=2000){
          print("changinggggggg");

          var rsp = await pickUpOrderApi(widget.data['id'].toString(),widget.data['pickUpNo'].toString());
          if(rsp!=0){
            setState(() {
              status=3;

            });
            showToastSuccess(rsp['message'].toString());
          }
          print("responseee");
          print(rsp);



          // }else{
          //   showToastSuccess("You're no way near the restaurant....");
          //
          // }
          // var rsp = await pickOrderApi(arrOrder['orderNo'].toString());
          // print(rsp);
        }
        else{

          // var loc = await determinePosition();
          // var dist = await calculateDistance(loc[0], loc[1],  double.parse(arrOrder['store']['LatLng']['coordinates'][0].toString()),
          //     double.parse(arrOrder['store']['LatLng']['coordinates'][1].toString()));
          //
          //
          // var n = num.parse(dist.toStringAsFixed(0));
          // print("distanceeeeee");
          // print(n);
          //  if(n<=2000){
          var rsp = await deliverPickupApi(widget.data['id'].toString(),widget.data['pickUpNo'].toString());
          print("deliverrrrrrred");
          print(rsp);
          if(rsp!=0){
            showToastSuccess("Delivered....");
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => BottomNav(

                  )),
            );
          }


          // }else{
          //   showToastSuccess("You're no way near the customer....");
          //
          // }
          ///

        }

      },
      borderRadius: 1,
      innerColor: Color(0xffE84F23),
      outerColor: Color(0xffE84F23),
      sliderButtonIcon: Icon(
        Icons.double_arrow,
        color: Colors.white,
      ),
    );
  }

  Widget RestaurantLoc() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          if (widget.data['pickUpLatLng'] != null) {
            print("cordddc");
            showToastSuccess("Lauching Maps please wait...");
            MapsLauncher.launchCoordinates(
                double.parse(
                    widget.data['pickUpLatLng']['coordinates'][0].toString()),
                double.parse(
                    widget.data['pickUpLatLng']['coordinates'][1].toString()));
          } else {
            showToastSuccess("Location coordinates not found!");
          }
        },
        child: Wrap(
          runSpacing: 10,
          children: [
            Text(
              "Pickup location",
              style: redTextStyle12,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.data['pickUpAddress'].toString(),
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 15,
                    ),
                    Text(
                      "1.6 KM",
                      style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                    )
                  ],
                )
              ],
            ),
            Text(
              widget.data['pickUpAddress'].toString(),
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget DeliveryLoc() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          if (widget.data['dropLatLng'] != null) {
            showToastSuccess("Lauching Maps please wait...");
            MapsLauncher.launchCoordinates(
                double.parse(
                    widget.data['dropLatLng']['coordinates'][0].toString()),
                double.parse(
                    widget.data['dropLatLng']['coordinates'][1].toString()));
          } else {
            showToastSuccess("Location coordinates not found!");
          }
        },
        child: Wrap(
          runSpacing: 10,
          children: [
            Text(
              "Delivery location",
              style: redTextStyle12,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.data['user']['name'].toString(),
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 15,
                    ),
                    Text(
                      "1.6 KM",
                      style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                    )
                  ],
                )
              ],
            ),
            Text(
              widget.data['dropAddress'].toString(),
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget OrderDetails() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color(0xffE84F23),
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                "Food",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          OrderItemsListView(),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "Order ID: " + arrOrder['orderNo'].toString(),
                style: subText12,
              ),
              Spacer(),
              Text(
                'Total :   ' + rs + arrOrder['total'].toString(),
                style: subText12,
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  arrOrder['user']['name'].toString(),
                  style: subText12,
                ),
              ),
              Spacer(),
              // Container(
              //   decoration: BoxDecoration(
              //       color: Color(0xff7D7977),
              //       borderRadius: BorderRadius.circular(1)),
              //   child: Padding(
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              //     child: Text(
              //       "PAID",
              //       style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 10,
              //           fontWeight: FontWeight.w400),
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  OrderItemsListView() {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        height: 10,
      ),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: arrOrderedProducts != null ? arrOrderedProducts.length : 0,
      itemBuilder: (context, index) {
        final item =
        arrOrderedProducts != null ? arrOrderedProducts[index] : null;
        return OrderedItems(item, index);
      },
      // itemCount: 2,
    );
  }

  OrderedItems(var item, int index) {
    return Row(
      children: [
        Expanded(
          child: Text(
            item['quantity'].toString() + "X",
            style: subText12,
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            item['details']['name'].toString(),
            style: subText12,
          ),
        ),
      ],
    );
  }

  OrderCallWidget() {
    return GestureDetector(
      onTap: () async {
        print("fff");
        _makingPhoneCall();

        /// arrOrder['user']['phoneNumber'].toString() <-this got phone number
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: themeRed, borderRadius: BorderRadius.circular(10)),
        child: Text(
          "Call Customer",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  _makingPhoneCall() async {
    var url = 'tel:' + arrOrder['user']['phoneNumber'].toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  OrderReadyWidget() {
    return GestureDetector(
      onTap: () async {
        print("fff");

        var rsp = await deliverOrderApi(arrOrder['orderNo'].toString());
        print(rsp);
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: themeRed, borderRadius: BorderRadius.circular(10)),
        child: Text(
          "Deliver Order",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );

    // SlideAction(
    //   height: 50,
    //   key: _key,
    //   onSubmit: () {
    //
    //     Future.delayed(
    //       Duration(seconds: 1),
    //           () => _key.currentState.reset(),
    //     );
    //     Navigator.pop(context);
    //
    //   },
    //   innerColor: Colors.green,
    //   borderRadius: 1,
    //   sliderButtonIconPadding: 1,
    //   elevation: 0,
    //   outerColor: Colors.green,
    //   submittedIcon: Icon(
    //     Icons.done,
    //     size: 20,
    //     color: Colors.white,
    //   ),
    //   sliderButtonIcon: Icon(
    //     Icons.double_arrow,
    //     color: Colors.white60,
    //   ),
    //   child: Text(
    //     "Slide to accept order",
    //     style: TextStyle(
    //         color: Colors.white60,
    //         fontWeight: FontWeight.w600,
    //         fontSize: 18),
    //   ),
    // );
  }

// Widget Total() {
//   return Padding(
//     padding: const EdgeInsets.all(10.0),
//     child: Row(
//       children: [
//         Text(
//           "Total Bill: " + rs + "500",
//           style: HeadingTextStyle,
//         ),
//         SizedBox(
//           width: 15,
//         ),
//         Container(
//           decoration: BoxDecoration(
//               color: Colors.red[100], borderRadius: BorderRadius.circular(5)),
//           child: Padding(
//             padding: const EdgeInsets.all(5.0),
//             child: Text(
//               "PAID",
//               style: TextStyle(color: themeRed, fontWeight: FontWeight.w500),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
}
