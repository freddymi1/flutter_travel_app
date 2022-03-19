import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);


  @override
  State<Header> createState() => _State();
}

class _State extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
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
                    // child: SvgPicture.asset("assets/svg/icon_drawer.svg"),
                    child: const Text("AA"),
                  ),
                  Container(
                    height: 57.6,
                    width: 57.6,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.6),
                      color: const Color.fromARGB(7, 219, 219, 219),
                    ),
                    child:const Text("BB"),
                    // child: const Text("B"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}