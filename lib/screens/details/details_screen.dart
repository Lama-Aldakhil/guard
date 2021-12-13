import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:guard/constants.dart';
import 'package:flutter/services.dart';

class DetailsScreen extends StatefulWidget {
  @override
  DetailsScreen2 createState() => DetailsScreen2();
}

class DetailsScreen2 extends State<DetailsScreen> {
  @override
  bool value = false;

  onUpdate() {
    setState(() {
      value = !value; //toggles between true & false
    });
  }

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(
          child: SingleChildScrollView(
              child: Column(children: [
        // should add a condition if off no data shows, condition formatted based on db return value
        for (int i = 1; i < 6; i++) InfoDetails(reading: "test $i", value: 40),
        // enable disable button
        SizedBox(height: 80),
        FloatingActionButton.extended(
            onPressed: () {
              onUpdate();
            },
            // im here
            //extendedPadding: EdgeInsets.only(bottom: 10),
            label: value ? Text("On") : Text("Off"),
            backgroundColor: value ? kPrimaryColor2 : Colors.grey,
            icon: Icon(
              value ? Icons.toggle_on : Icons.toggle_off,
            ))
      ]))),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor.withOpacity(0.5),
      elevation: 0,
      centerTitle: true,
      title: Text("Location"),
      actions: [
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {},
        ),
      ],
    );
  }
}

class InfoDetails extends StatelessWidget {
  const InfoDetails({
    Key? key,
    required this.reading,
    required this.value,
  }) : super(key: key);

  final String reading;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width / 4,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(this.reading),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(this.value.toString()),
          ),
        ],
      ),
    );
  }
}
