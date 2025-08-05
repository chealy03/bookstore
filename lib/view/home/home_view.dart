import 'package:book_grocer/common/color_extenstion.dart';
import 'package:book_grocer/view/book_reading/book_reading_view.dart';
import 'package:flutter/material.dart';

import '../../common_widget/best_seller_cell.dart';
import '../../common_widget/top_picks_cell.dart';
import '../main_tab/main_tab_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List topPicksArr = [
    {
      "name": "THE TIME TRAVELLERS HANDBOOK",
      "subtitle": "HOW TO BE THE BEST IN TIME AND SPACE",
      "author": "Stride Lottie",
      "img": "assets/img/1.jpg",
    },
    {
      "name": "THE DISAPPEARANCE OF ÉMILE ZOLA",
      "subtitle": "LOVE, LITERATURE AND THE DREYFUS CASE",
      "author": "MICHAEL ROSEN",
      "img": "assets/img/2.jpg",
    },
    {
      "name": "FATHERHOOD THE TRUTH",
      "subtitle": "",
      "author": "MARCUS BERKMAN",
      "img": "assets/img/3.jpg",
    }
  ];

  List bestArr = [
    {
      "name": "IN A LAND OF PAPER GODS",
      "subtitle": "HIGH ON A CHINESE MOUNTAIN, A CHILD WAITS FOR A SIGN...",
      "author": "REBECCA MACKENZIE",
      "img": "assets/img/b1.jpg",
      "rating": 4.8,
    },
    {
      "name": "tattletale",
      "subtitle": "THE THRILLER OF THE YEAR",
      "author": "Sarah J Naughton",
      "img": "assets/img/b2.jpg",
      "rating": 4.6,
    },
    {
      "name": "Z",
      "subtitle": "",
      "author": "Unknown Author",
      "img": "assets/img/b3.jpg",
      "rating": 4.5,
    }
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header with green background
          Container(
            color: TColor.primary,
            padding: EdgeInsets.only(
              top: media.width * 0.1,
              left: 20,
              right: 20,
              bottom: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Our Top Picks",
                  style: TextStyle(
                    color: TColor.text,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    sideMenuScaffoldKey.currentState?.openEndDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: TColor.text,
                  ),
                ),
              ],
            ),
          ),
          // Content area
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Our Top Picks Section
                  SizedBox(
                    height: media.width * 0.8,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 8,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: topPicksArr.length,
                      itemBuilder: ((context, index) {
                        final iObj = topPicksArr[index];
                        return TopPicksCell(
                          iObj: iObj,
                        );
                      }),
                    ),
                  ),
                  // Bestsellers Section
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          "Bestsellers",
                          style: TextStyle(
                            color: TColor.text,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: media.width * 0.9,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 8,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: bestArr.length,
                      itemBuilder: ((context, index) {
                        final bObj = bestArr[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookReadingView(
                                  bObj: bObj,
                                ),
                              ),
                            );
                          },
                          child: BestSellerCell(
                            bObj: bObj,
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
