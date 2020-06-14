import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:newsapp/App_Screens/AuthenticationScreens/Authentication.dart';
import 'package:newsapp/global_file/common_variables/app_fonts.dart';
import 'package:newsapp/global_file/common_variables/app_functions.dart';

class ModalInsideModalLangauge extends StatelessWidget {

  final ScrollController scrollController;

  const ModalInsideModalLangauge({Key key, this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
              leading: Text(".",style: TextStyle(color: Colors.white),), middle: Text('Select Langauge',style: foregroundTextStyleMedium,)),
          child: SafeArea(
            bottom: false,
            child: ListView(
              shrinkWrap: true,
              controller: scrollController,
              physics: BouncingScrollPhysics(),
              children: ListTile.divideTiles(
                  context: context,
                  tiles: List.generate(
                    5,
                        (index) => ListTile(
                        title: Text(
                          "English",textAlign: TextAlign.center,style: mediumTextStyleDark,
                        ),
                        onTap: () {
                          GoToPage(context,AuthenticationScreen(),false);
                        },),
                  )).toList(),
            ),
          ),
        ));
  }
  Langauge (String code,String langauge,BuildContext context)
  {
    return ListTile(
      onTap: () {
//        setState(() {
//          langCode = code;
//          // _read(langCode);
//          _save(langCode);
//          // print(langCode);
//        });
        GoToPage(context,AuthenticationScreen(),false);
      },
      selected: true,
      title: Text(
        langauge,textAlign: TextAlign.center,style: mediumTextStyleDark,
      ),
    );
  }
}
class ModalInsideModalState extends StatelessWidget {

  final ScrollController scrollController;

  const ModalInsideModalState({Key key, this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
              leading: Text(".",style: TextStyle(color: Colors.white),), middle: Text('Select State',style: foregroundTextStyleMedium,)),
          child: SafeArea(
            bottom: false,
            child: ListView(
              shrinkWrap: true,
              controller: scrollController,
              physics: BouncingScrollPhysics(),
              children: ListTile.divideTiles(
                  context: context,
                  tiles: List.generate(
                    5,
                        (index) => ListTile(
                      title: Text(
                        "Tamil Nadu",textAlign: TextAlign.center,style: mediumTextStyleDark,
                      ),
                      onTap: () {
                        Navigator.pop(context,true);
                      },),
                  )).toList(),
            ),
          ),
        ));
  }

}
class ModalInsideModalDistrict extends StatelessWidget {

  final ScrollController scrollController;

  const ModalInsideModalDistrict({Key key, this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
              leading: Text(".",style: TextStyle(color: Colors.white),), middle: Text('Select District',style: foregroundTextStyleMedium,)),
          child: SafeArea(
            bottom: false,
            child: ListView(
              shrinkWrap: true,
              controller: scrollController,
              physics: BouncingScrollPhysics(),
              children: ListTile.divideTiles(
                  context: context,
                  tiles: List.generate(
                    5,
                        (index) => ListTile(
                      title: Text(
                        "Coimbatore",textAlign: TextAlign.center,style: mediumTextStyleDark,
                      ),
                      onTap: () {
                        Navigator.pop(context,true);
                      },),
                  )).toList(),
            ),
          ),
        ));
  }
}