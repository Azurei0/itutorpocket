import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_test/ContentProvider/cp_addcontentpage.dart';
import 'package:project_test/ContentProvider/cp_showcontent.dart';
import 'package:project_test/Models/user_model.dart';
import 'package:project_test/Models/contentprovider_model.dart';
import 'Bottom_Navigation/bottom_navigation.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  final emailEditingController = TextEditingController();
  final usernameEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final reenterpasswordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,

      //validator: (value) {if(value!.isEmpty) {return ("Please Enter Your Email");}
      //if(RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a=z]").hasMatch(value))
      //{return ("Please enter a valid email");}return null;},

      onSaved: (value) {
        emailEditingController.text = value!;
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

    final usernameField = TextFormField(
      autofocus: false,
      controller: usernameEditingController,
      keyboardType: TextInputType.emailAddress,

      //validator: (value) {if(value!.isEmpty) {return ("Please enter your username");}
      //if(RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a=z]").hasMatch(value))
      //{return ("Please enter your username");}return null;},

      onSaved: (value) {
        usernameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Username",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,

      //validator: (value){RegExp regex = RegExp(r'^.{6,}$');
      //if(value!.isEmpty){return("Please enter your password");}
      //if(regex.hasMatch(value)){return("Please enter a valid password");}},

      onSaved: (value) {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final reenterpasswordField = TextFormField(
      autofocus: false,
      controller: reenterpasswordEditingController,
      obscureText: true,
      validator: (value) {
        if (reenterpasswordEditingController.text !=
            passwordEditingController.text) {
          return "Password Doesn't Match";
        }
        return null;
      },
      onSaved: (value) {
        reenterpasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Re-enter Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final usersignupButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Colors.yellow,
        child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signUp(emailEditingController.text, passwordEditingController.text);
          },
          child: const Text(
            "Sign Up as Students",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ));

    final cpsignupButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Colors.yellow,
        child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signUpCP(
                emailEditingController.text, passwordEditingController.text);
          },
          child: const Text(
            "Sign Up as Content Provider",
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
                    usernameField,
                    const SizedBox(height: 5),
                    passwordField,
                    const SizedBox(height: 5),
                    reenterpasswordField,
                    const SizedBox(height: 45),
                    usersignupButton,
                    const SizedBox(height: 5),
                    cpsignupButton,
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()});
      } on FirebaseAuthException catch (e) {
        // TODO
        Fluttertoast.showToast(msg: e.message!, gravity: ToastGravity.TOP);
      }
      //     .catchError((e) {
      //   Fluttertoast.showToast(msg: e!.message);
      // });
    }
  }

  void signUpCP(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestoreCP()});
      } on FirebaseAuthException catch (e) {
        Fluttertoast.showToast(msg: e.message!, gravity: ToastGravity.TOP);
      }

      //     .catchError((e) {
      //   Fluttertoast.showToast(msg: e!.message);
      // });
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.username = usernameEditingController.text;
    userModel.userType = "student";

    await firebaseFirestore
        .collection("user")
        .doc(user.email)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Signed Up Successfully");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => const BotNavigation()),
            (route) => false);
  }

  postDetailsToFirestoreCP() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    //cannot find _auth?
    User? contentprovider = _auth.currentUser;

    CPModel cpModel = CPModel();

    cpModel.email = contentprovider!.email;
    cpModel.uid = contentprovider.uid;
    cpModel.username = usernameEditingController.text;
    cpModel.userType = "contentProvider";

    await firebaseFirestore
        .collection("user")
        .doc(contentprovider.email)
        .set(cpModel.toMap());
    Fluttertoast.showToast(msg: "Signed Up Successfully");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => const CPShowModuleContent()),
            (route) => false);
  }
}