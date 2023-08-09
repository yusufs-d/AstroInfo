import 'package:flutter/material.dart';

SnackBar ErrorMessage(String text){
  return SnackBar(
    backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      content: Container(

        width: 30,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(40),

          color: Color.fromARGB(255, 114, 114, 114).withOpacity(0.3),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error,size: 16,color: Colors.white.withOpacity(0.6),),
              SizedBox(width: 10,),
              Expanded(child: Text(text, style: TextStyle(color: Colors.white.withOpacity(0.6),fontSize:  16,))),
            ],
          ),
        ),
      ),

    );
}