import 'package:flutter/material.dart';
import 'package:spicy_food_delivery/Utils/Const.dart';

class CoursesScreen extends StatefulWidget {
  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
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
          "Training",
          style: HeadingTextStyle,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: Container(
            height: 30,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(6)),
            // height: 50,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: DropdownButton(
                  icon: Icon(Icons.keyboard_arrow_down),
                  underline: SizedBox(),
                  isExpanded: true,
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text(
                        "English",
                        style: smallBlackText,
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
                  }),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Course(index);
            },
          ),
        ),
      ),
    );
  }

  Course(int index) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[300], width: 2)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Online training day 7",
                        style: profileTextBold,
                      ),
                      Text(
                        "Reach in 5 minutes",
                        style: subTextStyleSmall,
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mi elementu hvhgyunnn jjjjj wwwwww mmmmmmmmmmmmmmmmmooooooooooouuuuuuuuuuuuuuuuuu",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Read more",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.yellow[800]),
                      )
                    ],
                  ),
                )
              ],
            ),
            Divider(
              thickness: 2,
              color: Colors.grey[400],
              indent: 10,
              endIndent: 10,
            ),
            Button2("Start", Colors.green),
          ],
        ),
      ),
    );
  }

  Widget Image() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: NetworkImage(
                  "https://9to5mac.com/wp-content/uploads/sites/6/2021/04/iPhone-12-purple-wallpaper.jpg?quality=82&strip=all&w=1600"),
              fit: BoxFit.cover)),
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

  WhiteButton(String label) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.green)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            label,
            style: greenText,
          ),
        ),
      ),
    );
  }
}
