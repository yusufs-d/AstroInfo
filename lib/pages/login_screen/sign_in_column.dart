import 'package:astro_info/utils/error_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class SignInColumn extends StatelessWidget {
  SignInColumn({super.key});
  final _signInEmailController = TextEditingController();
  final _signInPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future signIn() async {
      showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _signInEmailController.text.trim(),
          password: _signInPasswordController.text.trim(),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == "user-not-found" || 
            e.code == "wrong-password" || 
            e.code == "invalid-email"  || 
            _signInEmailController.text.isEmpty || 
            _signInPasswordController.text.isEmpty) {
          FocusScope.of(context).unfocus();

          ScaffoldMessenger.of(context).showSnackBar(

            ErrorMessage("Your email or password is wrong!")
          );

          
        }
      }
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 100, right: 10, left: 10),
          child: TextField(
            style: const TextStyle(color: Colors.white),
            controller: _signInEmailController,
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
            controller: _signInPasswordController,
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
        Padding(
          padding: const EdgeInsets.only(top: 12, right: 10, left: 10),
          child: ElevatedButton(
            onPressed: signIn,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 114, 114, 114).withOpacity(0.4),
              ),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 8)),
              textStyle: MaterialStateProperty.all(
                const TextStyle(fontSize: 20),
              ),
            ),
            child: Text(
              'Sign in',
              style: TextStyle(color: Colors.white.withOpacity(0.9)),
            ),
          ),
        ),
      ],
    );
  }
}
