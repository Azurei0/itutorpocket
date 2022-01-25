import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_test/login_page.dart';
import 'Models/user_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedIn = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("user")
        .doc(user!.email)
        .get()
        .then((value){
          loggedIn = UserModel.fromMap(value.data());
          setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //appBar: AppBar(title: const Text("ITUTORPOCKET"), backgroundColor: Colors.yellow,
      //centerTitle: true,
      //),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 30,),
              Center(
                child: Image.asset("assets/images/profile_icon.png",height: 150),
              ),
              Text("${loggedIn.username}", style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20,),
              const Divider(
                color: Colors.black87,
                height: 35,
                thickness: 1.5,
              ),
              Container(
                height: 70,
                width: 1000,
                color: Colors.yellowAccent,
                padding: const EdgeInsets.all(20),
                  child: Text("Email: ${loggedIn.email}", style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),

              const SizedBox(height: 300,),
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                width: 250,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: MaterialButton(
                  onPressed: () {logout(context);},
                  color: Colors.grey,
                  child: const Text(
                    'LOGOUT',
                    style: TextStyle(fontSize: 20, color: Colors.black,),
                  ),
                ),
              ),

              //ActionChip(label: const Text("LOGOUT"), onPressed: (){
                //logout(context);
              //}),

            ],
          ),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async
  {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}