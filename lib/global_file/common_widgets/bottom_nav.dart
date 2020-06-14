import "package:flutter/material.dart";
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:newsapp/App_Screens/AddPostScreens/AddPostScreen.dart';
import 'package:newsapp/global_file/common_variables/app_functions.dart';

import 'modal_inside_modal.dart';

class CustomBottomNav extends StatefulWidget {
  final Function updateIndex;

  CustomBottomNav(this.updateIndex);

  @override
  State<StatefulWidget> createState() {
    return _CustomBottomNav();
  }
}

class _CustomBottomNav extends State<CustomBottomNav> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double myHeight = 70.0;
    return Padding(
      padding: const EdgeInsets.only(left: 10,right:10,bottom: 25),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[
                Color(0Xff0E0E0E),
                Color(0Xff434343),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          borderRadius:new BorderRadius.circular(8.0),
        ),
        child: Material(
          elevation: 24.0,
          color: Colors.transparent,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(8.0),
          ),
          child: Container(
              height: myHeight,
              width: double.infinity,
              margin: EdgeInsets.only(top: 0.0, bottom: 2.0),
              child: Row(
                children: <Widget>[
//                  Padding(
//                    padding: const EdgeInsets.only(left: 22.0),
//                    child: Container(
//                      height: myHeight,
//                      width: MediaQuery.of(context).size.width * 0.15,
//                      child: Row(
//                        children: <Widget>[
//                          GestureDetector(
//                              onTap: ()=> showBarModalBottomSheet(
//                                expand: false,
//                                context: context,
//                                backgroundColor: Colors.transparent,
//                                builder: (context, scrollController) =>
//                                    ModalInsideModalLangauge(
//                                        scrollController: scrollController),),
//                              child: Image.network("https://cdn3.iconfinder.com/data/icons/google-suits-1/32/18_google_translate_text_language_translation-512.png",height: 50,width: 50,)),
//                          SizedBox(
//                            width: 10,
//                          ),
//                          Container(
//                            width: 2.0,
//                            color: Colors.blueAccent.withOpacity(0.9),
//                            height: 30,
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/1.06,
                    child: TabBar(
                      tabs: [
                        Tab(
                          icon: Icon(
                            Icons.home,
                            size: 28.0,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.search,
                            size: 28.0,
                          ),
                        ),
                        Tab(
                          child: Container(
                            width: 60,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius:new BorderRadius.circular(8.0),
                            ),
                            child: Icon(
                              Icons.add,
                              size: 28.0,
                              color: Colors.white,
                            ),
                          ),
                          ),
                        Tab(
                          icon: Icon(
                            Icons.notifications,
                            size: 28.0,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.person,
                            size: 28.0,
                          ),
                        ),
                      ],
                      onTap: (int index) {
                        setState(() {
                          _selectedIndex = index;
                        });

                        widget.updateIndex(index);
                      },
                      indicatorColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: Colors.blueAccent.withOpacity(0.8),
                      unselectedLabelColor: Colors.white,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}