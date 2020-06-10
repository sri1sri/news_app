import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/App_Screens/AuthenticationScreens/RegisterScreen.dart';
import 'package:newsapp/global_file/common_variables/app_fonts.dart';
import 'package:newsapp/global_file/common_variables/app_functions.dart';
import 'package:newsapp/global_file/common_widgets/button_widget/to_do_button.dart';
import 'package:newsapp/global_file/common_widgets/offline_widgets/offline_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator/translator.dart';

class AuthenticationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_AuthenticationScreen(),
    );
  }
}

class F_AuthenticationScreen extends StatefulWidget {
  @override
  _F_AuthenticationScreen createState() => _F_AuthenticationScreen();
}

class _F_AuthenticationScreen extends State<F_AuthenticationScreen> {

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
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
           children: [
             ToDoButton(
               assetName: "",
               text: "SignIn with Google",
               backgroundColor: Colors.redAccent,
               textSize: 20,
               textColor: Colors.white,
               onPressed: (){
               },
             ),
             SizedBox(height: 10,),
             ToDoButton(
               assetName: "",
               text: "SignIn with Facebook",
               backgroundColor: Colors.blueAccent,
               textSize: 20,
               textColor: Colors.white,
               onPressed: ()
               {
               },
             ),
             SizedBox(height: 10,),
             ToDoButton(
               assetName: "",
               text: "SignIn with AppleId",
               backgroundColor: Colors.black54,
               textSize: 20,
               textColor: Colors.white,
               onPressed: (){
                 GoToPage(context,RegistrationScreens(),false);
               },
             ),
             SizedBox(height: 50),
           ],
          ),
        )
    );
  }
  _read(String langCode) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'Langauge';
    final value = prefs.getString(key) ?? langCode;
    print('read: $value');
  }
}

