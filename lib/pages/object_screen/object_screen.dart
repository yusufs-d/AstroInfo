import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ObjectPage extends StatefulWidget {
  const ObjectPage({
    super.key,
    required this.name,
    required this.subtitle,
    required this.content,
    required this.photo,
    required this.category,
  });

  final String name;
  final String subtitle;
  final String content;
  final String photo;
  final String category;

  @override
  State<StatefulWidget> createState() {
    return ObjectPageState();
  }
}

class ObjectPageState extends State<ObjectPage> {
  static Icon unStar = const Icon(Icons.star_border,
      size: 30, color: Color.fromARGB(255, 114, 114, 114));
  Icon star = const Icon(Icons.star,
      size: 30, color: Color.fromARGB(255, 114, 114, 114));
  Icon currentIcon = unStar;
  _checkIsClicked() async {
    FirebaseFirestore.instance
        .collection("Users")
        .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .get()
        .then((QuerySnapshot s) {
      s.docs.forEach((element) {
        var userID = element.reference.id;
        var data = element.data() as Map<String, dynamic>;
        var clickedList = data["clickedObjects"];
        var favObjects = data["favouriteObjects"];

        var numberOfObjectsToExplore = data["numberOfObjectsToExplore"];
        if (favObjects.contains(widget.name)) {
          setState(() {
            currentIcon = star;
          });
        }
        if (!clickedList.contains(widget.name)) {
          FirebaseFirestore.instance.collection("Users").doc(userID).update({
            "clickedObjects": FieldValue.arrayUnion([widget.name]),
            "numberOfObjectsToExplore": numberOfObjectsToExplore - 1
          });
        }
      });
    });
  }

  void addFavourite() {
    if (currentIcon == unStar) {
      setState(() {
        currentIcon = star;
      });

      FirebaseFirestore.instance
          .collection("Users")
          .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
          .get()
          .then((QuerySnapshot s) {
        String userID = s.docs[0].reference.id;

        List<String> favArticles = [widget.name];
        FirebaseFirestore.instance
            .collection("Users")
            .doc(userID)
            .update({"favouriteObjects": FieldValue.arrayUnion(favArticles)});
      });
    } else {
      setState(() {
        currentIcon = unStar;
      });
      FirebaseFirestore.instance
          .collection("Users")
          .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
          .get()
          .then((QuerySnapshot s) {
        String userID = s.docs[0].reference.id;

        List<String> favArticles = [widget.name];
        FirebaseFirestore.instance
            .collection("Users")
            .doc(userID)
            .update({"favouriteObjects": FieldValue.arrayRemove(favArticles)});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _checkIsClicked();
    return Scaffold(
      appBar: AppBar(
        actions: [TextButton(onPressed: addFavourite, child: currentIcon)],
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 114, 114, 114),
        ),
        title: Text(
          widget.name,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(widget.photo),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.compare_arrows,
                            color: Colors.white.withOpacity(0.6),
                            size: 20,
                          ),
                          const Text(
                            " Distance: ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            "1.5AU",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.radio_button_on_sharp,
                            color: Colors.white.withOpacity(0.6),
                            size: 20,
                          ),
                          const Text(
                            " Radius: ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            "43.3R",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.group_work,
                            color: Colors.white.withOpacity(0.6),
                            size: 20,
                          ),
                          const Text(
                            " Constellation: ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            "43.3R",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    widget.category == "planet" ||
                            widget.category == "star" ||
                            widget.category == "neutronStar" ||
                            widget.category == "blackHole"
                        ? Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.line_weight,
                                  color: Colors.white.withOpacity(0.6),
                                  size: 20,
                                ),
                                const Text(
                                  " Mass: ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  "23.33",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: 20),
                                )
                              ],
                            ),
                          )
                        : const SizedBox(),
                    widget.category == "star" || widget.category == "planet"
                        ? Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.thermostat,
                                  color: Colors.white.withOpacity(0.6),
                                  size: 20,
                                ),
                                const Text(
                                  " Temperature: ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  "23.33",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: 20),
                                )
                              ],
                            ),
                          )
                        : const SizedBox(),
                    widget.category == "planet" ||
                            widget.category == "star" ||
                            widget.category == "neutronStar" ||
                            widget.category == "blackHole"
                        ? Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.line_weight,
                                  color: Colors.white.withOpacity(0.6),
                                  size: 20,
                                ),
                                const Text(
                                  " Volume: ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  "23.33",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: 20),
                                )
                              ],
                            ),
                          )
                        : const SizedBox(),
                    widget.category == "planet"
                        ? Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.scatter_plot_outlined,
                                  color: Colors.white.withOpacity(0.6),
                                  size: 20,
                                ),
                                const Text(
                                  " Number of Moons: ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  "43.3R",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: 20),
                                )
                              ],
                            ),
                          )
                        : SizedBox(),
                    widget.category == "planet"
                        ? Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.timelapse,
                                  color: Colors.white.withOpacity(0.6),
                                  size: 20,
                                ),
                                const Text(
                                  " Period: ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  "43.3R",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: 20),
                                )
                              ],
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  width: MediaQuery.of(context).size.width - 30,
                  child: Text(
                    widget.content,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 16, letterSpacing: 1.5),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
