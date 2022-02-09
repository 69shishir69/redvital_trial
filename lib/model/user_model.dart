class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  String? phoneNo;
  String? bloodType;
  String? downloadURL;

  UserModel({this.uid, this.email, this.firstName, this.secondName, this.downloadURL, this.phoneNo, this.bloodType});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
      downloadURL: map['downloadURL'],
      phoneNo: map['phoneNo'],
      bloodType: map['bloodType'],
    );
  }



  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'phoneNo': phoneNo,
      'bloodType': bloodType
    };
  }
}


class RequestBloodModel {
  String? requesterId;
  String? patientName;
  String? contactNo;
  String? bloodType;
  String? neededBy;
  String? medicalCenter;
  // String? message;

  RequestBloodModel({this.requesterId, this.patientName, this.contactNo, this.bloodType, this.neededBy, this.medicalCenter});

  // receiving data from server
  factory RequestBloodModel.fromMap(map) {
    return RequestBloodModel(
      requesterId: map['requesterId'],
      patientName: map['patientName'],
      contactNo: map['contactNo'],
      bloodType: map['bloodType'],
      neededBy: map['neededBy'],
      medicalCenter: map['medicalCenter'],
      // message: map['message'],
    );
  }



  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'requesterId': requesterId,
      'patientName': patientName,
      'contactNo': contactNo,
      'bloodType': bloodType,
      'neededBy': neededBy,
      'medicalCenter': medicalCenter,
      // 'message': message
    };
  }
}



