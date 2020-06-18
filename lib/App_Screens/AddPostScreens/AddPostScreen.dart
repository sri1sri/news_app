import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/App_Screens/AddPostScreens/AddPostDetails.dart';
import 'package:newsapp/App_Screens/HomeScreens/DetailedNewsScreen.dart';
import 'package:newsapp/App_Screens/menu_frame.dart';
import 'package:newsapp/global_file/common_variables/app_fonts.dart';
import 'package:newsapp/global_file/common_variables/app_functions.dart';
import 'package:newsapp/global_file/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:newsapp/global_file/common_widgets/offline_widgets/offline_widget.dart';
import 'package:platform_action_sheet/platform_action_sheet.dart';

class AddPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_AddPostScreen(),
    );
  }
}

class F_AddPostScreen extends StatefulWidget {
  @override
  _F_AddPostScreen createState() => _F_AddPostScreen();
}

class _F_AddPostScreen extends State<F_AddPostScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return offlineWidget( context );
  }

  Widget offlineWidget(BuildContext context) {
    return CustomOfflineWidget(
      onlineChild: Padding(
        padding: const EdgeInsets.fromLTRB( 0, 0, 0, 0 ),
        child: Scaffold(
          body: _buildContent( context ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(55),
        child: CustomAppBarDark(
          leftActionBar: Icon(Icons.menu,color: Colors.black,size: 30,),
          leftAction: (){
            GoToPage(context,MenuFrame(),false);
          },
          rightActionBar: Text("Next",style: mediumTextStyleBlue,) ,
          rightAction:(){
            GoToPage(context, AddPostDetails(), false);
          },
          primaryText: "Add Post",
          tabBarWidget: null,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: postContent(),
      ),
    );
  }

  List<Widget>postContent() {

    return [
      new TextField(
       // onChanged: (value) => _postTitle = value,
        minLines: 5,
        maxLines: 5,
        autocorrect: true,
        decoration: InputDecoration(
          hintText: 'Add title',
          filled: true,
          fillColor: Colors.grey[100],
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
        style: mediumTextStyleMedium,
        keyboardType: TextInputType.text,
        keyboardAppearance: Brightness.dark,
      ),
      SizedBox(height: 20,),
      GestureDetector(
        child:
        //_postPic == null ?
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            border: Border.all(
              width: 0.5, //
            ),
            shape: BoxShape.rectangle,
            borderRadius: new BorderRadius.circular(10.0),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Add Image",style: mediumTextStyleMediumThin,),
              Icon(Icons.add_photo_alternate,size: 40,)
            ],
          ),
        ) ,
//                : Container(
//          height: 150,
//          decoration: BoxDecoration(
//              shape: BoxShape.rectangle,
//              borderRadius: BorderRadius.circular(5.0),
//              image: DecorationImage(
//                image: FileImage(_postPic),  // here add your image file path
//                fit: BoxFit.fill,
//              )),
//        ),
        onTap: (){

          PlatformActionSheet().displaySheet(
              context: context,
              title:
              Text('Please select the media source.',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat-Regular',
                  fontWeight: FontWeight.w500,
                  fontSize: 17.0,
                ),
              ),
              actions: [
                ActionSheetAction(
                  text: "Camera",
                  onPressed: () {
                    _captureImage(ImageSource.camera);
                    Navigator.pop(context);
                  },
                  hasArrow: true,
                ),
                ActionSheetAction(
                  text: "Gallery",
                  onPressed: () {
                    _captureImage(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                ),
                ActionSheetAction(
                  text: "Cancel",
                  onPressed: () => Navigator.pop(context),
                  isCancel: true,
                  defaultAction: true,
                )
              ]);
        },
      ),
      SizedBox(height: 20,),
      TextField(
        //onChanged: (value) => _postDescription = value,
        minLines: 6,
        maxLines: 10,
        autocorrect: true,
        decoration: InputDecoration(
          hintText: 'Add 1st description.',
          filled: true,
          fillColor: Colors.grey[100],
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
        style: mediumTextStyleMedium,
        keyboardType: TextInputType.text,
        keyboardAppearance: Brightness.dark,
      ),
      SizedBox(height: 20,),
      TextField(
        //onChanged: (value) => _postDescription = value,
        minLines: 6,
        maxLines: 10,
        autocorrect: true,
        decoration: InputDecoration(
          hintText: 'Add 2nd description.',
          filled: true,
          fillColor: Colors.grey[100],
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
        style: mediumTextStyleMedium,
        keyboardType: TextInputType.text,
        keyboardAppearance: Brightness.dark,
      ),
      SizedBox(height: 15,),
      GestureDetector(
        onTap: (){},
          child: Text("Add More",style: mediumTextStyleBlue,)
      ),
      SizedBox(height: 50,),
    ];
  }
  Future<void> _captureImage(ImageSource imageSource) async {
    File profileImage = await ImagePicker.pickImage(source: imageSource);
    setState(() {
//      _postPic = profileImage;
//      print(_postPic);
    });
  }
}

