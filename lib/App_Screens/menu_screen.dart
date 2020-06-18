import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/global_file/common_variables/app_fonts.dart';
class MenuScreen extends StatefulWidget {
  final Function(int) menuCallback;

  MenuScreen({this.menuCallback});
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

Color mainColor = Color.fromRGBO(48, 96, 96, 1.0);
Color startingColor = Color.fromRGBO(70, 112, 112, 1.0);

class _MenuScreenState extends State<MenuScreen> {
  int selectedMenuIndex = 0;

  List<String> menuItems = [
    'Dashboard',
    'My Search',
    'Add Post',
    'Profile',
    'Notifications'
  ];

  List<IconData> icons = [
    Icons.dashboard,
    Icons.search,
    Icons.add_box,
    Icons.person,
    Icons.notifications
  ];

  Widget buildMenuRow(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedMenuIndex = index;
          widget.menuCallback(index);
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.0),
        child: Row(
          children: <Widget>[
            Icon(
              icons[index],
              color: selectedMenuIndex == index
                  ? Colors.white
                  : Colors.white.withOpacity(0.5),
            ),
            SizedBox(
              width: 16.0,
            ),
            Text(
              menuItems[index],
              style: TextStyle(
                color: selectedMenuIndex == index
                    ? Colors.white
                    : Colors.white.withOpacity(0.5),
                fontSize: 23.0,
                fontFamily: mainFontFamily,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage("https://cdn2.iconfinder.com/data/icons/metro-ui-dock/512/Fox_News.png",),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Vasanthakumar VG',
                          style: foregroundTextStyleLight,
                        ),
                        Text(
                          'Coimbatore | TamilNadu',
                          style:mediumTextStyleLight,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: menuItems
                      .asMap()
                      .entries
                      .map((mapEntry) => buildMenuRow(mapEntry.key))
                      .toList(),
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.settings,
                      size: 25,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Text(
                      'Settings',
                      style: mediumTextStyleLight,
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Text(
                      '|',
                      style: mediumTextStyleLight,
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Icon(
                      Icons.call_made,
                      size: 25,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Text(
                      'Log Out',
                      style: mediumTextStyleLight,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0Xff0072FF),
                  Color(0Xff00C6FF),])),
      ),
    );
  }
}
