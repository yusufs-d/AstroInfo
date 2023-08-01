import 'package:astro_info/utils/rectangle_image_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return ProfileScreenState();
  }
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 114, 114, 144)),
        title: const Text(
          "Profile",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),
        ),
      ),
      body: Column(children: [
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            SizedBox(
              width: 6,
            ),
            Text(
              "Welcome ",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            Text(
              "protonN !",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        RectangleImageContainer(
          containerWidth: MediaQuery.of(context).size.width,
          containerHeight: 150,
          title: "Favourite Objects",
          subtitle: "You have 3 favourite objects",
          image: Image.network(
              "https://cdn-icons-png.flaticon.com/512/2240/2240744.png"),
        ),
        SizedBox(
          height: 12,
        ),
        RectangleImageContainer(
          containerWidth: MediaQuery.of(context).size.width,
          containerHeight: 150,
          title: "Favourite Articles",
          subtitle: "You have 7 favourite articles",
          image: Image.network(
              "https://cdn-icons-png.flaticon.com/512/1162/1162292.png"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 114, 114, 114).withOpacity(0.6),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                Text(
                  "Sign Out",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
