import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/App_Screens/HomeScreens/DetailedNewsScreen.dart';
import 'package:newsapp/App_Screens/menu_frame.dart';
import 'package:newsapp/global_file/common_variables/app_fonts.dart';
import 'package:newsapp/global_file/common_variables/app_functions.dart';
import 'package:newsapp/global_file/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:newsapp/global_file/common_widgets/offline_widgets/offline_widget.dart';
import 'package:search_widget/search_widget.dart';

import 'ChannelsScreen.dart';
import 'HotNewsScreen.dart';

class SearchHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_SearchHomeScreen(),
    );
  }
}

class F_SearchHomeScreen extends StatefulWidget {
  @override
  _F_SearchHomeScreen createState() => _F_SearchHomeScreen();
}

class _F_SearchHomeScreen extends State<F_SearchHomeScreen> {
  List<LeaderBoard> list = <LeaderBoard>[
    LeaderBoard("Flutter", 54),
    LeaderBoard("React", 22.5),
    LeaderBoard("Ionic", 24.7),
    LeaderBoard("Xamarin", 22.1),
  ];

  LeaderBoard _selectedItem;

  bool _show = true;
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
      //backgroundColor: Colors.white,
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.menu,color: Colors.black,size: 30,),
                    onPressed: (){
                      GoToPage(context,MenuFrame(),false);
                    },
                  ),
                ],
              ),
              if (_show)
                SearchWidget<LeaderBoard>(
                  dataList: list,
                  hideSearchBoxWhenItemSelected: false,
                  listContainerHeight: MediaQuery.of(context).size.height / 4,
                  queryBuilder: (query, list) {
                    return list
                        .where((item) => item.username
                        .toLowerCase()
                        .contains(query.toLowerCase()))
                        .toList();
                  },
                  popupListItemBuilder: (item) {
                    return PopupListItemWidget(item);
                  },
                  selectedItemBuilder: (selectedItem, deleteSelectedItem) {
                    return SelectedItemWidget(selectedItem, deleteSelectedItem);
                  },
                  // widget customization
                  noItemsFoundWidget: NoItemsFound(),
                  textFieldBuilder: (controller, focusNode) {
                    return MyTextField(controller, focusNode);
                  },
                  onItemSelected: (item) {
                    setState(() {
                      _selectedItem = item;
                    });
                  },
                ),
              Padding(
                padding: const EdgeInsets.only(left:70.0,top: 10,bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: <Color>[
                          Color(0Xff0072FF),
                          Color(0Xff00C6FF),
                        ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                    borderRadius:BorderRadius.only(topLeft: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0)),
                  ),
                  height: 65,
                  child: ButtonsTabBar(
                    backgroundColor: Colors.transparent,
                    unselectedBackgroundColor: Colors.transparent,
                    unselectedLabelStyle: smallTextStyleLight,
                    labelStyle: foregroundTextStyleLight,
                    tabs: [
                      Tab(text: "Hot News",),
                      Tab(text: "Channels",),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    HotNewsScreen(),
                    ChannelsScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget NewsCard(BuildContext context,String logoPath,String title,String content,String imgPath,String counts,String time){
  return GestureDetector(
    onTap: (){
      GoToPage(context,DetailedNewsScreen(),false);
    },
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 15,
                  backgroundImage: NetworkImage(logoPath),
                ),
                SizedBox(width: 10,),
                Text(title,style: mediumTextStyleDarkThin,)
              ],
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/1.57,
                  child: Text(content,style: mediumTextStyleDark,),
                ),
                Card(
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black54, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                      height: 120.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: NetworkImage(imgPath), fit: BoxFit.fill))),),
              ],
            ),
            Row(
              children: [
                Text("$counts reads",style: smallTextStyleMedium,),
                SizedBox(width: 30,),
                Text("$time ago",style: smallTextStyleMedium,),

              ],
            ),
          ],
        ),
      ),
    ),
  );
}

class LeaderBoard {
  LeaderBoard(this.username, this.score);

  final String username;
  final double score;
}

class SelectedItemWidget extends StatelessWidget {
  const SelectedItemWidget(this.selectedItem, deleteSelectedItem);

  final LeaderBoard selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 4,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 8,
                bottom: 8,
              ),
              child: Text(
                selectedItem.username,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField(this.controller, this.focusNode);

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10.0),
              ),
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          decoration: InputDecoration(
            fillColor: Colors.grey.withOpacity(0.9),
//          enabledBorder: const OutlineInputBorder(
//            borderSide: BorderSide(
//              color: Color(0x4437474F),
//            ),
//          ),
//          focusedBorder: OutlineInputBorder(
//            borderSide: BorderSide(color: Theme.of(context).primaryColor),
//          ),
            suffixIcon: Icon(Icons.search),
            border: InputBorder.none,
            hintText: "My Search",
            hintStyle: mediumTextStyleMediumThin,
            labelStyle: mediumTextStyleMediumThin,
            contentPadding: const EdgeInsets.only(
              left: 16,
              right: 20,
              top: 14,
              bottom: 14,
            ),
          ),
        ),
      ),
    );
  }
}

class NoItemsFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          Icons.folder_open,
          size: 24,
          color: Colors.grey[900].withOpacity(0.7),
        ),
        const SizedBox(width: 10),
        Text(
          "No Items Found",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[900].withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}

class PopupListItemWidget extends StatelessWidget {
  const PopupListItemWidget(this.item);

  final LeaderBoard item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Text(
        item.username,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}