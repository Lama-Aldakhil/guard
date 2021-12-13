import 'package:flutter/material.dart';
import 'package:guard/database.dart';
import '../../../constants.dart';

class TitleWithMoreBtn extends StatelessWidget {
  const TitleWithMoreBtn({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String title;
  final Function() press;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: <Widget>[
          TitleWithCustomUnderline(text: title),
          Spacer(),
          Container(
              height: 35,
              width: size / 3,
              child: FloatingActionButton.extended(
                onPressed: () {
                  print(getData());
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                label: Text("Add Sensor"),
                elevation: 20,
                backgroundColor: kPrimaryColor,
              )),
          // FlatButton(
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(20),
          //   ),
          //   color: kPrimaryColor,
          //   onPressed: press,
          //   child: Text(
          //     "Add",
          //     style: TextStyle(color: Colors.white),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding / 4),
            child: Text(
              text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     margin: EdgeInsets.only(right: kDefaultPadding / 4),
          //     height: 3,
          //     color: kPrimaryColor.withOpacity(0.2),
          //   ),
          // )
        ],
      ),
    );
  }
}
