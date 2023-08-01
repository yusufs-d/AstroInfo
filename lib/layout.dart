import 'package:astro_info/pages/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:astro_info/utils/page_navigation.dart';

class LayoutWidget extends StatefulWidget {
  const LayoutWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LayoutWidgetState();
  }
}

class _LayoutWidgetState extends State<LayoutWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.deepPurple),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text(
              "Something went wrong!",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          );
        } else if (snapshot.hasData) {
          return BottomNavigationBarWidget();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
