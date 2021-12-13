import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:guard/constants.dart';
import 'package:flutter/services.dart';
import 'package:guard/database.dart';

class DetailsScreen2 extends StatefulWidget {
  const DetailsScreen2({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  DetailsScreen3 createState() => DetailsScreen3(name: name);
}

class DetailsScreen3 extends State<DetailsScreen2> {
  @override
  bool value = true;

  DetailsScreen3({
    Key? key,
    required this.name,
  });

  String name;

  onUpdate() {
    setState(() {
      value = !value; //toggles between true & false
      // updateData(name, 'Status', value);
    });
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var i = 0;
    if (name == "BME680")
      i = 4;
    else
      (i = 2);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
        appBar: buildAppBar(),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Column(children: [
                  SizedBox(height: size.height * 0.02),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Icon(
                  //       Icons.arrow_back,
                  //       size: 30,
                  //       color: kPrimaryColor2,
                  //     ),
                  //     Text(
                  //       'Home',
                  //       style: TextStyle(
                  //         color: Colors.black87,
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 20,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: size.height * 0.03),
                  Row(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/images/light.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: size.width * 0.05),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 35,
                              child: FloatingActionButton.extended(
                                  onPressed: () {
                                    onUpdate();
                                  },
                                  // extendedPadding: EdgeInsets.only(bottom: 10),
                                  label: value ? Text("On") : Text("Off"),
                                  backgroundColor:
                                      value ? kPrimaryColor2 : Colors.grey,
                                  icon: Icon(
                                    value ? Icons.toggle_on : Icons.toggle_off,
                                  ))),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Light & Proximity',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            'Measures the light and proximity ',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            'percentages in your room',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.05),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '0',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              'PROXIMITY',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '48.24',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              'LIGHT',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ]))));
  }

  // Center(
  //     child: SingleChildScrollView(
  //         child: Column(children: [
  //   //should add a condition if off no data shows, condition formatted based on db return value
  //   // if(readData(name,'Status'))
  //   for (int x = 0; x < i; x++) InfoDetails(reading: "test $i", value: 40),
  //   // enable disable button
  //   SizedBox(height: 80),
  //   FloatingActionButton.extended(
  //       onPressed: () {
  //         onUpdate();
  //       },
  //       //extendedPadding: EdgeInsets.only(bottom: 10),
  //       label: value ? Text("On") : Text("Off"),
  //       backgroundColor: value ? kPrimaryColor2 : Colors.grey,
  //       icon: Icon(
  //         value ? Icons.toggle_on : Icons.toggle_off,
  //       ))
  // ]))),

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor2,
      elevation: 0,
      centerTitle: true,
      title: Text("MY ROOM"),
      actions: [
        // IconButton(
        //   icon: Icon(Icons.edit),
        //   onPressed: () {},
        // ),
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
