// ignore_for_file: avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/models/beach_model.dart';
import 'package:travel_app/models/popular_model.dart';
import 'package:travel_app/models/recommended_model.dart';
import 'package:travel_app/screens/selected_menu.dart';
import 'package:travel_app/widgets/bottom_navigation.dart';
import 'package:travel_app/widgets/custom_tab_indicator.dart';
// import 'package:travel_app/widgets/custom_tab_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController(viewportFraction: 0.877);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(),
      body: SafeArea(
        child: Container(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              Container(
                height: 57.6,
                margin: const EdgeInsets.only(top: 28.8, left: 28.8, right: 28.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 57.6,
                      width: 57.6,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        color: const Color.fromARGB(7, 219, 219, 219),
                      ),
                      child: SvgPicture.asset("assets/svg/icon_drawer.svg"),
                    ),
                    Container(
                      height: 57.6,
                      width: 57.6,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        color: const Color(0x06DBDBDB),
                      ),
                      child: SvgPicture.asset("assets/svg/icon_search.svg"),
                    )
                  ],
                ),
              ),
              // Text title
              Padding(
                padding: const EdgeInsets.only(top: 48, left: 28.8),
                child: Text(
                  'Menu\ndu Jour',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 40.6, fontWeight: FontWeight.w700, color: const Color.fromARGB(255, 206, 206, 206)
                  ),
                ),
              ),

              // Tab bar
              Container(
                height: 30,
                margin: const EdgeInsets.only(left: 14.4, right: 14.4, top: 28.8),
                child: DefaultTabController(length: 4, child: TabBar(
                  labelPadding: const EdgeInsets.only(left: 14.4, right: 14.4),
                  indicatorPadding: const EdgeInsets.only(left: 14.4, right: 14.4),
                  isScrollable: true,
                  labelColor: const Color.fromARGB(255, 184, 184, 184),
                  unselectedLabelColor: const Color.fromARGB(255, 190, 190, 190),
                  labelStyle: GoogleFonts.lato(
                    fontSize: 14, fontWeight: FontWeight.w600
                  ),
                  unselectedLabelStyle: GoogleFonts.lato(
                    fontSize: 14, fontWeight: FontWeight.w700
                  ),
                  indicator: RoundedRectangleTabIndicator(
                    color: const Color.fromARGB(255, 214, 209, 209), weight: 2.4, width: 18.4
                  ), 
                  tabs: [
                  Tab(
                    child: Container(
                      child: const Text("Resistance"),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: const Text("Dessert"),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: const Text("Pizza ..."),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: const Text("Humburger"),
                    ),
                  )
                ]),),
              ),

              // Recommendation list
              Container(
                height: 218.8,
                margin: const EdgeInsets.only(top: 22),
                child: PageView(
                  physics: const BouncingScrollPhysics(),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(recommendations.length, (int index) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SelectedMenu(recommendedModel: recommendations[index]),
                      ));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 28.8),
                      width: 333.6,
                      height: 218.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image:AssetImage(recommendations[index].image),
                        )
                      ),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            bottom: 19.2,
                            left: 19.2,
                            child: ClipRRect(
                            borderRadius: BorderRadius.circular(4.8),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 19.2,
                                sigmaY: 19.2
                              ),
                              child: Container(
                                height: 36,
                                padding: const EdgeInsets.only(left: 15.72, right: 14.4),
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    SvgPicture.asset("assets/svg/icon_location.svg"),
                                    const SizedBox(width: 9.52),
                                    Text(recommendations[index].nom,
                                    style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                      fontSize: 16.8
                                    ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                  
                          )),
                        ],
                      ),
                    ),
                  )),
                ),
              ),
            
              // Dot indicator
              Padding(padding: const EdgeInsets.only(left: 28.8, top: 28.8), 
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: recommendations.length,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Color.fromARGB(255, 238, 238, 238),
                    dotColor: Color.fromARGB(255, 145, 145, 145),
                    dotWidth: 6,
                    dotHeight: 4.8,
                    spacing: 4.8
                  ),
                ),
              ),

              // Popular categories
              Padding(
                padding: const EdgeInsets.only(top: 48, left: 28.8, right: 28.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Popular catecories", style: GoogleFonts.playfairDisplay(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromARGB(255, 206, 206, 206)
                    ),),
                    Text("Show All", style: GoogleFonts.lato(
                      fontSize: 16.8,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 189, 187, 187)
                    ),)
                  ],
                ),
              ),

              // List view
              Container(
                margin: const EdgeInsets.only(top: 33.6),
                height: 45.6,
                child: ListView.builder(
                  itemCount: populars.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(left: 28.8, right: 9.6),
                  itemBuilder: (context, index){
                    return Container(
                      padding: const EdgeInsets.only(right: 19.2),
                      height: 45.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        color: Color(populars[index].couleur)
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 19.2),
                          // Image.asset(populars[index].image, height: 16.8)
                          Text(populars[index].title, style: GoogleFonts.lato(
                            fontWeight: FontWeight.w600, fontSize: 18
                          )),
                          const SizedBox(width: 19.2)
                        ],
                      ),
                    );
                  },
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 28.8, bottom: 16.8),
                height: 124.8,
                child: ListView.builder(
                  itemCount: beachs.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(left: 28.8, right: 12),
                  itemBuilder: (context, index){
                    return Container(
                      margin: const EdgeInsets.only(right: 16.8),
                      height: 124.8,
                      width: 188.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(beachs[index].image)
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}