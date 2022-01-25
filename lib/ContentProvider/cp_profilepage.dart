import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_test/ContentProvider/cp_addcontentpage.dart';
import 'package:project_test/Models/contentprovider_model.dart';
import 'package:project_test/login_page.dart';

class CPProfilePage extends StatefulWidget {
  const CPProfilePage({Key? key}) : super(key: key);

  @override
  _CPProfilePageState createState() => _CPProfilePageState();
}

class _CPProfilePageState extends State<CPProfilePage> {
  User? user = FirebaseAuth.instance.currentUser;
  CPModel loggedIn = CPModel();

  // editProfile() {
  //   Navigator.of(context).push(MaterialPageRoute(
  //     builder: (context) => const CPAddModuleContent(),
  //   ));
  // }

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("user")
        .doc(user!.email)
        .get()
        .then((value) {
      loggedIn = CPModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 42, 147, 142),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 245, 200, 64),
        title: const Text("PROFILE"),
        titleTextStyle: const TextStyle(
            fontSize: 25, color: Colors.black87, fontWeight: FontWeight.w600),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  margin: const EdgeInsets.all(8),
                  color: Color.fromARGB(255, 130, 248, 210),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        // Row(
                        //     mainAxisAlignment: MainAxisAlignment.end,
                        //     children: [
                        //       IconButton(
                        //         onPressed: editProfile,
                        //         icon: const Icon(
                        //           Icons.settings_sharp,
                        //           size: 30.0,
                        //         ),
                        //       ),
                        //     ]),
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            "./assets/images/profile_icon.png",
                          ),
                        ),
                        Text(
                          "${loggedIn.username}",
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(
                color: Colors.black87,
                height: 35,
                thickness: 1.5,
              ),
              Card(
                color: Color.fromARGB(255, 130, 248, 210),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "EMAIL",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "${loggedIn.email}",
                            style: const TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "USERTYPE",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "${loggedIn.userType}",
                            style: const TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 50,
        width: 200,
        child: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 245, 200, 64),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign Out',
                style: TextStyle(color: Colors.black87, fontSize: 18),
              ),
              SizedBox(width: 15),
              Icon(
                Icons.logout,
                color: Colors.black87,
              ),
            ],
          ),
          onPressed: () => logout(context),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

Future<void> logout(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginPage()));
}
