import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:newsapp/App_Screens/AuthenticationScreens/Authentication.dart';
import 'package:newsapp/global_file/common_variables/app_fonts.dart';
import 'package:newsapp/global_file/common_variables/app_functions.dart';

class ModalInsideModal extends StatelessWidget {

  final ScrollController scrollController;

  const ModalInsideModal({Key key, this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
              leading: Container(), middle: Text('Select Langauge')),
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