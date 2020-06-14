import 'package:flutter/material.dart';
import 'package:newsapp/App_Screens/AddPostScreens/AddPostScreen.dart';
import 'package:newsapp/App_Screens/ProfileScreens/ProfileScreen.dart';
import 'package:newsapp/App_Screens/SearchScreens/SearchHomeScreen.dart';
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
          length: 5,
          child: Scaffold(
            //AppBar ,
            //backgroundColor: Colors.white,//
            body:
            TabBarView(physics: NeverScrollableScrollPhysics(), children: [
              Dashboard(),
              SearchHomeScreen(),
              AddPostScreen(),
              Dashboard(),
              ProfileScreen(),
            ]),

            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(bottom: 0.0),
              child: CustomBottomNav(updateIndex),
            ),
          )),
    );
  }
}