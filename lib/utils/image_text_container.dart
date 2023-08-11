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
    required this.target,
  });

  final double containerWidth;
  final double containerHeight;
  final String title;
  final String subtitle;
  final String imagePath;
  final Widget target;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => target,),);
      },
      child: Container(
        margin:  const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
        width: containerWidth,
        height: containerHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(imagePath), fit: BoxFit.cover,colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),),
          border: Border.all(
              color: const Color.fromARGB(255, 114, 114, 114), width: 2),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.lato(
                          fontSize: 30, color: Colors.white.withOpacity(0.8)),
                      textAlign: TextAlign.left,
                    ),
                    const Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,size: 20,),
              
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 2, bottom: 4),
                child: Row(
                  children: [
                    Text(
                      subtitle,
                      style: GoogleFonts.lato(
                          fontSize: 20, color: Colors.white.withOpacity(0.8)),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
