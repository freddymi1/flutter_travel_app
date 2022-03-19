import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/models/recommended_model.dart';

class SelectedMenu extends StatelessWidget {

  final _pageController = PageController();

  final RecommendedModel recommendedModel;

  SelectedMenu({Key? key, required this.recommendedModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            children: List.generate(
              recommendedModel.imagesL.length, 
              (int index) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image:AssetImage(recommendedModel.imagesL[index]),
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
                            Text(recommendedModel.nom,
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
            )),
          ),
        
          SafeArea(
            child: Container(
              height: 57.6,
              margin: const EdgeInsets.only(top: 28.8, left: 28.8, right: 28.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 57.6,
                      width: 57.6,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        color: const Color.fromARGB(7, 219, 219, 219),
                      ),
                      child: SvgPicture.asset("assets/svg/icon_left_arrow.svg"),
                    ),
                  ),
                  Container(
                    height: 57.6,
                    width: 57.6,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.6),
                      color: const Color(0x06DBDBDB),
                    ),
                    child: SvgPicture.asset("assets/svg/icon_heart_fill.svg"),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 346.8,
              margin: const EdgeInsets.only(left: 28.8, bottom: 48, right: 28.8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Scroll indicator
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: recommendedModel.imagesL.length,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: Color.fromARGB(255, 238, 238, 238),
                      dotColor: Color.fromARGB(255, 192, 192, 192),
                      dotWidth: 6,
                      dotHeight: 4.8,
                      spacing: 4.8
                    ),
                  ),
                  //Title
                  Padding(
                    padding: const EdgeInsets.only(top: 48),
                    child: Text(
                      recommendedModel.tagLine,
                      maxLines: 2,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 38.6, fontWeight: FontWeight.w700, color: const Color.fromARGB(255, 255, 255, 255)
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 19.2),
                    child: Text(
                      recommendedModel.description,
                      maxLines: 3,
                      style: GoogleFonts.lato(
                        fontSize: 19.8, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 255, 255, 255)
                      ),
                    ),
                  ),
                  const SizedBox(height: 48,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Start from', style: GoogleFonts.lato(
                            fontSize: 16.8,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                          ),),
                          Text('\$ ${recommendedModel.price.toString()}/person', style: GoogleFonts.lato(
                            fontSize: 19.6,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(255, 255, 255, 255)
                          ),)
                        ],
                      ),
                      Container(
                        height: 62.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          color: Colors.white
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 28.8, right: 28.8),
                            child: Text('Explore now >>', style: GoogleFonts.lato(
                              fontSize: 19.2,
                              fontWeight: FontWeight.w700,
                              color: Colors.black
                            ),),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}