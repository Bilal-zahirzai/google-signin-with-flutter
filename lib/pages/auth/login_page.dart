import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project1/pages/auth/signup_page.dart';
import 'package:project1/provider/google_singin_provider.dart';
import 'package:project1/services/auth_methods.dart';
import 'package:project1/widgets/custom_button.dart';
import 'package:project1/widgets/text_field.dart';
import 'package:provider/provider.dart';

import '../../utils/responsive.dart';
import '../../utils/toast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading=false;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  void loginUser()async{
    String res=await AuthMethods().loginUser(
        email: emailController.text,
        password: passwordController.text
    );
    if(res=="success"){
      setState(() {
        isLoading=false;
      });
    }else{
      CustomToastMessage().errorToast(res);
      setState(() {
        isLoading=false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // login text
                    Container(
                      height: getOneFourthHeight(context),
                      padding: const EdgeInsets.only(top: 50),
                      child: const Column(
                        children: [
                          SizedBox(height: 30),
                          Text("Login", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                          SizedBox(height: 15),
                          Text("Login to your Account"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30,),
                    ReusableTextField(
                      hintText: "Email",
                      controller: emailController,
                      isMultiline: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    ReusableTextField(
                      obSecure: true,
                      hintText: "Password",
                      controller: passwordController,
                      isMultiline: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your your password';
                        }else if(value.length<6){
                          return 'Password should contain at least 6 character';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      isLoading: isLoading,
                      title: "Login",
                      function: () async{
                        if (_formKey.currentState?.validate() == true) {
                          setState(() {
                            isLoading=true;
                          });
                          loginUser();
                        }
                      },
                    ),
                    const SizedBox(height: 70),
                    const Text("- Or sign in with -", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 40),
                    IconButton(
                        onPressed: () {
                          final provider= Provider.of<GoogleSignInProvider>(context,listen:false);
                          provider.googleLogin();
                          }, icon: const FaIcon(FontAwesomeIcons.google), iconSize: 35),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?", style: TextStyle(color: Colors.grey)),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpScreen()));
                          },
                            child: const Text("Sign up", style: TextStyle(color: Colors.blue))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
