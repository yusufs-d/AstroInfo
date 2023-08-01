import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
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
      final firebaseApp = Firebase.app();
      final rtdb = FirebaseDatabase.instanceFor(
          app: firebaseApp,
          databaseURL:
              'https://astroinfo-95c4f-default-rtdb.europe-west1.firebasedatabase.app');
      DatabaseReference ref = rtdb.ref("Users");
      DatabaseReference uniqueUserRef = ref.push();
      uniqueUserRef.set({
        "Real Name": _realNameController.text.trim(),
        "User Name": _userNameController.text.trim(),
        "Email": _signUpEmailController.text.trim(),
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
