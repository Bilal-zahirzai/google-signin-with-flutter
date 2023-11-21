import 'package:flutter/material.dart';
import 'package:project1/pages/auth/login_page.dart';
import 'package:project1/services/auth_methods.dart';
import 'package:project1/utils/toast.dart';
import 'package:project1/widgets/custom_button.dart';
import 'package:project1/widgets/drop_down_list.dart';
import 'package:project1/widgets/text_field.dart';
import '../../utils/validation.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  String? userType;
  bool isLoading=false;
  @override
  void dispose(){
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  void registerUser()async{
    String resp=await AuthMethods().registerUser(
      email: emailController.text,
      password: passwordController.text,
      name: firstNameController.text,
      lastName: lastNameController.text,
      accountType: userType!,
      //profilePhoto: profilePhoto
    );
    if(resp=='success'){
      setState(() {
        isLoading=false;
      });
      CustomToastMessage().successToast("Account successfully created!");
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const LoginScreen()));

    }else{
      CustomToastMessage().errorToast(resp);
      setState(() {
        isLoading=false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar:AppBar(
          leading: const BackButton(color: Colors.black,),
          title: const Text(
            'Create Account',
            style: TextStyle(color: Colors.black), // Set the text color to black
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: true,
        ),
        body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 20,),
              const Padding(
                padding:  EdgeInsets.only(bottom: 10.0),
                child: Text("Name *"),
              ),
              ReusableTextField(
                validator: validateAlphabetic,
                  hintText: "First Name", controller: firstNameController, isMultiline: false),
              const SizedBox(height: 10,),
              const Padding(
                padding:  EdgeInsets.only(bottom: 10.0),
                child: Text("Last Name *"),
              ),
              ReusableTextField(validator:validateAlphabetic,hintText: "Last Name", controller: lastNameController, isMultiline: false),
              const SizedBox(height: 10,),
              const Padding(
                padding:  EdgeInsets.only(bottom: 10.0),
                child: Text("Email *"),
              ),
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
              const SizedBox(height: 10,),
              //password text
              const Padding(
                padding:  EdgeInsets.only(bottom: 10.0),
                child: Text("Password *"),
              ),
              //password text field
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
              ),const SizedBox(height: 10,),
              const Padding(
                padding:  EdgeInsets.only(bottom: 10.0),
                child: Text("Account Type *"),
              ),
              AppDropdownInput(
                hintText: 'Account Type',
                options: const ['Personal', 'Business'],
                validator: (value) {
                  if (userType == null || userType!.isEmpty) {
                    return 'Please select your account type';
                  }
                  return null;
                },
                value: userType,
                onChanged: (String value) {
                  setState(() {
                    userType = value;
                  });
                },
                getLabel: (String value) => value,
              ),
              const SizedBox(height: 10,),
              CustomButton(
                isLoading: isLoading,
                title: "Create",
                function: (){
                if (_formKey.currentState?.validate() == true) {
                  setState(() {
                    isLoading=true;
                  });
                  registerUser();
                }
              },
              )
            ],
          ),
        ),
      ),
    );
  }
}