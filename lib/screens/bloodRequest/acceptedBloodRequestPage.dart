import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_password_login/screens/profile/requestContainer.dart';
import 'package:flutter/material.dart';

import 'acceptedBloodRequest.dart';
import 'myRequest.dart';

class AcceptedBloodRequestPage extends StatefulWidget {
  @override
  _AcceptedBloodRequestPageState createState() => _AcceptedBloodRequestPageState();
}

class _AcceptedBloodRequestPageState extends State<AcceptedBloodRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('requesters').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return ListView.builder(itemCount: snapshot.data!.docs.length,itemBuilder: (context, index) =>AcceptedBloodRequest(
            snap: snapshot.data!.docs[index].data(),

          ));
        },
      ),

    );
  }
}
