import 'package:flutter/material.dart';
import 'package:project1/pages/home_page.dart';
import 'package:project1/provider/google_singin_provider.dart';
import 'package:project1/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>UserProvider()),
        ChangeNotifierProvider(create: (_)=>GoogleSignInProvider()),
      ],
      child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          ),
    );

  }
}