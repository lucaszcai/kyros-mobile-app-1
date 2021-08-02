import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kyros_app_mobile/screens/root_screen.dart';
import 'package:kyros_app_mobile/services/auth_service.dart';


class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();

  signUp() async {

    if(formKey.currentState!.validate()){
      setState(() {

      });

      await authService.signUpWithEmailAndPassword(emailEditingController.text,
          passwordEditingController.text).then((result){
        if(result != null){


          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => RootScreen()
          ));
        }
      });
    }
  }

  AuthService authService = new AuthService();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Container(
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (val) {
                    return RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(val!)
                        ? null
                        : "Please Enter Correct Email";
                  },
                  controller: emailEditingController,
                  decoration: new InputDecoration(hintText: "email"),
                ),
                TextFormField(
                  obscureText: true,
                  validator: (val) {
                    return val!.length > 6
                        ? null
                        : "Enter Password 6+ characters";
                  },
                  controller: passwordEditingController,
                  decoration: new InputDecoration(hintText: "password"),
                ),
                GestureDetector(
                  onTap: () {
                    signUp();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xff007EF4),
                            const Color(0xff2A75BC)
                          ],
                        )),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Sign Up",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
