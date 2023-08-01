import 'package:astro_info/utils/image_text_container.dart';
import 'package:astro_info/utils/rectangle_image_container.dart';
import 'package:astro_info/utils/transparent_icon_container.dart';
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
  @override
  Widget build(BuildContext context) {
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
                  img: Image.asset(
                      "images/planets/planet_icon.webp"),
                  title: AnimatedDigitWidget(
                    value: 8,
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  content: "Objects",
                ),
              ),
              Expanded(
                child: TransparentIconContainer(
                  img: Image.asset(
                      "images/planets/article_icon.png"),
                  title: AnimatedDigitWidget(
                    value: 28,
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  content: "Articles",
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
                title: "MARS",
                subtitle: "Gorgeous Red Planet of the Solar System",
                image: Image.asset("images/planets/mars.png"),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  child: ImageTextContainer(
                      containerWidth: w,
                      containerHeight: 280,
                      title: "Helix Nebula",
                      subtitle: "Is it future of our Sun?",
                      imagePath:
                          "https://cdn.spacetelescope.org/archives/images/wallpaper4/opo0432d.jpg")),
            ],
          ),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}
