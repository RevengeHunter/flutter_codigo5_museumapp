import 'package:flutter/material.dart';
import 'package:flutter_codigo5_museumapp/models/artist_model.dart';
import 'package:flutter_codigo5_museumapp/services/api_service.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ui/general/colors.dart';
import '../ui/widgets/item_artist_grid_widget.dart';
import '../ui/widgets/my_app_bar_widget.dart';

class ArtistPage extends StatefulWidget {
  const ArtistPage({Key? key}) : super(key: key);

  @override
  State<ArtistPage> createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  final APIService _apiService = APIService();
  List<ArtistModel> artistModelList = [];
  List<ArtistModel> artistModelAUXList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getArtist();
  }

  getArtist() async {
    artistModelList = await _apiService.getArtists();
    artistModelAUXList = artistModelList;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 64.0), child: MyAppBar()),
      body: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              // SliverAppBar(
              //   expandedHeight: 300,
              //   collapsedHeight: 150,
              //   title: Text("AppBar 01"),
              //   centerTitle: true,
              // ),
              SliverAppBar(
                backgroundColor: kBrandPrimaryColor,
                leading: SizedBox(),
                expandedHeight: 180,
                // floating: false,
                // pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Container(
                    height: 100,
                    alignment: Alignment.center,
                    color: Colors.transparent,
                    child: Text(
                      "Artistas",
                      style: GoogleFonts.dmSans(),
                    ),
                  ),
                  centerTitle: true,
                ),
                bottom: TabBar(
                  tabs: [
                    Tab(
                      text: "Todos",
                    ),
                    Tab(
                      text: "A-Z",
                    ),
                    Tab(
                      text: "Tiempo",
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              // GridView.count(
              //   crossAxisCount: 3,
              //   mainAxisSpacing: 6,
              //   crossAxisSpacing: 6,
              //   children: imagesDummy
              //       .map(
              //         (e) => Container(
              //           decoration: BoxDecoration(
              //             image: DecorationImage(
              //               fit: BoxFit.cover,
              //               image: NetworkImage(
              //                 e,
              //               ),
              //             ),
              //           ),
              //         ),
              //       )
              //       .toList(),
              // ),
              // GridView(
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 4,
              //     crossAxisSpacing: 6.0,
              //     mainAxisSpacing: 6.0,
              //   ),
              //   children: imagesDummy
              //       .map(
              //         (e) => Container(
              //           decoration: BoxDecoration(
              //             image: DecorationImage(
              //               fit: BoxFit.cover,
              //               image: NetworkImage(
              //                 e,
              //               ),
              //             ),
              //           ),
              //         ),
              //       )
              //       .toList(),
              // ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 6.0,
                  mainAxisSpacing: 6.0,
                ),
                itemCount: artistModelList.length,
                itemBuilder: (BuildContext context, int index) {
                  artistModelAUXList.sort((a, b) => a.id.compareTo(b.id));
                  return ItemGridWidget(
                    artistModel: artistModelList[index],
                  );
                },
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 6.0,
                  mainAxisSpacing: 6.0,
                ),
                itemCount: artistModelAUXList.length,
                itemBuilder: (BuildContext context, int index) {
                  artistModelAUXList.sort((a, b) => a.name.compareTo(b.name));
                  return ItemGridWidget(
                    artistModel: artistModelAUXList[index],
                  );
                },
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 6.0,
                  mainAxisSpacing: 6.0,
                ),
                itemCount: artistModelAUXList.length,
                itemBuilder: (BuildContext context, int index) {
                  artistModelAUXList.sort((a, b) => a.birthDate.compareTo(b.birthDate));
                  return ItemGridWidget(
                    artistModel: artistModelAUXList[index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
