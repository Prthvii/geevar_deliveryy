getOrderTime(String dateTime){


     var houR= DateTime.parse(dateTime).hour;
     var minutE= DateTime.parse(dateTime).minute;
      var send = houR.toString()+":"+minutE.toString();
      return send;
}


getStatus(var stat){


  var send =    stat==1?"PENDING":
  stat==2?"ACCEPTED":
  stat==3?"ACCEPTED":
  stat==4?"ORDER READY":
  stat==5?"PICKED UP":stat==11?"REJECTED":stat==30?"REJECTED":stat==0?"DELIVERD":
  "PENDING";
  return send;

}
pickupStatus(var stat){


  var send =    stat==1?"Pending":
  stat==2?"Pending":
  stat==3?"Accepted":
  stat==4?"Picked Up":

  "Delivered" ;
  return send;
}

getButtonStatus(var stat){
var send;

if(stat=="NEW"){
  send="Prepairing";
  return send;
}
if(stat=="PREP"){
  send="Order Ready";
  return send;
}
if(stat=="READY"){
  send=" ";
  return send;
}
if(stat=="PICKED"){
  send=" ";
  return send;
}


}

getPayStatus(var stat){


  var send =    stat==1?"Pending":
  stat==2?"Captured Online":
  stat==3?"Recived by delivery boy":
  "Failed" ;
  return send;
}

 parseTimeFromUtc(   isoFormattedString){

  var dateTime = DateTime.parse(isoFormattedString.split("Z").first + '+05:30');

  print("dateUtc");

  print(dateTime.hour);
  print(dateTime.minute);
  var setUp = dateTime.hour.toString() +":"+ dateTime.minute.toString();
  return setUp;
}

 parseDateFromUtc(   isoFormattedString){

  var dateTime = DateTime.parse(isoFormattedString.split("Z").first + '+05:30');

  print("dateUtc");


  print(dateTime.minute);
  var setUp = dateTime.day.toString() +"-"+ dateTime.month.toString()+"-"+dateTime.year.toString();
  return setUp;
}