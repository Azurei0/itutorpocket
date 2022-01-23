import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_test/ContentProvider/cp_profilepage.dart';
//import 'package:project_test/ContentProvider/cp_showcontent.dart';
import 'ContentProvider/cp_courselist.dart';
import 'package:project_test/ContentProvider/cp_courselist.dart';
import 'package:project_test/ContentProvider/cp_testPage.dart';
import 'Bottom_Navigation/bottom_navigation.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override

  //form key
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //firebase
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,

      //validator: (value) {if(value!.isEmpty){return ("Please Enter Your Email");}
      //if(RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a=z]").hasMatch(value))
      //{return ("Please enter a valid email");}return null;},

      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,

      //validator: (value){RegExp regex = RegExp(r'^.{6,}$');
      //if(value!.isEmpty){return("Please enter your password");}
      //if(regex.hasMatch(value)){return("Please enter a valid password");}},

      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final loginButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Colors.yellow,
        child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () =>
              signin(emailController.text, passwordController.text),
          child: const Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ));

    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.greenAccent,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                      child: Image.asset("assets/images/main_logo.png"),
                    ),
                    const SizedBox(height: 45),
                    emailField,
                    const SizedBox(height: 5),
                    passwordField,
                    const SizedBox(height: 45),
                    loginButton,
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Don't have an account?"),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignupPage()));
                          },
                          child: const Text(
                            " Sign Up",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //login function == OLD
  // void logIn(String email, String password) async {
  //   if (_formKey.currentState!.validate()) {
  //     await _auth
  //         .signInWithEmailAndPassword(email: email, password: password)
  //         .then((uid) => {
  //               Fluttertoast.showToast(msg: "Login Successful"),
  //               // Navigator.of(context).pushReplacement(MaterialPageRoute(
  //               //  builder: (context) => const BotNavigation())),
  //               Navigator.of(context).pushReplacement(MaterialPageRoute(
  //                   builder: (context) => const CPCourseList())),
  //             })
  //         .catchError((e) {
  //       Fluttertoast.showToast(msg: e!.message);
  //     });
  //   }
  // }

  signin(String email, String password) async {
    var firestore = FirebaseFirestore.instance;
    //var _firebaseUser = FirebaseAuth.instance.currentUser;
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((result) =>
              firestore.collection("user").doc(email).get().then((value) {
                // check userType
                var userType = value.data()?["userType"];
                if (userType == "contentProvider") {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => CPCourseList()));
                } else if (userType == "student") {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => BotNavigation()));
                } // Success
              }));
    } on FirebaseAuthException catch (error) {
      log(error.toString());
      Fluttertoast.showToast(gravity: ToastGravity.TOP, msg: error.message!);
    }
  }
}
