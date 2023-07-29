import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageTextContainer extends StatelessWidget {
  const ImageTextContainer({
    super.key,
    required this.containerWidth,
    required this.containerHeight,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  final double containerWidth;
  final double containerHeight;
  final String title;
  final String subtitle;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      },
      child: Container(
        margin:  const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
        width: containerWidth,
        height: containerHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(imagePath), fit: BoxFit.cover),
          border: Border.all(
              color: const Color.fromARGB(255, 114, 114, 114), width: 2),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(
                    "Helix Nebula",
                    style: GoogleFonts.lato(
                        fontSize: 30, color: Colors.white.withOpacity(0.8)),
                    textAlign: TextAlign.left,
                  ),
                  const Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,size: 20,),

                ],
              ),
              Row(
                children: [
                  Text(
                    "Is it future of the our Sun?",
                    style: GoogleFonts.lato(
                        fontSize: 20, color: Colors.white.withOpacity(0.8)),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
