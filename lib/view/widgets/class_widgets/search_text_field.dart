import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_fly/utils/constants.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      padding: const EdgeInsets.all(12),
      placeholder: text,
      backgroundColor: Colors.green[100],
      prefixIcon: Icon(CupertinoIcons.search, color: greenPointShade800),
      suffixIcon:
          Icon(CupertinoIcons.xmark_circle_fill, color: greenPointShade800),
      style: TextStyle(color: greenPointShade800),
      onChanged: (value) async {
      
       
      },
    );
  }
}