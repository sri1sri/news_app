import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:newsapp/App_Screens/AuthenticationScreens/Authentication.dart';
import 'package:newsapp/global_file/common_variables/app_fonts.dart';
import 'package:newsapp/global_file/common_variables/app_functions.dart';
import 'package:newsapp/global_file/common_widgets/button_widget/to_do_button.dart';
import 'package:newsapp/global_file/common_widgets/modal_inside_modal.dart';
import 'package:newsapp/global_file/common_widgets/offline_widgets/offline_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator/translator.dart';

class SelectLang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_SelectLang(),
    );
  }
}

class F_SelectLang extends StatefulWidget {
  @override
  _F_SelectLang createState() => _F_SelectLang();
}

class _F_SelectLang extends State<F_SelectLang> with SingleTickerProviderStateMixin{

  GoogleTranslator translator = GoogleTranslator();

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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            ToDoButton(
                assetName: "",
                text: "Select Langauge",
                backgroundColor: Colors.green,
                textSize: 20,
                textColor: Colors.white,
                onPressed: () => showBarModalBottomSheet(
                  expand: false,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context, scrollController) =>
                      ModalInsideModal(
                          scrollController: scrollController),
                )
            ),
            SizedBox(height: 50,)
          ],
        ),
      ),

    );
  }

  _read(int langCode) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'Langauge';
    final value = prefs.getString(key) ?? langCode;
    print('read: $value');
  }

  _save(String code) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'Langauge';
    final value = code;
    prefs.setString(key, value);
    print('saved $value');
  }
}





