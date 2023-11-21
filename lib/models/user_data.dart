import 'package:cloud_firestore/cloud_firestore.dart';

class UserData{
  final String name;
  final String lastName;
  final String uid;
  final String accountType;
  final String email;
  UserData({
    required this.name,
    required this.uid,
    required this.lastName,
    required this.email,
    required this.accountType,
  });
  Map<String,dynamic> toJson()=>{
    "Name":name,
    "LastName":lastName,
    "uid":uid,
    "AccountType":accountType,
    "email":email,
  };

  static UserData fromSnap(DocumentSnapshot snap){
    return UserData(
        name: snap['Name'],
        uid: snap['uid'],
        lastName: snap['LastName'],
        email: snap['email'],
        accountType: snap['AccountType']
    );
  }
}