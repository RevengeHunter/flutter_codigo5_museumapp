import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo5_museumapp/models/museum_model.dart';

import '../general/general_widget.dart';

class ItemSlider2Widget extends StatelessWidget {

  MuseumModel museumModel;
  ItemSlider2Widget({required this.museumModel});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 36.0),
      width: 170,
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      museumModel.image??"https://images.pexels.com/photos/12416757/pexels-photo-12416757.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                bottom: -20.0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 45,
                    width: 45,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: Image(
                      image: AssetImage(
                        'assets/images/silueta-hombre.png',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          divider32,
          Text(
            "EXPLORAR",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12.0,
            ),
          ),
          divider6,
          Text(
            museumModel.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
          ),
          divider6,
          Text(
            museumModel.address,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
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
