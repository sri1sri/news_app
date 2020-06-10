import 'package:flutter/material.dart';
import 'package:newsapp/global_file/common_widgets/bottom_nav.dart';

import 'Dashboard.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  int selectedIndex = 0;

  updateIndex(index) {
    print(index);
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: DefaultTabController(
          initialIndex: 0,
          length: 3,
          child: Scaffold(
            //AppBar ,
            backgroundColor: Colors.white,//
            body:
            TabBarView(physics: NeverScrollableScrollPhysics(), children: [
              Dashboard(),
              Dashboard(),
              Dashboard(),
            ]),

            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(bottom: 0.0),
              child: CustomBottomNav(updateIndex),
            ),
          )),
    );
  }
}