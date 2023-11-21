import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project1/pages/auth/login_page.dart';
import 'package:provider/provider.dart';

import '../provider/google_singin_provider.dart';
import '../provider/user_provider.dart';
import '../widgets/logged_in.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>UserProvider()),
        ChangeNotifierProvider(create: (_)=>GoogleSignInProvider()),
      ],
      child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context,snapshot){
              if(snapshot.connectionState==ConnectionState.active){
                if(snapshot.hasData){
                  return const LoggedInWidget();
                }else if(snapshot.hasError){
                  return Center(child: Text('${snapshot.error}'),);
                }
              }
              if(snapshot.connectionState==ConnectionState.waiting){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return const LoginScreen();
            },
      ),
    );
  }
}