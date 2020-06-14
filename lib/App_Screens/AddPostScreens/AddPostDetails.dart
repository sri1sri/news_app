import 'package:expand_widget/expand_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:newsapp/App_Screens/AddPostScreens/PreviewScreen.dart';
import 'package:newsapp/App_Screens/HomeScreens/DetailedNewsScreen.dart';
import 'package:newsapp/global_file/common_variables/app_fonts.dart';
import 'package:newsapp/global_file/common_variables/app_functions.dart';
import 'package:newsapp/global_file/common_widgets/button_widget/to_do_button.dart';
import 'package:newsapp/global_file/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:newsapp/global_file/common_widgets/modal_inside_modal.dart';
import 'package:newsapp/global_file/common_widgets/offline_widgets/offline_widget.dart';
import 'package:platform_action_sheet/platform_action_sheet.dart';

class AddPostDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_AddPostDetails(),
    );
  }
}

class F_AddPostDetails extends StatefulWidget {
  @override
  _F_AddPostDetails createState() => _F_AddPostDetails();
}

class _F_AddPostDetails extends State<F_AddPostDetails> {
  int category =1;
  int type =1;
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
          leftActionBar: Icon(Icons.arrow_back_ios,color: Colors.black,size: 25,),
          leftAction: () {
            Navigator.pop(context,true);
          },
          rightActionBar: Text("Preview",style: mediumTextStyleBlue,) ,
          rightAction:(){
            GoToPage(context, PreviewScreen(), false);
          },
          primaryText: "Add Post",
          tabBarWidget: null,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Category",style: mediumTextStyleBlue,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(
                    width: 0.5, //
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(width: 10,),
                          Radio(
                            value: 1,
                            groupValue: category,
                            onChanged: (T){
                              print(T);
                              setState(() {
                                category=T;
                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: Text("Politics",style: mediumTextStyleDark,),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(width: 10,),
                          Radio(
                            value: 2,
                            groupValue: category,
                            onChanged: (T){
                              print(T);
                              setState(() {
                                category=T;
                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: Text("Technology",style: mediumTextStyleDark,),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(width: 10,),
                          Radio(
                            value: 3,
                            groupValue: category,
                            onChanged: (T){
                              print(T);
                              setState(() {
                                category=T;
                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: Text("Sports",style: mediumTextStyleDark,),
                          ),
                        ],
                      ),
                      ShowChild(
                        indicator: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "View More",
                            style: smallTextStyleBlue,
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(width: 10,),
                                Radio(
                                  value: 4,
                                  groupValue: category,
                                  onChanged: (T){
                                    print(T);
                                    setState(() {
                                      category=T;
                                    });
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child: Text("Movies",style: mediumTextStyleDark,),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(width: 10,),
                                Radio(
                                  value: 5,
                                  groupValue: category,
                                  onChanged: (T){
                                    print(T);
                                    setState(() {
                                      category=T;
                                    });
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child: Text("Fun",style: mediumTextStyleDark,),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(width: 10,),
                                Radio(
                                  value: 6,
                                  groupValue: category,
                                  onChanged: (T){
                                    print(T);
                                    setState(() {
                                      category=T;
                                    });
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child: Text("Scams",style: mediumTextStyleDark,),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(width: 10,),
                                Radio(
                                  value: 7,
                                  groupValue: category,
                                  onChanged: (T){
                                    print(T);
                                    setState(() {
                                      category=T;
                                    });
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child: Text("Technology",style: mediumTextStyleDark,),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(width: 10,),
                                Radio(
                                  value: 8,
                                  groupValue: category,
                                  onChanged: (T){
                                    print(T);
                                    setState(() {
                                      category=T;
                                    });
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child: Text("Sports",style: mediumTextStyleDark,),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text("News Types",style: mediumTextStyleBlue,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(
                    width: 0.5, //
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(width: 10,),
                          Radio(
                            value: 1,
                            groupValue: type,
                            onChanged: (T){
                              print(T);
                              setState(() {
                                type=T;
                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: Text("International",style: mediumTextStyleDark,),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(width: 10,),
                          Radio(
                            value: 2,
                            groupValue: type,
                            onChanged: (T){
                              print(T);
                              setState(() {
                                type=T;
                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: Text("National",style: mediumTextStyleDark,),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(width: 10,),
                          Radio(
                            value: 3,
                            groupValue: type,
                            onChanged: (T){
                              print(T);
                              setState(() {
                                type=T;
                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: Text("Local",style: mediumTextStyleDark,),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.5, //
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: new BorderRadius.circular(5.0),
                ),
                child: ToDoButton(
                    assetName: "",
                    text: "Select State",
                    backgroundColor: Colors.blue,
                    textSize: 20,
                    textColor: Colors.white,
                    onPressed: () => showBarModalBottomSheet(
                      expand: false,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context, scrollController) =>
                          ModalInsideModalState(
                              scrollController: scrollController),
                    )
                ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.5, //
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: new BorderRadius.circular(5.0),
                ),
                child: ToDoButton(
                    assetName: "",
                    text: "Select District",
                    backgroundColor: Colors.blue,
                    textSize: 20,
                    textColor: Colors.white,
                    onPressed: () => showBarModalBottomSheet(
                      expand: false,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context, scrollController) =>
                          ModalInsideModalDistrict(
                              scrollController: scrollController),
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

