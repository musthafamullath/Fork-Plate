import 'package:flutter/material.dart';

class SectionHead extends StatelessWidget {
  const SectionHead({super.key, required this.heading});

  final String heading;
  @override
  Widget build(BuildContext context) {
    return Text(
      
      heading,
      style: const TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 25),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
      overflow: TextOverflow.clip,
    );
  }
}