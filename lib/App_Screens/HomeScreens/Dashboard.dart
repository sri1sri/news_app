import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:newsapp/global_file/common_variables/app_fonts.dart';
import 'package:newsapp/global_file/common_variables/app_functions.dart';
import 'package:newsapp/global_file/common_widgets/button_widget/to_do_button.dart';
import 'package:newsapp/global_file/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:newsapp/global_file/common_widgets/modal_inside_modal.dart';
import 'package:newsapp/global_file/common_widgets/offline_widgets/offline_widget.dart';
import 'package:swipe_stack/swipe_stack.dart';
import 'package:translator/translator.dart';

import 'DetailedNewsScreen.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_Dashboard(),
    );
  }
}

class F_Dashboard extends StatefulWidget {
  @override
  _F_Dashboard createState() => _F_Dashboard();
}

class _F_Dashboard extends State<F_Dashboard>with SingleTickerProviderStateMixin {
  TabController _tabController;
  final GlobalKey<SwipeStackState> _swipeKey = GlobalKey<SwipeStackState>();
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }
  @override
  Widget build(BuildContext context) {
    return offlineWidget(context);

  }

  Widget offlineWidget (BuildContext context){
    return CustomOfflineWidget(
      onlineChild: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Scaffold(
          body: _buildContent(context),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
//      appBar: PreferredSize(
//        preferredSize:
//        Size.fromHeight(55),
//        child: CustomAppBarDark(
//          leftActionBar: Image.network("https://cdn3.iconfinder.com/data/icons/google-suits-1/32/18_google_translate_text_language_translation-512.png",height: 50,width: 50,),
//          leftAction: () => showBarModalBottomSheet(
//            expand: false,
//            context: context,
//            backgroundColor: Colors.transparent,
//            builder: (context, scrollController) =>
//                ModalInsideModal(
//                    scrollController: scrollController),
//          ),
//          rightActionBar: Icon(Icons.translate,color: Colors.white,size: 40,),
//          rightAction: (){
//
//          },
//          primaryText: 'Home',
//          tabBarWidget: null,
//        ),
//      ),
      body: Scaffold(
        //backgroundColor: Colors.white,
        body: SafeArea(
          child: DefaultTabController(
            length: 6,
            child: Column(
              children: <Widget>[
            ButtonsTabBar(
            backgroundColor: Colors.transparent,
              unselectedBackgroundColor: Colors.transparent,
              unselectedLabelStyle: smallTextStyleMedium,
              labelStyle: smallTextStyleDark,
              tabs: [
                Tab(text: "All",),
                Tab(text: "Politics",),
                Tab(text: "Tech",),
                Tab(text: "Sports",),
                Tab(text: "Movies",),
                Tab(text: "World",),
              ],
            ),
//                Padding(
//                  padding: const EdgeInsets.only(left:70.0,top: 10,bottom: 10),
//                  child: Container(
//                    decoration: BoxDecoration(
//                      gradient: LinearGradient(
//                          colors: <Color>[
//                            Color(0Xff0072FF),
//                            Color(0Xff00C6FF),
//                          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
//                      borderRadius:BorderRadius.only(topLeft: Radius.circular(30.0),
//                          bottomLeft: Radius.circular(30.0)),
//                    ),
//                    height: 65,
//                    child: ButtonsTabBar(
//                      backgroundColor: Colors.transparent,
//                      unselectedBackgroundColor: Colors.transparent,
//                      unselectedLabelStyle: smallTextStyleLight,
//                      labelStyle: foregroundTextStyleLight,
//                      tabs: [
//                        Tab(text: "All",),
//                        Tab(text: "Politics",),
//                        Tab(text: "Tech",),
//                        Tab(text: "Sports",),
//                        Tab(text: "Movies",),
//                        Tab(text: "World",),
//                      ],
//                    ),
//                  ),
//                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom:20.0),
                        child: SwipeStack(
                          key: _swipeKey,
                          children: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((int index) {
                            return SwiperItem(
                                builder: (SwiperPosition position, double progress) {
                                  return Material(
                                      elevation: 3,
                                      borderRadius: BorderRadius.all(Radius.circular(6)),
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(Radius.circular(6)),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text("Item $index", style: TextStyle(color: Colors.black, fontSize: 20)),
                                              Text("Progress $progress", style: TextStyle(color: Colors.blue, fontSize: 12)),
                                            ],
                                          )
                                      )
                                  );
                                }
                            );
                          }).toList(),
                          visibleCount: 4,
                          stackFrom: StackFrom.Bottom,
                          translationInterval: 6,
                          scaleInterval: 0.03,
                          onEnd: () => debugPrint("onEnd"),
                          onSwipe: (int index, SwiperPosition position) => debugPrint("onSwipe $index $position"),
                          onRewind: (int index, SwiperPosition position) => debugPrint("onRewind $index $position"),
                        ),
                      ),
                      Container(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              NewsCard(context,"https://cdn0.iconfinder.com/data/icons/social-62/512/media__social__web__network__youtube__channel_-512.png",
                                  "BBC News Times",
                                  "The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019.",
                                  "images/c1.jpeg",
                                  "5,322","10 min"),
                              NewsCard(context,"https://cdn2.iconfinder.com/data/icons/metro-ui-dock/128/The_Weather_Channel.png",
                                  "The Weather Channel",
                                  "The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019.",
                                  "images/c2.jpeg",
                                  "5,322","10 min"),
                              NewsCard(context,"https://cdn2.iconfinder.com/data/icons/metro-ui-dock/512/Fox_News.png",
                                  "The FOX News",
                                  "The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019.",
                                  "images/c3.jpeg",
                                  "5,322","10 min"),
                              NewsCard(context,"https://cdn0.iconfinder.com/data/icons/social-62/512/media__social__web__network__youtube__channel_-512.png",
                                  "BBC News Times",
                                  "The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019.",
                                  "images/c1.jpeg",
                                  "5,322","10 min"),
                              NewsCard(context,"https://cdn2.iconfinder.com/data/icons/metro-ui-dock/128/The_Weather_Channel.png",
                                  "The Weather Channel",
                                  "The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019.",
                                  "images/c2.jpeg",
                                  "5,322","10 min"),
                              NewsCard(context,"https://cdn2.iconfinder.com/data/icons/metro-ui-dock/512/Fox_News.png",
                                  "The FOX News",
                                  "The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019.",
                                  "images/c3.jpeg",
                                  "5,322","10 min"),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              NewsCard(context,"https://cdn0.iconfinder.com/data/icons/social-62/512/media__social__web__network__youtube__channel_-512.png",
                                  "BBC News Times",
                                  "The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019.",
                                  "images/c1.jpeg",
                                  "5,322","10 min"),
                              NewsCard(context,"https://cdn2.iconfinder.com/data/icons/metro-ui-dock/128/The_Weather_Channel.png",
                                  "The Weather Channel",
                                  "The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019.",
                                  "images/c2.jpeg",
                                  "5,322","10 min"),
                              NewsCard(context,"https://cdn2.iconfinder.com/data/icons/metro-ui-dock/512/Fox_News.png",
                                  "The FOX News",
                                  "The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019.",
                                  "images/c3.jpeg",
                                  "5,322","10 min"),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Icon(Icons.directions_car),
                      ),
                      Center(
                        child: Icon(Icons.directions_transit),
                      ),
                      Center(
                        child: Icon(Icons.directions_bike),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
      child: Container(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 13,
                  backgroundImage: NetworkImage(logoPath),
                ),
                SizedBox(width: 10,),
                Text(title,style: smallTextStyleDarkThin,)
              ],
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/1.57,
                  child: Text(content,style: mediumTextStyleDark,),
                ),
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Container(
                      height: 120.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: AssetImage(imgPath), fit: BoxFit.fill))),),
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




