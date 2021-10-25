import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spicy_food_delivery/Helper/common.dart';
import 'package:spicy_food_delivery/Helper/network.dart';
import 'package:spicy_food_delivery/Helper/sharedPref.dart';
import 'package:spicy_food_delivery/Helper/snackbar_toast_helper.dart';


Future PickAcceptOrderApi(id,orderNum) async {
  var token = await getSharedPrefrence(Common1.TOKEN);
 print("token");
 print(token);
 print(orderNum);
 print(id);
  final response = await http.post(
      Uri.parse(
          baseUrl +'delivery-boy/user/pickUpAndDrop/order/accept',
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + token},
     body: jsonEncode(<String, String>{
      'id': id.toString(),
      'pickUpNo': orderNum.toString()
     }),


      );
  var convertDataToJson;

  if (response.statusCode == 200) {
    convertDataToJson = json.decode(response.body);
    showToastSuccess("Order Status Updated!");

    // If the server did return a 200 OK response,
    // then parse the JSON.
  } else {
    convertDataToJson = 0;
    print("response.body");
    print(response.body);
    showToastSuccess("Something went wrong! Check your internet connection");
  }
  return convertDataToJson;
}
