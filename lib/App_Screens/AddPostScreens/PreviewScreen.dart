import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/App_Screens/HomeScreens/ChannelScreen.dart';
import 'package:newsapp/global_file/common_variables/app_fonts.dart';
import 'package:newsapp/global_file/common_variables/app_functions.dart';
import 'package:newsapp/global_file/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:newsapp/global_file/common_widgets/offline_widgets/offline_widget.dart';

class PreviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_PreviewScreen(),
    );
  }
}

class F_PreviewScreen extends StatefulWidget {
  @override
  _F_PreviewScreen createState() => _F_PreviewScreen();
}

class _F_PreviewScreen extends State<F_PreviewScreen> {

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
            rightActionBar: Text("Edit",style: mediumTextStyleBlue,),
            rightAction: (){

            },
            primaryText: "Preview",
            tabBarWidget: null,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 15,),
                  Text("The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019 , also known as the coronavirus.",style: mediumTextStyleDark,),
                  SizedBox(height: 15,),
                  Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black54, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                        height: 250.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: NetworkImage("https://cdn0.iconfinder.com/data/icons/coronavirus-34/512/news_update-online-breaking-headline-report-512.png"), fit: BoxFit.fill))),),
                  SizedBox(height: 25,),
                  Text("The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019. The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019. The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019. The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019.",style: smallTextStyleMedium,),
                  SizedBox(height: 25,),
                  Text("The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019. The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019. The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019. The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019.",style: smallTextStyleMedium,),
                  SizedBox(height: 25,),
                  Text("The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019. The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019. The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019. The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019.",style: smallTextStyleMedium,),
                ],
              ),
            ),
          ),
        )
    );
  }
}

