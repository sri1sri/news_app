import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:newsapp/global_file/common_variables/app_fonts.dart';
import 'package:newsapp/global_file/common_widgets/button_widget/to_do_button.dart';
import 'package:newsapp/global_file/common_widgets/modal_inside_modal.dart';
import 'package:newsapp/global_file/common_widgets/offline_widgets/offline_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator/translator.dart';

class ChannelsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_ChannelsScreen(),
    );
  }
}

class F_ChannelsScreen extends StatefulWidget {
  @override
  _F_ChannelsScreen createState() => _F_ChannelsScreen();
}

class _F_ChannelsScreen extends State<F_ChannelsScreen>{
  var Channel = [
   "Times Now India",
    "BBC News Times",
    "The Weather Channel",
    "The Fox News",
    "Times Now India",
    "BBC News Times",
  ];
  List<String> F_image = [
    "https://cdn0.iconfinder.com/data/icons/social-62/512/media__social__web__network__youtube__channel_-512.png",
    "https://cdn2.iconfinder.com/data/icons/metro-ui-dock/512/Fox_News.png",
    "https://cdn2.iconfinder.com/data/icons/metro-ui-dock/128/The_Weather_Channel.png",
    "https://cdn2.iconfinder.com/data/icons/metro-ui-dock/128/The_Weather_Channel.png",
    "https://cdn0.iconfinder.com/data/icons/social-62/512/media__social__web__network__youtube__channel_-512.png",
    "https://cdn2.iconfinder.com/data/icons/metro-ui-dock/512/Fox_News.png",

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
     // backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Top Channels",style: mediumTextStyleDark,),
                  Text("See All",style: smallTextStyleBlue,)
                ],
              ),
              SizedBox(height: 10,),
              Container(
                height: 380,
                child: Expanded(
                  child: GridView.builder(
                    itemCount: Channel.length,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.75,
                      mainAxisSpacing: .4,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return new GestureDetector(
                        child: new Card(
                          elevation: 0.0,
                          child: new Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.withOpacity(0.2),
                            ),
                            alignment: Alignment.center,
                            margin: new EdgeInsets.only(
                                top: .0, bottom: .0, left: .0, right: .0),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(height: 5,),
                                Image.network(
                                  F_image[index],height: 50,
                                ),
                                SizedBox(height: 5,),
                                new Text(
                                  Channel[index],
                                  style: mediumTextStyleDarkThin,textAlign: TextAlign.center,
                                ),
                                Container(
                                  height: 30,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: <Color>[
                                          Color(0Xff0072FF),
                                          Color(0Xff00C6FF),
                                        ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                                    borderRadius:BorderRadius.only(bottomRight:  Radius.circular(10.0),
                                        bottomLeft: Radius.circular(10.0)),
                                  ),
                                  child:Center(child: Text("Follow",style: smallTextStyleLight,)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {

                        },
                      );
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("For You",style: mediumTextStyleDark,),
                  Text("See All",style: smallTextStyleBlue,)
                ],
              ),
              SizedBox(height: 10,),
              Container(
                height: 380,
                child: Expanded(
                  child: GridView.builder(
                    itemCount: Channel.length,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.75,
                      mainAxisSpacing: .4,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return new GestureDetector(
                        child: new Card(
                          elevation: 0.0,
                          child: new Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.withOpacity(0.2),
                            ),
                            alignment: Alignment.center,
                            margin: new EdgeInsets.only(
                                top: .0, bottom: .0, left: .0, right: .0),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(height: 5,),
                                Image.network(
                                  F_image[index],height: 50,
                                ),
                                SizedBox(height: 5,),
                                new Text(
                                  Channel[index],
                                  style: mediumTextStyleDarkThin,textAlign: TextAlign.center,
                                ),
                                Container(
                                  height: 30,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: <Color>[
                                          Color(0Xff0072FF),
                                          Color(0Xff00C6FF),
                                        ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                                    borderRadius:BorderRadius.only(bottomRight:  Radius.circular(10.0),
                                        bottomLeft: Radius.circular(10.0)),
                                  ),
                                  child:Center(child: Text("Follow",style: smallTextStyleLight,)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {

                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}





