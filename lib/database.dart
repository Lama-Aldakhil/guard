// ignore_for_file: unnecessary_new

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:guard/screens/details/details_screen.dart';

late final RTreference = FirebaseDatabase.instance.reference();
late DatabaseReference databaseReference;

RTDBWrite() {
  RTreference.child("SensorInfo").set({
    'Status': "true",
    'Name': "test",
    'Location': "test",
    'ID': '3',
    'Description': null
  });
}

final Stream<QuerySnapshot> sensorInfo =
    FirebaseFirestore.instance.collection("SensorInfo").snapshots();

SensorName() {
  StreamBuilder<QuerySnapshot>(
    stream: sensorInfo,
    builder: (
      BuildContext context,
      AsyncSnapshot<QuerySnapshot> snapshot,
    ) {
      if (snapshot.hasError) {
        return Center(
          child: Text("Something went wrong"),
        );
      }
      if (!snapshot.hasData) {
        return Text("No notice found");
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Text("Loading");
      }
      if (snapshot.hasError) {
        return Text("Something went wrong");
      }
      final data = snapshot.requireData;
      return ListView.builder(
        itemCount: data.size,
        itemBuilder: (context, index) {
          return Text("found");
        },
      );
    },
  );
}

CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('SensorInfo');

Future<void> getData() async {
  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _collectionRef.get();

  // Get data from docs and convert map to List
  final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

  print(allData);
}
