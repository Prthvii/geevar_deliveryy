import "package:flutter/material.dart";
import 'package:spicy_food_delivery/Utils/Const.dart';

class AgreementScreen extends StatefulWidget {
  @override
  _AgreementScreenState createState() => _AgreementScreenState();
}

class _AgreementScreenState extends State<AgreementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Terms and conditions",
          style: HeadingTextStyle,
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        child: Button2("Agreement accepted", themeRed),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Texttt(),
        ),
      ),
    );
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

  Texttt() {
    return Text(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mi elementum, donec mattis fermentum, consectetur commodo malesuada. Iaculis arcu mattis tellus, congue et nisl hac. Molestie arcu risus sed euismod viverra amet. Turpis elementum sagittis quis mattis quam. Volutpat egestas quam adipiscing mauris nisi eget commodo enim lectus. Nisi consequat, eget hendrerit dui viverra. Euismod in egestas condimentum donec porttitor purus feugiat elementum fusce. Ultrices viverra pellentesque at massa blandit enim neque. Sit cras magna amet tincidunt volutpat quam egestas donec. Libero vulputate amet nibh nulla vitae varius amet, aliquet. In orci vitae, arcu viverra diam egestas pharetra. Eu risus laoreet facilisis volutpat id integer sagittis. Gravida a, urna ultrices vestibulum id nibh. Ornare viverra dui accumsan, velit hac sed viverra. Sem auctor arcu sapien in tristique ultrices. Eget donec lacus interdum lacus, dignissim massa. Elit nulla ac nulla malesuada facilisis sed. Elementum justo, rutrum vulputate magna at arcu, mattis. Et purus iaculis cras tellus lectus.",
      style: profileText,
    );
  }
}
