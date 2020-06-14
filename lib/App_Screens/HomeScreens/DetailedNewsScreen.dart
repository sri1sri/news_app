import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:newsapp/App_Screens/HomeScreens/ChannelScreen.dart';
import 'package:newsapp/global_file/common_variables/app_fonts.dart';
import 'package:newsapp/global_file/common_variables/app_functions.dart';
import 'package:newsapp/global_file/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:newsapp/global_file/common_widgets/modal_fit.dart';
import 'package:newsapp/global_file/common_widgets/offline_widgets/offline_widget.dart';

class DetailedNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_DetailedNewsScreen(),
    );
  }
}

class F_DetailedNewsScreen extends StatefulWidget {
  @override
  _F_DetailedNewsScreen createState() => _F_DetailedNewsScreen();
}

class _F_DetailedNewsScreen extends State<F_DetailedNewsScreen> {

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
            rightActionBar: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.turned_in_not,color: Colors.black,size: 30,),
                ),
                IconButton(
                  icon: Icon(Icons.more_vert,color: Colors.black,size: 30,),
                  onPressed: () => showMaterialModalBottomSheet(
          expand: false,
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context, scrollController) =>
              ModalFit(scrollController: scrollController),
        ),
                ),
              ],
            ),
            tabBarWidget: null,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      GoToPage(context,ChannelScreen(),false);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("Fox News",style: titleTextStyleDark,),
                            Text("#Health  #National",style: smallTextStyleBlue,),
                          ],
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 25,
                          backgroundImage: NetworkImage("https://cdn2.iconfinder.com/data/icons/metro-ui-dock/512/Fox_News.png"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text("The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019 , also known as the coronavirus.",style: mediumTextStyleDark,),
                  SizedBox(height: 15,),
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                        height: 250.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: AssetImage("images/c1.jpeg"), fit: BoxFit.fill))),),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Text("3,232 views",style: smallTextStyleDark,),
                      SizedBox(width: 25,),
                      Text("2hrs ago",style: smallTextStyleDark,),
                    ],
                  ),
                  SizedBox(height: 25,),
                  Text("The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019. The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019. The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019. The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019.",style: smallTextStyleDarkThin,),
                  SizedBox(height: 25,),
                  Text("The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019. The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019. The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019. The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019.",style: smallTextStyleDarkThin,),
                  SizedBox(height: 25,),
                 Text("The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019. The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019. The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019. The COVID-19 pandemic, also known as the coronavirus pandemic, disease 2019.",style: smallTextStyleDarkThin,),
                  SizedBox(height: 25,),
                ],
              ),
            ),
          ),
        )
    );
  }
}

