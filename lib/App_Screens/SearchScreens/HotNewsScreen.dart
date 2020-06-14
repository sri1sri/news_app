import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/App_Screens/HomeScreens/DetailedNewsScreen.dart';
import 'package:newsapp/global_file/common_variables/app_fonts.dart';
import 'package:newsapp/global_file/common_variables/app_functions.dart';
import 'package:newsapp/global_file/common_widgets/offline_widgets/offline_widget.dart';
class HotNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_HotNewsScreen(),
    );
  }
}

class F_HotNewsScreen extends StatefulWidget {
  @override
  _F_HotNewsScreen createState() => _F_HotNewsScreen();
}

class _F_HotNewsScreen extends State<F_HotNewsScreen>{
  var newsHeading = [
    "COVID-19 pandemic, also known as the coronavirus pandemic",
    "COVID-19 pandemic, also known as the coronavirus pandemic",
    "COVID-19 pandemic, also known as the coronavirus pandemic",
    "The COVID-19 pandemic, also known as the coronavirus pandemic",
    "The COVID-19 pandemic, also known as the coronavirus pandemic",
    "The COVID-19 pandemic, also known as the coronavirus pandemic",
  ];
  List<String> F_image = [
    "images/c1.jpeg",
    "images/c2.jpeg",
    "images/c3.jpeg",
    "images/c1.jpeg",
    "images/c2.jpeg",
    "images/c3.jpeg",

  ];
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
      //backgroundColor: Colors.white,
      body: Container(
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



