import 'package:flutter/material.dart';

import '../general/general_widget.dart';
import '../responsive/responsive.dart';

class ItemSlider3Widget extends StatelessWidget {
  String image;
  String title;
  Widget toPage;

  ItemSlider3Widget({required this.image, required this.title, required this.toPage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> toPage));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            margin: const EdgeInsets.only(right: 12.0),
            width: ResponsiveUI.of(context).wp(45),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          divider6,
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
            ),
          ),
          divider6,
          Text(
            "12 999 artistas",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
