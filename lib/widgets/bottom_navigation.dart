import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({ Key? key }) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigation> {

  int _selectedIndex = 0;

  void _onItemTaped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  var bottomNavStyoe = GoogleFonts.lato(
    fontSize: 12, fontWeight: FontWeight.w500
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86.4,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E28),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 15,offset: const Offset(0, 5)
          )
        ]
      ),
      child: BottomNavigationBar(items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: _selectedIndex == 0 
            ? SvgPicture.asset("assets/svg/icon_home.svg")
            : SvgPicture.asset("assets/svg/icon_home_colored.svg"),
          label: 'Home'
        ),
        BottomNavigationBarItem(
          icon: _selectedIndex == 1
            ? SvgPicture.asset("assets/svg/icon_heart.svg")
            : SvgPicture.asset("assets/svg/icon_heart_colored.svg"),
          label: "Heart"
        ),
        BottomNavigationBarItem(
          icon: _selectedIndex == 2
            ? SvgPicture.asset("assets/svg/icon_plus.svg")
            : SvgPicture.asset("assets/svg/icon_plus_colored.svg"),
          label: "Plus"
        ),
        BottomNavigationBarItem(
          icon: _selectedIndex == 3
            ? SvgPicture.asset("assets/svg/icon_notification.svg")
            : SvgPicture.asset("assets/svg/icon_notification_colored.svg"),
          label: "Notifications"
        ),
        BottomNavigationBarItem(
          icon: _selectedIndex == 4
            ? SvgPicture.asset("assets/svg/icon_user.svg")
            : SvgPicture.asset("assets/svg/icon_user_colored.svg"),
          label: "User"
        )
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTaped,
      backgroundColor: Colors.transparent,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 12,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
      ),
    );
  }
}