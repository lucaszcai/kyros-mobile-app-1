import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kyros_app_mobile/screens/root_screen.dart';
import 'package:kyros_app_mobile/screens/sign_up_screen.dart';
import 'package:kyros_app_mobile/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();

  AuthService authService = new AuthService();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;

    signIn() async {
      if (formKey.currentState!.validate()) {
        setState(() {
          isLoading = true;
        });

        await authService
            .signInWithEmailAndPassword(
                emailEditingController.text, passwordEditingController.text)
            .then((result) async {
          print(result);
          if (result != null) {
            print('going to home screen');
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => RootScreen()));
          } else {
            setState(() {
              isLoading = false;
            });
          }
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
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
                SizedBox(
                  height: 50.0,
                ),
                GestureDetector(
                  onTap: () {
                    signIn();
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
                      "Sign In",
                      // style: biggerTextStyle(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => SignupScreen()));
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
                      // style: biggerTextStyle(),
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
