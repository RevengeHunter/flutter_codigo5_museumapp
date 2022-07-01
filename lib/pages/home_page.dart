import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_codigo5_museumapp/helpers/data/data_dummy.dart';
import 'package:flutter_codigo5_museumapp/ui/general/general_widget.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../models/museum_model.dart';
import '../services/api_service.dart';
import '../ui/widgets/item_slider2_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final APIService _apiServices = APIService();
  List<MuseumModel> museumModelList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMuseum();
  }

  getMuseum(){
    _apiServices.getMuseums().then((value) {
      museumModelList = value;
      setState(() {

      });
    }).catchError((error){
      print("wwwww $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12.0,
            ),
            child: Column(
              children: [
                divider20,
                Text(
                  "Explorar Museos",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                divider12,
                Text(
                  "¿Que quieres visitar hoy?",
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 14.0,
                  ),
                ),
                divider16,
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   physics: BouncingScrollPhysics(),
                //   child: Row(
                //     children:
                //         imagesDummy.map((e) => ItemSlider1Widget(image: e)).toList(),
                //   ),
                // ),
                // divider16,
                SizedBox(
                  height: 180,
                  child: PageView.builder(
                    controller: PageController(
                      viewportFraction: 0.47,
                      initialPage: 0,
                    ),
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padEnds: false,
                    pageSnapping: false,
                    onPageChanged: (int value) {
                      print(value);
                    },
                    itemCount: imagesDummy.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(14.0),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(imagesDummy[index]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                divider6,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                  ),
                  onPressed: () {},
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: Text(
                      "Explora +3000 colecciones",
                    ),
                  ),
                ),
                divider12,
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 22.0,
                    horizontal: 14.0,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white.withOpacity(0.06),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 160,
                        width: 280,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.7),
                              blurRadius: 12,
                              offset: Offset(4, 4),
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/arte_calle.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      divider12,
                      Text(
                        "Culture Box",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      divider12,
                      Text(
                        "Suscribete para recibir noticias, historias y actualizaciones semanalmente.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      divider12,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 22.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                side: const BorderSide(
                                  width: 1.2,
                                  color: Colors.white10,
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "No Gracias",
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          divider10,
                          TextButton(
                            style: TextButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 22.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                side: const BorderSide(
                                  width: 1.2,
                                  color: Colors.white10,
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Suscribirse",
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                divider16,
                const Text(
                  "Las mejores selecciones de hoy",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                divider16,
                SizedBox(
                  //color: Colors.redAccent,
                  height: 400,
                  child: Swiper(
                    // viewportFraction: 0.9,
                    // scale: 0.6,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              imagesDummy[index],
                            ),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.3),
                                    Colors.transparent,
                                    Colors.transparent,
                                    Colors.transparent,
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.7),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Lorem ipsum dolor sit amet",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  divider6,
                                  Text(
                                    "Lorem ipsum dolor sit amet",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: imagesDummy.length,
                    itemWidth: width * 0.7,
                    layout: SwiperLayout.STACK,
                    // autoplay: true,
                    autoplayDelay: 60000,
                    controller: SwiperController(),
                  ),
                ),
              ],
            ),
          ),
          divider32,
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            height: 360,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1536924940846-227afb31e2a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1466&q=80",
                ),
              ),
            ),
            child: Column(
              children: [
                Text(
                  "El festival cultural",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                divider12,
                Text(
                  "Encabezando hoy...",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                divider12,
                Container(
                  height: 220,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 26.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://images.unsplash.com/flagged/photo-1572392640988-ba48d1a74457?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: 10.0,
                        right: -8.0,
                        child: Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 3.0),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                            child: Text(
                              "La primera presentacion de la noche",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 22.0),
                              backgroundColor: Colors.black45,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                side: const BorderSide(
                                  width: 1.5,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Reproducir Video",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
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
          divider32,
          const Text(
            "Las mejores selecciones de hoy",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          divider16,
          MasonryGridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            itemCount: imagesDummy.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.0),
                    image: DecorationImage(
                      image: NetworkImage(imagesDummy[index]),
                      fit: BoxFit.cover,
                    )),
                height: (index % 3 + 2) * 100,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
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
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                8.0,
                              ),
                              color: Colors.blueAccent,
                            ),
                            child: const Text(
                              "Artwork",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Text(
                            "Lorem ipsum dolor",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Text(
                            "243 items",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          // StaggeredGrid.count(
          //   crossAxisCount: 2,
          //   mainAxisSpacing: 4,
          //   crossAxisSpacing: 4,
          //   children: [
          //     StaggeredGridTile.count(
          //       crossAxisCellCount: 2,
          //       mainAxisCellCount: 1,
          //       child: Container(
          //         color: Colors.red,
          //       ),
          //     ),
          //     StaggeredGridTile.count(
          //       crossAxisCellCount: 1,
          //       mainAxisCellCount: 1,
          //       child: Container(
          //         color: Colors.indigo,
          //       ),
          //     ),
          //     StaggeredGridTile.count(
          //       crossAxisCellCount: 2,
          //       mainAxisCellCount: 2,
          //       child: Container(
          //         color: Colors.indigo,
          //       ),
          //     ),
          //   ],
          // ),
          // divider32,
          // GridView.custom(
          //   shrinkWrap: true,
          //   gridDelegate: SliverQuiltedGridDelegate(
          //     crossAxisCount: 4,
          //     mainAxisSpacing: 4,
          //     crossAxisSpacing: 4,
          //     repeatPattern: QuiltedGridRepeatPattern.inverted,
          //     pattern: [
          //       QuiltedGridTile(2, 4),
          //       QuiltedGridTile(1, 1),
          //       QuiltedGridTile(1, 1),
          //       QuiltedGridTile(1, 2),
          //     ],
          //   ),
          //   childrenDelegate: SliverChildBuilderDelegate(
          //     (context, index) => Container(
          //       color: Colors.indigo,
          //     ),
          //     childCount: 7,
          //   ),
          // ),
          divider32,
          const Text(
            "Explorar Museos",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          divider12,
          const Text(
            "¿Qué quieres visitar hoy?",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 14.0,
            ),
          ),
          divider16,
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: museumModelList.map((e) => ItemSlider2Widget(museumModel: e,)).toList(),
              // children: [
              //   ItemSlider2Widget(),
              //   ItemSlider2Widget(),
              //   ItemSlider2Widget(),
              //   ItemSlider2Widget(),
              // ],
            ),
          ),

          divider40,
          divider40,
        ],
      ),
    );
  }
}
