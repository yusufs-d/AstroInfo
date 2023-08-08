import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RectangleImageContainer extends StatelessWidget {
  const RectangleImageContainer({
    super.key,
    required this.containerWidth,
    required this.containerHeight,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.target,
  });

  final double containerWidth;
  final double containerHeight;
  final String title;
  final String subtitle;
  final Widget image;
  final Widget target;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.black,
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => target,),);},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        width: containerWidth,
        height: containerHeight,
        decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromARGB(255, 114, 114, 114), width: 2),
          
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 40,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
                  child: image,
                ),
              ),
            ),
            Expanded(
              flex: 60,
              child: Column(
                children: [
                
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(color: Colors.white),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.white,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  
                    Text(
                      subtitle,
                      softWrap: true,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(color: Colors.white),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
