// ignore_for_file: unnecessary_new

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:guard/screens/details/details_screen1.dart';

late final RTreference = FirebaseDatabase.instance.reference();

// writing into a realtime firebase
WTDBWrite() {
  RTreference.child("SensorInfo").set({
    'Status': "true",
    'Name': "test",
    'Location': "test",
    'ID': '3',
    'Description': null
  });
}

getReadings(SensorName) {
  var readings = RTreference.child(SensorName)
      .get()
      .then((readings) => print(readings.value));

  return (readings);
  // var readings = RTreference.child(SensorName).onValue.once
}

x() {
  Future<int> GetInitial(String SensorName) async {
    final dbRef = FirebaseDatabase.instance.reference().child(SensorName);
    final snapshot = await dbRef.child(SensorName).once();
    print('Data : ${snapshot.value}');
    return int.parse(snapshot.value);
  }
}

CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('SensorInfo');

// getting all data from Cloud data base
getData() async {
  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _collectionRef.get();

  // Get data from docs and convert map to List
  final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

  print(allData);
}

// Reading data from the Cloud firebase
readData(DocId, field) {
  DocumentReference documentReference =
      FirebaseFirestore.instance.collection("SensorInfo").doc(DocId);

  documentReference.get().then((dataSnapshot) {
    print(dataSnapshot.get(field));
  });
}

// Updating Cloud firebase Values.
updateData(DocId, field, value) {
  DocumentReference documentReference =
      FirebaseFirestore.instance.collection("SensorInfo").doc(DocId);

  documentReference.update({field: value});
}

getDocId() {}

Future<String> getSensorInfo(String sensorName) async {
  await RTreference.child(sensorName).once().then((DataSnapshot dataSnapshot) {
    String val = dataSnapshot.value["Temperature "];
    return val;
  }).catchError((error, stackTrace) {});
  return "";
}

hi() {
  RTreference.child("BME680").once().then((DataSnapshot snapshot) {
    Map<dynamic, dynamic> values = snapshot.value;
    values.forEach((key, value) {
      print(values["Temperture"]);
    });
  });
}