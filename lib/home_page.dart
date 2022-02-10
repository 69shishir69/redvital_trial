import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_password_login/screens/bloodRequest/acceptedBloodRequestPage.dart';
import 'package:email_password_login/screens/bloodRequest/myRequestPage.dart';
import 'package:email_password_login/screens/profile/requestContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detail_page.dart';
import 'model/user_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(
            children: [
              _buildStreamBuilder(),
              Padding(
                padding: const EdgeInsets.fromLTRB(25,100,0,0),
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      minimumSize: Size(150.0, 40.0),
                      side: BorderSide(width: 1, color: Colors.red),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MyRequestPage()));
                    },
                    child: Text(
                      "My Requests",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15, color: Colors.red, fontWeight: FontWeight.w600),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(200,100,0,0),
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      minimumSize: Size(150.0, 40.0),
                      side: BorderSide(width: 1, color: Colors.red),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AcceptedBloodRequestPage()));
                    },
                    child: Text(
                      "Accepted Requests ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15, color: Colors.red, fontWeight: FontWeight.w600),
                    )),
              )
            ],
          )
      )
    );
  }

  _buildStreamBuilder(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,100,0,0),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('requesters').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return ListView.builder(itemCount: snapshot.data!.docs.length,itemBuilder: (context, index) =>RequestContainer(
            snap: snapshot.data!.docs[index].data(),

          ));
        },


      ),
    );
  }
}