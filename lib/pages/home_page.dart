import 'package:astro_info/pages/article_page.dart';
import 'package:astro_info/pages/object_screen/object_screen.dart';
import 'package:astro_info/utils/image_text_container.dart';
import 'package:astro_info/utils/rectangle_image_container.dart';
import 'package:astro_info/utils/transparent_icon_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_digit/animated_digit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int objectCount = 0;
  int articleCount = 0;

  var homeScreenObjectName = "";
  var homeScreenObjectSubtitle = "";
  var homeScreenObjectPhoto = "images/icons/planet_icon.webp";
  var objectTarget = const ObjectPage(
      name: "", subtitle: "", content: "", photo: "", category: "");

  var homeScreenArticleTitle = "";
  var homeScreenArticleSubtitle = "";
  var homeScreenArticlePhoto = "https://wallpaperaccess.com/full/439751.jpg";
  var articleTarget = const ArticlePage(
      id: "",
      title: "",
      subtitle: "",
      content: "",
      photo: "",
      date: "",
      numberOfReaders: 0);

  _getUserData() async {
    await FirebaseFirestore.instance
        .collection("Users")
        .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .get()
        .then((QuerySnapshot s) {
      s.docs.forEach((element) {
        var data = element.data() as Map<String, dynamic>;
        setState(() {
          objectCount = data["numberOfObjectsToExplore"];
          articleCount = data["numberOfArticlesToRead"];
        });
      });
    });
  }

  _getHomeScreenObject() async {
    await FirebaseFirestore.instance
        .collection("HomeScreenItems")
        .doc("homeScreenObject")
        .get()
        .then((value) {
      var objectData = value.data() as Map<String, dynamic>;
      FirebaseFirestore.instance
          .collection("SpaceObjects")
          .where('name', isEqualTo: objectData["name"])
          .get()
          .then((QuerySnapshot s) {
        s.docs.forEach((element) {
          var data = element.data() as Map<String, dynamic>;
          setState(() {
            homeScreenObjectName = data["name"];
            homeScreenObjectSubtitle = data["subtitle"];
            homeScreenObjectPhoto = data["photo"];
            objectTarget = ObjectPage(
                name: data["name"],
                subtitle: data["subtitle"],
                content: data["content"],
                photo: data["photo"],
                category: data["category"]);
          });
        });
      });
    });
  }

  _getHomeScreenArticle() async {
    await FirebaseFirestore.instance
        .collection("HomeScreenItems")
        .doc("homeScreenArticle")
        .get()
        .then((value) {
      var objectData = value.data() as Map<String, dynamic>;
      FirebaseFirestore.instance
          .collection("Articles")
          .where('title', isEqualTo: objectData["title"])
          .get()
          .then((QuerySnapshot s) {
        s.docs.forEach((element) {
          var data = element.data() as Map<String, dynamic>;
          setState(() {
            homeScreenArticleTitle = data["title"];
            homeScreenArticleSubtitle = data["subtitle"];
            homeScreenArticlePhoto = data["photo"];
            articleTarget = ArticlePage(
                id: element.reference.id,
                title: data["title"],
                subtitle: data["subtitle"],
                content: data["content"],
                photo: data["photo"],
                date: data["date"],
                numberOfReaders: data["numberOfReaders"]);
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _getUserData();
    _getHomeScreenObject();
    _getHomeScreenArticle();

    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;
    return Container(
      width: w,
      height: h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Color.fromARGB(255, 32, 32, 32)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TransparentIconContainer(
                  img: Image.asset("images/icons/planet_icon.webp"),
                  title: AnimatedDigitWidget(
                    value: objectCount,
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  content: "Objects",
                  target: 1,
                ),
              ),
              Expanded(
                child: TransparentIconContainer(
                  img: Image.asset("images/icons/article_icon.png"),
                  title: AnimatedDigitWidget(
                    value: articleCount,
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  content: "Articles",
                  target: 2,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: RectangleImageContainer(
                containerWidth: w,
                containerHeight: 100,
                title: homeScreenObjectName,
                subtitle: homeScreenObjectSubtitle,
                image: Image.asset(homeScreenObjectPhoto),
                target: objectTarget,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ImageTextContainer(
                  containerWidth: w,
                  containerHeight: 280,
                  title: homeScreenArticleTitle,
                  subtitle: homeScreenArticleSubtitle,
                  imagePath: homeScreenArticlePhoto,
                  target: articleTarget,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
