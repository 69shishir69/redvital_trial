import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_password_login/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import 'image_upload.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  // ImagePicker image = ImagePicker();
  // File? file;
  //
  // Future getImage() async {
  //   var img = await image.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     if(img != null){
  //       file = File(img.path);
  //       uploadImage();
  //     } else{
  //       // showing a snack bar with error
  //       showSnackBar("No file selected", Duration(milliseconds: 400));
  //     }
  //
  //   });
  // }

  // Future uploadImage() async {
  //     Reference ref = FirebaseStorage.instance.ref().child("images");
  //     await ref.putFile(file!);
  // }



  // method for snack bar
  // showSnackBar(String snackText, Duration d){
  //   final snackBar = SnackBar(content: Text(snackText));
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }

    User? user = FirebaseAuth.instance.currentUser;
    UserModel loggedInUser = UserModel();

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
    }
    @override
    Widget build(BuildContext context) {
      return SizedBox(
        height: 115,
        width: 115,
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
                  // child
                  // : file == null
                  // ? const Center(
                  // child: Text('NoImg'))
                  // : Image.file(file!),
              backgroundImage: AssetImage("assets/profile.png"),
            ),
            Positioned(
              right: -16,
              bottom: 0,
              child: SizedBox(
                height: 46,
                width: 46,
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: Colors.white),
                    ),
                    primary: Colors.white,
                    backgroundColor: Color(0xFFF5F6F9),
                  ),
                  onPressed: () {
                    ImageUpload(userId: loggedInUser.uid);
                  },
                  child: SvgPicture.asset("assets/Camera_Icon.svg"),
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   throw UnimplementedError();
  // }


// class ProfilePic extends StatelessWidget {
//   const ProfilePic({
//     Key? key,
//   }) : super(key: key);
//
//   ImagePicker image = ImagePicker();
//   File? file;
//   getImage() async {
//     var img = await image.pickImage(source: ImageSource.gallery);
//     setState((){
//       file = File(img.path)
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 115,
//       width: 115,
//       child: Stack(
//         fit: StackFit.expand,
//         clipBehavior: Clip.none,
//         children: [
//           CircleAvatar(
//             backgroundImage: AssetImage("assets/profile.png"),
//           ),
//           Positioned(
//             right: -16,
//             bottom: 0,
//             child: SizedBox(
//               height: 46,
//               width: 46,
//               child: TextButton(
//                 style: TextButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(50),
//                     side: BorderSide(color: Colors.white),
//                   ),
//                   primary: Colors.white,
//                   backgroundColor: Color(0xFFF5F6F9),
//                 ),
//                 onPressed: () {},
//                 child: SvgPicture.asset("assets/Camera_Icon.svg"),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

