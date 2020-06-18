import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/App_Screens/HomeScreens/DetailedNewsScreen.dart';
import 'package:newsapp/App_Screens/ProfileScreens/BookmarkScreen.dart';
import 'package:newsapp/App_Screens/menu_frame.dart';
import 'package:newsapp/global_file/common_variables/app_fonts.dart';
import 'package:newsapp/global_file/common_variables/app_functions.dart';
import 'package:newsapp/global_file/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:newsapp/global_file/common_widgets/offline_widgets/offline_widget.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_ProfileScreen(),
    );
  }
}

class F_ProfileScreen extends StatefulWidget {
  @override
  _F_ProfileScreen createState() => _F_ProfileScreen();
}

class _F_ProfileScreen extends State<F_ProfileScreen> {

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
          rightActionBar: Icon(Icons.turned_in,color: Colors.black,size: 25,),
          rightAction: () {
            GoToPage(context,BookMarkScreen(),false);
          },
          leftActionBar: Icon(Icons.menu,color: Colors.black,size: 30,),
          leftAction: (){
            GoToPage(context,MenuFrame(),false);
          },
          tabBarWidget: null,
        ),
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 6,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 40,
                              backgroundImage: NetworkImage("https://cdn2.iconfinder.com/data/icons/metro-ui-dock/512/Fox_News.png"),
                            ),
                            SizedBox(height: 10,),
                            Text("Fox News India",style: mediumTextStyleDarkThin,),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text("20M",style: mediumTextStyleBlue,),
                              // SizedBox(height: 35,),
                              Text("Followers",style: smallTextStyleMedium,),
                            ],
                          ),
                          SizedBox(width: 30,),
                          Column(
                            children: [
                              Text("432",style: mediumTextStyleBlue,),
                              //SizedBox(height: 30,),
                              Text("Posts",style: smallTextStyleMedium,),
                            ],
                          ),
                          SizedBox(width: 30,),
                          Column(
                            children: [
                              Text("43256",style: mediumTextStyleBlue,),
                              //SizedBox(height: 30,),
                              Text("Following",style: smallTextStyleMedium,),
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 15,),
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
                      Tab(text: "All",),
                      Tab(text: "Politics",),
                      Tab(text: "Tech",),
                      Tab(text: "Sports",),
                      Tab(text: "Movies",),
                      Tab(text: "World",),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            NewsCard(context,"https://cdn0.iconfinder.com/data/icons/social-62/512/media__social__web__network__youtube__channel_-512.png",
                                "BBC News Times",
                                "The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019.",
                                "https://cdn0.iconfinder.com/data/icons/covid-19-37/512/IntelligentlyConsumeSocialMedia-fakenews-lie-news-socialmedia-covid19-128.png",
                                "5,322","10 min"),
                            NewsCard(context,"https://cdn2.iconfinder.com/data/icons/metro-ui-dock/128/The_Weather_Channel.png",
                                "The Weather Channel",
                                "The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019.",
                                "https://cdn1.iconfinder.com/data/icons/coronavirus-and-economy-4/64/news-online-media-internet-coronavirus-512.png",
                                "5,322","10 min"),
                            NewsCard(context,"https://cdn2.iconfinder.com/data/icons/metro-ui-dock/512/Fox_News.png",
                                "The FOX News",
                                "The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019.",
                                "https://cdn0.iconfinder.com/data/icons/coronavirus-34/512/news_update-online-breaking-headline-report-512.png",
                                "5,322","10 min"),
                            NewsCard(context,"https://cdn0.iconfinder.com/data/icons/social-62/512/media__social__web__network__youtube__channel_-512.png",
                                "BBC News Times",
                                "The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019.",
                                "https://cdn0.iconfinder.com/data/icons/covid-19-37/512/IntelligentlyConsumeSocialMedia-fakenews-lie-news-socialmedia-covid19-128.png",
                                "5,322","10 min"),
                            NewsCard(context,"https://cdn2.iconfinder.com/data/icons/metro-ui-dock/128/The_Weather_Channel.png",
                                "The Weather Channel",
                                "The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019.",
                                "https://cdn1.iconfinder.com/data/icons/coronavirus-and-economy-4/64/news-online-media-internet-coronavirus-512.png",
                                "5,322","10 min"),
                            NewsCard(context,"https://cdn2.iconfinder.com/data/icons/metro-ui-dock/512/Fox_News.png",
                                "The FOX News",
                                "The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019.",
                                "https://cdn0.iconfinder.com/data/icons/coronavirus-34/512/news_update-online-breaking-headline-report-512.png",
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
                                "https://cdn0.iconfinder.com/data/icons/covid-19-37/512/IntelligentlyConsumeSocialMedia-fakenews-lie-news-socialmedia-covid19-128.png",
                                "5,322","10 min"),
                            NewsCard(context,"https://cdn2.iconfinder.com/data/icons/metro-ui-dock/128/The_Weather_Channel.png",
                                "The Weather Channel",
                                "The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019.",
                                "https://cdn1.iconfinder.com/data/icons/coronavirus-and-economy-4/64/news-online-media-internet-coronavirus-512.png",
                                "5,322","10 min"),
                            NewsCard(context,"https://cdn2.iconfinder.com/data/icons/metro-ui-dock/512/Fox_News.png",
                                "The FOX News",
                                "The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019.",
                                "https://cdn0.iconfinder.com/data/icons/coronavirus-34/512/news_update-online-breaking-headline-report-512.png",
                                "5,322","10 min"),
                            NewsCard(context,"https://cdn0.iconfinder.com/data/icons/social-62/512/media__social__web__network__youtube__channel_-512.png",
                                "BBC News Times",
                                "The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019.",
                                "https://cdn0.iconfinder.com/data/icons/covid-19-37/512/IntelligentlyConsumeSocialMedia-fakenews-lie-news-socialmedia-covid19-128.png",
                                "5,322","10 min"),
                            NewsCard(context,"https://cdn2.iconfinder.com/data/icons/metro-ui-dock/128/The_Weather_Channel.png",
                                "The Weather Channel",
                                "The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019.",
                                "https://cdn1.iconfinder.com/data/icons/coronavirus-and-economy-4/64/news-online-media-internet-coronavirus-512.png",
                                "5,322","10 min"),
                            NewsCard(context,"https://cdn2.iconfinder.com/data/icons/metro-ui-dock/512/Fox_News.png",
                                "The FOX News",
                                "The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019.",
                                "https://cdn0.iconfinder.com/data/icons/coronavirus-34/512/news_update-online-breaking-headline-report-512.png",
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
                                "https://cdn0.iconfinder.com/data/icons/covid-19-37/512/IntelligentlyConsumeSocialMedia-fakenews-lie-news-socialmedia-covid19-128.png",
                                "5,322","10 min"),
                            NewsCard(context,"https://cdn2.iconfinder.com/data/icons/metro-ui-dock/128/The_Weather_Channel.png",
                                "The Weather Channel",
                                "The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019.",
                                "https://cdn1.iconfinder.com/data/icons/coronavirus-and-economy-4/64/news-online-media-internet-coronavirus-512.png",
                                "5,322","10 min"),
                            NewsCard(context,"https://cdn2.iconfinder.com/data/icons/metro-ui-dock/512/Fox_News.png",
                                "The FOX News",
                                "The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019.",
                                "https://cdn0.iconfinder.com/data/icons/coronavirus-34/512/news_update-online-breaking-headline-report-512.png",
                                "5,322","10 min"),
                            NewsCard(context,"https://cdn0.iconfinder.com/data/icons/social-62/512/media__social__web__network__youtube__channel_-512.png",
                                "BBC News Times",
                                "The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019.",
                                "https://cdn0.iconfinder.com/data/icons/covid-19-37/512/IntelligentlyConsumeSocialMedia-fakenews-lie-news-socialmedia-covid19-128.png",
                                "5,322","10 min"),
                            NewsCard(context,"https://cdn2.iconfinder.com/data/icons/metro-ui-dock/128/The_Weather_Channel.png",
                                "The Weather Channel",
                                "The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019.",
                                "https://cdn1.iconfinder.com/data/icons/coronavirus-and-economy-4/64/news-online-media-internet-coronavirus-512.png",
                                "5,322","10 min"),
                            NewsCard(context,"https://cdn2.iconfinder.com/data/icons/metro-ui-dock/512/Fox_News.png",
                                "The FOX News",
                                "The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019.",
                                "https://cdn0.iconfinder.com/data/icons/coronavirus-34/512/news_update-online-breaking-headline-report-512.png",
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