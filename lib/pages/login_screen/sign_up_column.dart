import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpColumn extends StatelessWidget {
  SignUpColumn({super.key});
  final _realNameController = TextEditingController();
  final _userNameController = TextEditingController();
  final _signUpEmailController = TextEditingController();
  final _signUpPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future signUp() async {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _signUpEmailController.text.trim(),
        password: _signUpPasswordController.text.trim(),
      );
      CollectionReference users = FirebaseFirestore.instance.collection("Users");
      CollectionReference objects = FirebaseFirestore.instance.collection("SpaceObjects");
      CollectionReference articles = FirebaseFirestore.instance.collection("Articles");
    
      final _snapshot_for_articles = await articles.count().get();
      final _snapshot_for_objects = await objects.count().get();

      final objects_count = _snapshot_for_objects.count;
      final articles_count = _snapshot_for_articles.count;


      
      users.add({
        "email":_signUpEmailController.text.trim(),
        "username":_userNameController.text.trim(),
        "realname":_realNameController.text.trim(),
        "numberOfObjectsToExplore": objects_count,
        "numberOfArticlesToRead": articles_count,
        "favouriteObjects":[],
        "favouriteArticles":[],
        "clickedObjects":[],
        "clickedArticles":[],

      });
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 100, right: 10, left: 10),
          child: TextField(
            style: const TextStyle(color: Colors.white),
            controller: _realNameController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
              labelText: 'Real Name',
              labelStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12, right: 10, left: 10),
          child: TextField(
            style: const TextStyle(color: Colors.white),
            controller: _userNameController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
              labelText: 'Username',
              labelStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12, right: 10, left: 10),
          child: TextField(
            style: const TextStyle(color: Colors.white),
            controller: _signUpEmailController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12, right: 10, left: 10),
          child: TextField(
            style: const TextStyle(color: Colors.white),
            controller: _signUpPasswordController,
            obscureText: true,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
              labelText: 'Password',
              labelStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        ElevatedButton(
          onPressed: signUp,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 114, 114, 114).withOpacity(0.4),
            ),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 120, vertical: 10)),
            textStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 20),
            ),
          ),
          child: Text(
            "Sign Up",
            style: TextStyle(color: Colors.white.withOpacity(0.9)),
          ),
        ),
      ],
    );
  }
}
