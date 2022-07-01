import 'package:flutter/material.dart';
import 'package:flutter_codigo5_museumapp/pages/artist_detail_page.dart';
import 'package:flutter_codigo5_museumapp/ui/general/colors.dart';

import '../../models/artist_model.dart';

class ItemGridWidget extends StatelessWidget {

  ArtistModel artistModel;

  ItemGridWidget({
    required this.artistModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ArtistDetailPage()));
      },
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                artistModel.image ?? "https://images.pexels.com/photos/12416757/pexels-photo-12416757.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
              ),
            )),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                    kBrandPrimaryColor.withOpacity(0.7),
                    kBrandPrimaryColor.withOpacity(0.05),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    artistModel.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.0,
                    ),
                  ),
                  Text(
                    "234 items",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}