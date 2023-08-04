import 'package:flutter/material.dart';

class ObjectPage extends StatefulWidget {
  const ObjectPage({
    super.key,
    required this.name,
    required this.subtitle,
    required this.content,
    required this.photo,
  });

  final String name;
  final String subtitle;
  final String content;
  final String photo;

  @override
  State<StatefulWidget> createState() {
    return ObjectPageState();
  }
}

class ObjectPageState extends State<ObjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              Row(
                children: [
                  Icon(
                    Icons.line_weight,
                    color: Colors.white.withOpacity(0.6),
                    size: 20,
                  ),
                  Text(
                    "Mass: ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "23.33",
                    style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 20),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.compare_arrows,
                    color: Colors.white.withOpacity(0.6),
                    size: 20,
                  ),
                  Text(
                    "Distance: ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "1.5AU",
                    style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 20),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.radio_button_on_sharp,
                    color: Colors.white.withOpacity(0.6),
                    size: 20,
                  ),
                  Text(
                    "Radius: ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "43.3R",
                    style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 20),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.thermostat,
                    color: Colors.white.withOpacity(0.6),
                    size: 20,
                  ),
                  Text(
                    "Temperature: ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "23.33",
                    style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 20),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.line_weight,
                    color: Colors.white.withOpacity(0.6),
                    size: 20,
                  ),
                  Text(
                    "Volume: ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "23.33",
                    style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 20),
                  )
                ],
              ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.radio_button_on_sharp,
                    color: Colors.white.withOpacity(0.6),
                    size: 20,
                  ),
                  Text(
                    "Number of Moons: ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "43.3R",
                    style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 20),
                  )
                ],
              ),
                          Row(
                children: [
                  Icon(
                    Icons.radio_button_on_sharp,
                    color: Colors.white.withOpacity(0.6),
                    size: 20,
                  ),
                  Text(
                    "Period: ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "43.3R",
                    style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 20),
                  )
                ],
              ),
              SizedBox(height: 20,),
               Container(
                  width: MediaQuery.of(context).size.width - 30,
                  child: Text(
                    widget.content,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 14, letterSpacing: 1.5),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
