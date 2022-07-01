import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemSlider1Widget extends StatelessWidget {

  String image;
  ItemSlider1Widget({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      width: 180.0,
      margin: const EdgeInsets.symmetric(horizontal: 6.0,vertical: 10.0,),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: NetworkImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}