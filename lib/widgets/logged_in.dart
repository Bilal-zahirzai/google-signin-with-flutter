import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project1/provider/google_singin_provider.dart';
import 'package:project1/provider/user_provider.dart';
import 'package:provider/provider.dart';
import '../models/user_data.dart';
class LoggedInWidget extends StatefulWidget {
  const LoggedInWidget({Key? key}) : super(key: key);
  @override
  State<LoggedInWidget> createState() => _LoggedInWidgetState();
}
class _LoggedInWidgetState extends State<LoggedInWidget> {
  final FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  updateData()async{
    UserProvider userProvider=Provider.of(context,listen: false);
    await userProvider.refreshUser();
  }
  String? accountType;
  @override
  void initState() {
    super.initState();
    updateData();
  }
  @override
  Widget build(BuildContext context) {
    UserData? userData=Provider.of<UserProvider>(context).getUser;
    final user=FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logged In',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.black87,
        actions: [
          TextButton(onPressed: (){
            final provider= Provider.of<GoogleSignInProvider>(context,listen:false);
            provider.logout();
          }, child: const Text('Logout'))
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.blueGrey.shade900,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Profile',
            style: TextStyle(fontSize: 24,color: Colors.white),
            ),
            const SizedBox(height: 32,),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoURL??""),
            ),
            const SizedBox(height: 8,),
            const SizedBox(height: 8,),
            Text(
              user.displayName==null?
              'Name: ${userData?.name}' :'Name: ${user.displayName}',
              style:const TextStyle(color: Colors.white,fontSize: 16),
            ),
            const SizedBox(height: 8,),
            Text(
              'Email: ${user.email}',
              style:const TextStyle(color:Colors.white,fontSize: 16),
            ),
            Text(
              'uid: ${user.uid}',
              style:const TextStyle(color:Colors.white,fontSize: 16),
            ),
            Text(
              'account type: ${userData?.accountType}',
              style:const TextStyle(color:Colors.white,fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
