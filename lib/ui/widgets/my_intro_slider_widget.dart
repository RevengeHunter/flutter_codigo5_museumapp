import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../general/colors.dart';
import '../general/general_widget.dart';
import '../responsive/responsive.dart';

class MyIntroSliderWidget extends StatelessWidget {

  String imagePath;
  MyIntroSliderWidget({required this.imagePath});


  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 26.0),
                height: ResponsiveUI.pHeight(context, 0.38),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80.0),
                  ),
                ),
                child: Column(
                  children: [
                    divider20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                          ),
                          height: 8,
                          width: 50,
                          decoration: BoxDecoration(
                            color: kBrandPrimaryColor,
                            borderRadius:
                            BorderRadius.circular(20.0),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                          ),
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            color: kBrandPrimaryColor
                                .withOpacity(0.25),
                            borderRadius:
                            BorderRadius.circular(20.0),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                          ),
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            color: kBrandPrimaryColor
                                .withOpacity(0.25),
                            borderRadius:
                            BorderRadius.circular(20.0),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                          ),
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            color: kBrandPrimaryColor
                                .withOpacity(0.25),
                            borderRadius:
                            BorderRadius.circular(20.0),
                          ),
                        ),
                      ],
                    ),
                    divider20,
                    Text(
                      "Lorem",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: kBrandPrimaryColor,
                      ),
                    ),
                    divider20,
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        color: kBrandPrimaryColor.withOpacity(0.6),
                      ),
                    ),
                    divider32,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Omitir",),
                        SizedBox(width: 12.0,),
                        Container(
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Color(0xfff72585),
                                Color(0xff480ca8),
                              ],
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.chevron_right,
                              color: kBrandPrimaryColor,
                            ),
                          ),

                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}