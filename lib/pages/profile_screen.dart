import 'package:astro_info/pages/fav_articles_screen.dart';
import 'package:astro_info/pages/fav_objects_screen.dart';
import 'package:astro_info/utils/rectangle_image_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  String username = "";
  int numberOfFavObjects = 0;
  int numberOfFavArticles = 0;
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection("Users")
        .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .get()
        .then((QuerySnapshot s) {
      s.docs.forEach((element) {
        var data = element.data() as Map<String,dynamic>;
        setState(() {
        username = data["username"].toString();
        numberOfFavObjects = data["favouriteObjects"].length;
        numberOfFavArticles = data["favouriteArticles"].length; 
        });
      });
    });
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
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
                username,
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
            containerHeight: 200,
            title: "Favourite Objects",
            subtitle: "You have $numberOfFavObjects favourite objects",
            image: Image.network(
                "https://cdn-icons-png.flaticon.com/512/2240/2240744.png"),
            target: const FavObjectsScreen(),
          ),
          SizedBox(
            height: 12,
          ),
          RectangleImageContainer(
            containerWidth: MediaQuery.of(context).size.width,
            containerHeight: 200,
            title: "Favourite Articles",
            subtitle: "You have $numberOfFavArticles favourite articles",
            image: Image.network(
                "https://cdn-icons-png.flaticon.com/512/1162/1162292.png"),
            target: const FavArticlesScreen(),
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
      ),
    );
  }
}
