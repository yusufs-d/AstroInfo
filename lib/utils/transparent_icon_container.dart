import 'package:astro_info/utils/page_navigation.dart';
import 'package:flutter/material.dart';

class TransparentIconContainer extends StatelessWidget {

  const TransparentIconContainer(
      {super.key,
      required this.img,
      required this.title,
      required this.content,
      required this.target,
      });

  final Widget img;
  final Widget title;
  final String content;
  final int target;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 60),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage("images/backgrounds/background.jpeg"),
                      fit: BoxFit.cover),
                  border: Border.all(
                      color: const Color.fromARGB(255, 114, 114, 114),
                      width: 2),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  children: [
                    const Expanded(
                        child: SizedBox(
                      height: 10,
                    )),
                    Expanded(child: title),
                    Expanded(
                      child: Text(
                        content,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 114, 114, 114)
                                .withOpacity(0.4),
                            border: const Border(
                              top: BorderSide(
                                color: Color.fromARGB(255, 114, 114, 114),
                              ),
                            ),
                          ),
                          child:  InkWell(
                            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>  BottomNavigationBarWidget(externalIndex: target,)));},
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Start to discover",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(Icons.arrow_forward_ios,
                                    color: Colors.white, size: 16),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 8.3,
                child: img,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
