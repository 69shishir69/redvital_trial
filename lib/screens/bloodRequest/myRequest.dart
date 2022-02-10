import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_password_login/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyRequest extends StatefulWidget {
  final snap;
  const MyRequest({Key? key, required this.snap,}) : super(key: key);

  @override
  State<MyRequest> createState() => _MyRequestState();
}

class _MyRequestState extends State<MyRequest> {

  UserModel loggedInUser = UserModel();
  // RequestBloodModel requestBloodModelTest = RequestBloodModel();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
    // FirebaseFirestore.instance
    //     .collection("donors")
    //     .doc(widget.snap['requestId'])
    //     .get()
    //     .then((value) {
    //   this.requestBloodModelTest = RequestBloodModel.fromMap(value.data());
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    // var acceptData;
    // var newAcceptData;
    // Map<String, dynamic>? newAcceptData;
    // final acceptButton = Material(
    //   elevation: 5,
    //   borderRadius: BorderRadius.circular(20),
    //   color: Colors.redAccent,
    //   child: MaterialButton(
    //       minWidth: 50,
    //       height: 50,
    //       onPressed: () async {
    //         final _donationId = DateTime.now().millisecondsSinceEpoch.toString();
    //         DonorModel donorModel = DonorModel();
    //         donorModel.donationId = _donationId;
    //         donorModel.donorUid = user?.uid;
    //         donorModel.donorName = (loggedInUser.firstName!) + (loggedInUser.secondName)!;
    //         donorModel.contactNo = loggedInUser.phoneNo;
    //         donorModel.requestId = widget.snap['requestId'];
    //         donorModel.requesterUid = widget.snap['requesterUid'];
    //         // DocumentSnapshot acceptData = await FirebaseFirestore.instance.collection('donors')
    //         //                                                               .doc(widget.snap['requestId'])
    //         //                                                               .get();
    //         // acceptData = await FirebaseFirestore.instance
    //         //     .collection("donors")
    //         //     .doc(widget.snap['requestId'])
    //         //     .get();
    //         // newAcceptData = acceptData.data() as Map<String, dynamic>?;
    //         // // newAcceptData = acceptData.data()['accept'];
    //         // print(newAcceptData?['accept']);
    //         // print(widget.snap['accept']);
    //
    //         // print(acceptData);
    //         if(widget.snap['accept'] == "False"){
    //           await firebaseFirestore
    //               .collection("donors")
    //               .doc(_donationId)
    //               .set(donorModel.toMap())
    //               .whenComplete(() => Fluttertoast.showToast(msg: "Accepted!!!"));
    //
    //           // requestBloodModel.accept = "True";
    //           // requestBloodModel.requestId = requestBloodModel.requestId;
    //           // requestBloodModel.requesterUid = requestBloodModel.requesterUid;
    //           // requestBloodModel.contactNo = requestBloodModel.contactNo;
    //           // requestBloodModel.neededBy = requestBloodModel.neededBy;
    //           // requestBloodModel.bloodType = requestBloodModel.bloodType;
    //           // requestBloodModel.patientName = requestBloodModel.patientName;
    //           // requestBloodModel.medicalCenter = requestBloodModel.medicalCenter;
    //
    //           await firebaseFirestore
    //               .collection("requesters")
    //               .doc(widget.snap['requestId'])
    //               .update({"accept": "True"});
    //         } else{
    //           Fluttertoast.showToast(msg: "Request already accepted");
    //         }
    //       },
    //       child:Text(
    //         widget.snap['accept'] == "False"? "Accept" : "Accepted ;__;" ,
    //         textAlign: TextAlign.center,
    //         style: TextStyle(
    //             fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),)
    //   ),
    // widget.snap['patientName']
    // widget.snap['medicalCenter']
    // widget.snap['contactNo']
    // widget.snap['neededBy']
    // );

    if(widget.snap['requesterUid'] == user?.uid){
      return Container(
          width: 200,
          height: 150,
          margin: EdgeInsets.fromLTRB(25, 15, 25, 15),
          padding: EdgeInsets.fromLTRB(15, 8, 15, 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black87),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Text(
                        //   widget.snap['accept'] == "True"? (widget.snap['donorName'] + " has accepted your request.") : "----------No Donor has Accepted yet----------",
                        //   style: TextStyle(
                        //     fontSize: 16,
                        //     fontWeight: FontWeight.w600,
                        //     color: Colors.black87,
                        //   ),
                        // ),
                        Text(
                          "Patient Name:  " + widget.snap['patientName'],
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Location:   " + widget.snap['medicalCenter'] ,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Contact Number:   " + widget.snap['contactNo'] ,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87),
                        ),
                        Text(
                          widget.snap['accept'] == "True"? (widget.snap['donorName'] + " has accepted your request.") : "----------No Donor has Accepted yet----------",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          widget.snap['accept'] == "True"? ("Donor Contact:   " + widget.snap['donorContact']) : "---------------------Please Wait-------------------",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),



                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 28.0,
                width: 55.0,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(15.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.snap['bloodType'],
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
      );} else{
            return Center(
              child: Container(
              ),
            );
    }
  }
}
