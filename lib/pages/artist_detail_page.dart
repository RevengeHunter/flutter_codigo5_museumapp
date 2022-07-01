import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo5_museumapp/ui/general/colors.dart';
import 'package:flutter_codigo5_museumapp/ui/general/general_widget.dart';
import 'package:flutter_codigo5_museumapp/ui/responsive/responsive.dart';
import 'package:logger/logger.dart';

import '../ui/widgets/my_app_bar_widget.dart';

class ArtistDetailPage extends StatefulWidget {
  @override
  State<ArtistDetailPage> createState() => _ArtistDetailPageState();
}

class _ArtistDetailPageState extends State<ArtistDetailPage> {
  bool isExpanded = false;
  Logger logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: ResponsiveUI.pHeight(context, 0.3),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "https://images.pexels.com/photos/12367877/pexels-photo-12367877.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                      ),
                    ),
                  ),
                ),
                PreferredSize(
                  preferredSize: const Size(double.infinity, 64.0),
                  child: MyAppBar(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  divider40,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Vincent Van Gogh",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                        ),
                      ),
                    ],
                  ),
                  divider12,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "March 30 1853 - July 29 1890",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                  divider32,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  divider16,
                  Text(
                    '''Nació el 30 de marzo de 1853. Hijo de un austero y humilde pastor protestante neerlandés llamado Theodorus y de su mujer Anna Cornelia, Vincent recibió el mismo nombre que le habían puesto a un hermano que nació muerto exactamente un año antes. El 1 de mayo de 1857 nació su hermano Theo y ambos tuvieron cuatro hermanos más: Cornelius Vincent, Elisabetha Huberta, Anna Cornelia y Wilhelmina Jacoba.
Durante la infancia acudió a la escuela de manera discontinua e irregular, pues sus padres le enviaron a diferentes internados. El primero de ellos en Zevenbergen en 1864, donde estudió francés y alemán. Dos años después se matriculó en la escuela secundaria HBS Koning Willem II (Tilburg) viviendo con la familia Hannik en la calle Sint Annaplein 18-19 y permaneció allí hasta que dejó los estudios de manera definitiva a los quince años. Por entonces comenzó su afición por la pintura.''',
                    style: TextStyle(
                      color: Colors.white,
                      height: 1.4,
                    ),
                    maxLines: isExpanded ? 3 : null,
                    overflow: isExpanded
                        ? TextOverflow.ellipsis
                        : TextOverflow.visible,
                  ),
                  GestureDetector(
                    onTap: () {
                      isExpanded = !isExpanded;
                      setState(() {});
                    },
                    child: Text(
                      isExpanded ? "Más información" : "Menos Información",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  divider6,
//                   AnimatedContainer(
//                     duration: Duration(
//                       milliseconds: 1200,
//                     ),
//                     height: 330,
//                     color: Colors.red,
//                     child: Text(
//                       '''Nació el 30 de marzo de 1853. Hijo de un austero y humilde pastor protestante neerlandés llamado Theodorus y de su mujer Anna Cornelia, Vincent recibió el mismo nombre que le habían puesto a un hermano que nació muerto exactamente un año antes. El 1 de mayo de 1857 nació su hermano Theo y ambos tuvieron cuatro hermanos más: Cornelius Vincent, Elisabetha Huberta, Anna Cornelia y Wilhelmina Jacoba.
// Durante la infancia acudió a la escuela de manera discontinua e irregular, pues sus padres le enviaron a diferentes internados. El primero de ellos en Zevenbergen en 1864, donde estudió francés y alemán. Dos años después se matriculó en la escuela secundaria HBS Koning Willem II (Tilburg) viviendo con la familia Hannik en la calle Sint Annaplein 18-19 y permaneció allí hasta que dejó los estudios de manera definitiva a los quince años. Por entonces comenzó su afición por la pintura.''',
//                       style: TextStyle(
//                         color: Colors.yellow,
//                       ),
//                     ),
//                   ),
                  divider32,
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ONLINE EXHIBIT",
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 10,
                                ),
                              ),
                              Text(
                                "Artist highlights",
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                              Text(
                                "Slideshow auto-detected from multiple collections",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 8,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.collections,
                          color: Colors.white70,
                        ),
                      ],
                    ),
                  ),
                  divider32,
                  divider32,
                  divider32,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
