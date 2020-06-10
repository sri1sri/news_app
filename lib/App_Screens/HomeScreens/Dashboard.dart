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
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(55),
        child: CustomAppBarDark(
          leftActionBar: Image.network("https://cdn3.iconfinder.com/data/icons/google-suits-1/32/18_google_translate_text_language_translation-512.png",height: 50,width: 50,),
          leftAction: () => showBarModalBottomSheet(
            expand: false,
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context, scrollController) =>
                ModalInsideModal(
                    scrollController: scrollController),
          ),
          rightActionBar: Icon(Icons.translate,color: Colors.white,size: 40,),
          rightAction: (){

          },
          primaryText: 'Home',
          tabBarWidget: null,
        ),
      ),
      body: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: DefaultTabController(
            length: 6,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:70.0,top: 10,bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.only(topLeft: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0)),
                      color: Colors.blue,
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
                  radius: 20,
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




