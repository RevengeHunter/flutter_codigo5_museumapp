import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../ui/general/colors.dart';
import '../ui/widgets/my_app_bar_widget.dart';
import 'explorer_page.dart';
import 'favorite_page.dart';
import 'home_page.dart';

class InitPage extends StatefulWidget {
  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  int _currentIndex = 0;

  List<Widget> _pages = [
    HomePage(),
    ExplorerPage(),
    FacoritePage(),
    Text("Page04"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 64.0),
          child: MyAppBar()
      ),
      body: _pages[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kBrandPrimaryColor,
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (int index) {
          _currentIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              color: _currentIndex == 0 ? Colors.blue : Colors.white,
            ),
            label: "Inicio",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/compass.svg',
              color: _currentIndex == 1 ? Colors.blue : Colors.white,
            ),
            label: "Explorar",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/heart.svg',
              color: _currentIndex == 2 ? Colors.blue : Colors.white,
            ),
            label: "Favoritos",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/user.svg',
              color: _currentIndex == 3 ? Colors.blue : Colors.white,
            ),
            label: "Perfil",
          ),
        ],
      ),
    );
  }
}
