import 'dart:async';
import 'package:flutter/material.dart';

import '../ui/widgets/my_intro_slider_widget.dart';
import 'init_page.dart';

class IntroSliderPage extends StatefulWidget {
  const IntroSliderPage({Key? key}) : super(key: key);

  @override
  State<IntroSliderPage> createState() => _IntroSliderPageState();
}

class _IntroSliderPageState extends State<IntroSliderPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;

  late Timer timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _pageController.addListener(() {
    //   print(_pageController.page);
    // });
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      print(timer);
      currentPage++;
      if (currentPage < 4) {
        _pageController.animateToPage(
          currentPage,
          duration: Duration(
            milliseconds: 600,
          ),
          curve: Curves.easeIn,
        );
        setState(() {});
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              // physics: const BouncingScrollPhysics(),
              controller: _pageController,
              onPageChanged: (int value) {
                currentPage = value;
                setState(() {});
              },
              children: [
                MyIntroSliderWidget(
                  imagePath: 'assets/images/Museo01.jpg',
                  pageId: currentPage,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InitPage(),
                      ),
                    );
                  },
                ),
                MyIntroSliderWidget(
                  imagePath: 'assets/images/Museo02.jpeg',
                  pageId: currentPage,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InitPage(),
                      ),
                    );
                  },
                ),
                MyIntroSliderWidget(
                  imagePath: 'assets/images/Museo03.jpeg',
                  pageId: currentPage,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InitPage(),
                      ),
                    );
                  },
                ),
                MyIntroSliderWidget(
                  imagePath: 'assets/images/Museo04.jpeg',
                  pageId: currentPage,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InitPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     Container(
          //       height: 18.0,
          //       width: 14.0,
          //       decoration: BoxDecoration(
          //         color: currentPage == 0 ? Colors.black : Colors.black26,
          //         shape: BoxShape.circle,
          //       ),
          //     ),
          //     Container(
          //       height: 18.0,
          //       width: 14.0,
          //       decoration: BoxDecoration(
          //         color: currentPage == 1 ? Colors.black : Colors.black26,
          //         shape: BoxShape.circle,
          //       ),
          //     ),
          //     Container(
          //       height: 18.0,
          //       width: 14.0,
          //       decoration: BoxDecoration(
          //         color: currentPage == 2 ? Colors.black : Colors.black26,
          //         shape: BoxShape.circle,
          //       ),
          //     ),
          //     Container(
          //       height: 18.0,
          //       width: 14.0,
          //       decoration: BoxDecoration(
          //         color: currentPage == 3 ? Colors.black : Colors.black26,
          //         shape: BoxShape.circle,
          //       ),
          //     ),
          //   ],
          // ),
          // Row(
          //   children: [
          //     IconButton(
          //       onPressed: () {
          //         currentPage--;
          //         if (currentPage >= 0) {
          //           _pageController.animateToPage(
          //             currentPage,
          //             duration: Duration(
          //               milliseconds: 600,
          //             ),
          //             curve: Curves.easeIn,
          //           );
          //           setState(() {});
          //         } else {
          //           currentPage = 0;
          //         }
          //       },
          //       icon: Icon(
          //         Icons.arrow_back,
          //       ),
          //     ),
          //     Expanded(
          //       child: ElevatedButton(
          //         onPressed: () {
          //           _pageController.animateToPage(currentPage,
          //               duration: Duration(
          //                 milliseconds: 1000,
          //               ),
          //               curve: Curves.easeIn);
          //         },
          //         child: Text(
          //           "Iniciar Ahora",
          //         ),
          //       ),
          //     ),
          //     IconButton(
          //       onPressed: () {
          //         currentPage++;
          //         if (currentPage < 4) {
          //           _pageController.animateToPage(
          //             currentPage,
          //             duration: Duration(
          //               milliseconds: 600,
          //             ),
          //             curve: Curves.easeIn,
          //           );
          //           setState(() {});
          //         } else {
          //           currentPage = 3;
          //         }
          //       },
          //       icon: Icon(
          //         Icons.arrow_forward_outlined,
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
