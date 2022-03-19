import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/screens/home_screen.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/screens/selected_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Travel app",
      theme: ThemeData.dark().copyWith(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        canvasColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: Colors.white)
        .copyWith(
          bodyText1: const TextStyle(color: bodyTextColor),
          bodyText2: const TextStyle(color: bodyTextColor)
        )
      ),
      home: HomeScreen(),
    );
  }
}