import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/App_Screens/HomeScreens/DetailedNewsScreen.dart';
import 'package:newsapp/global_file/common_variables/app_fonts.dart';
import 'package:newsapp/global_file/common_variables/app_functions.dart';
import 'package:newsapp/global_file/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:newsapp/global_file/common_widgets/offline_widgets/offline_widget.dart';

class BookMarkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_BookMarkScreen(),
    );
  }
}

class F_BookMarkScreen extends StatefulWidget {
  @override
  _F_BookMarkScreen createState() => _F_BookMarkScreen();
}

class _F_BookMarkScreen extends State<F_BookMarkScreen> {

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
          primaryText: "Bookmarked",
          tabBarWidget: null,
        ),
      ),
      body: Container(
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