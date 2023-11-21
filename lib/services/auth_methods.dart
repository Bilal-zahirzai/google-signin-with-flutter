
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project1/models/user_data.dart';

class AuthMethods{
  final FirebaseAuth _auth= FirebaseAuth.instance;
  final FirebaseFirestore _fireStore=FirebaseFirestore.instance;
  Future<String> registerUser({
  required String email,
    required String password,
    required String name,
    required String lastName,
    required String accountType,

})async{
   String resp="Some Error occurred";
   try{
     UserCredential credential=await _auth.createUserWithEmailAndPassword(
         email: email, password: password);
     UserData userData=UserData(
         name: name,
         uid: credential.user!.uid,
         lastName: lastName,
         email: email,
         accountType: accountType,
     );
     await _fireStore.collection('Users').doc(credential.user!.uid).set(
         userData.toJson()
     );
     resp='success';

   }catch(err){
     resp=err.toString();
   }
   return resp;
  }

  Future<String> loginUser({
  required String email,
    required String password,
})async{
    String res="some error occurred";
    try{
      await _auth.signInWithEmailAndPassword(
          email: email,
          password: password);
      res="success";
    }catch(e){
      res=e.toString();
    }
    return res;
  }

  Future<UserData> getUserDetails()async{
    User currentUser=_auth.currentUser!;
    DocumentSnapshot snap=
    await _fireStore
        .collection('Users')
        .doc(currentUser.uid)
        .get();
    return UserData.fromSnap(snap);
  }

}