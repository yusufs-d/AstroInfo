import 'package:astro_info/pages/login_screen/sign_in_column.dart';
import 'package:astro_info/pages/login_screen/sign_up_column.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  Widget _currentColumn = SignInColumn();
  String _screenTitle = "Welcome to ";
  String _textButtonText = "Didn't you sign up yet ?";

          void changeCurrentColumn() {
      setState(() {
        if (_screenTitle == "Welcome to ") {
          _screenTitle = "Sign Up to ";
          _textButtonText = "Do you have an account already ?";
          _currentColumn = SignUpColumn();
        } else {
          _screenTitle = "Welcome to ";
          _textButtonText = "Didn't you sign up yet ?";
          _currentColumn = SignInColumn();
          
        }
      });
    }

  @override
  Widget build(BuildContext context) {




    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("images/backgrounds/background.jpeg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.dstATop),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _screenTitle,
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                ),
                const Text(
                  "AstroInfo",
                  style: TextStyle(
                      color: Color.fromARGB(255, 114, 114, 114),
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 85,horizontal: 10),
                  width: MediaQuery.of(context).size.width / 1.3,
                  height: _screenTitle=="Welcome to " ? 380 : 500,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 114, 114, 114),
                      ),
                      borderRadius: BorderRadius.circular(40)),
                  child: Column(
                    children: [
                      _currentColumn,
                      const SizedBox(
                        height: 12,
                      ),
                      TextButton(
                        onPressed: changeCurrentColumn,
                        child:  Text(
                          _textButtonText,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                  width: 166,
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("images/nebulas/helix.png"),fit: BoxFit.cover)
                  ),
                 
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
