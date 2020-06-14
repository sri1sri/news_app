import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/global_file/common_variables/app_fonts.dart';

class ModalFit extends StatelessWidget {
  final ScrollController scrollController;

  const ModalFit({Key key, this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('Share',style: mediumTextStyleDarkThin,),
                leading: Icon(Icons.share,color: Colors.black,),
                onTap: () => Navigator.of(context).pop(),
              ),
              ListTile(
                title: Text('Edit',style: mediumTextStyleDarkThin,),
                leading: Icon(Icons.edit,color: Colors.black,),
                onTap: () => Navigator.of(context).pop(),
              ),
              ListTile(
                title: Text('Report',style: mediumTextStyleDarkThin,),
                leading: Icon(Icons.report_problem,color: Colors.black,),
                onTap: () => Navigator.of(context).pop(),
              ),
              ListTile(
                title: Text('Delete',style: mediumTextStyleDarkThin,),
                leading: Icon(Icons.delete,color: Colors.black,),
                onTap: () => Navigator.of(context).pop(),
              )
            ],
          ),
        ));
  }
}