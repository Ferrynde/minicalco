import'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final color;
  final textcolor;
  final String text;
  final appui;
  
 Buttons({super.key,
   required this.color,
   required this.textcolor,
   required this.text,
   required this.appui,
 
 });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: appui,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
                child: Text(text, style: TextStyle(color: textcolor, fontSize: 20 ),)),
          ),
        ),
      ),
    );
  }
}
