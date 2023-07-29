import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWithContainer extends StatelessWidget{
  const TextWithContainer({super.key, required this.text});

  final String text;


  @override
  Widget build(BuildContext context) {
    return Container(
                padding: const EdgeInsets.all(4),
                
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 114, 114, 114),
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(14)),
                child: Text(
                  text,
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(color: Colors.white),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  
                  ),
                  textAlign: TextAlign.left,
                ),
              );
    
  }
}