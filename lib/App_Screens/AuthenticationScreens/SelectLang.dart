import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/App_Screens/AuthenticationScreens/Authentication.dart';
import 'package:newsapp/global_file/common_variables/app_fonts.dart';
import 'package:newsapp/global_file/common_variables/app_functions.dart';
import 'package:newsapp/global_file/common_widgets/button_widget/to_do_button.dart';
import 'package:newsapp/global_file/common_widgets/offline_widgets/offline_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_panel/sliding_panel.dart';
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

  int _n = 0;
  PanelController pc;
  String langCode = "en";
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    pc = PanelController();

    animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  List<Widget> get _content => [
    SizedBox(height: 20,),
    Langauge("en","English"),
    Langauge("ta","Tamil"),
    Langauge("te","Telugu"),
    Langauge("hi","Hindi"),
    Langauge("kn","Kannada"),
    Langauge("ml","Malayalam"),
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
      backgroundColor: Colors.white,
      body: SlidingPanel(
        panelController: pc,
        safeAreaConfig: langCode != null
            ? SafeAreaConfig.all(removePaddingFromContent: true)
            : SafeAreaConfig(removePaddingFromContent: false),
        backdropConfig: BackdropConfig(
          enabled: true,
          shadowColor: Color.fromRGBO(74, 118, 129, 1),
        ),
        size: PanelSize(closedHeight: 0.0, collapsedHeight: 0.5, expandedHeight: 1.0),
        decoration: PanelDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          backgroundColor: Colors.white,
        ),
        content: PanelContent(
          panelContent: _content,
          headerWidget: PanelHeaderWidget(
            decoration: PanelDecoration(
              padding: EdgeInsets.all(16),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            options: PanelHeaderOptions(
              elevation: 24,
              primary: true,
            ),
          ),
          bodyContent: Padding(
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
                  onPressed: pc.collapse,
                ),
                SizedBox(height: 50,)
              ],
            ),
          ),
        ),
        onPanelSlide: (x) {
          animationController.value = pc.percentPosition(pc.sizeData.closedHeight, pc.sizeData.expandedHeight);
        },
        parallaxSlideAmount: 0.0,
        snapping: PanelSnapping.disabled,
        duration: Duration(milliseconds: 300),
        dragMultiplier: 1.5,
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

  Langauge (String code,String langauge)
  {
    return ListTile(
      onTap: () {
        setState(() {
          langCode = code;
         // _read(langCode);
          _save(langCode);
          // print(langCode);
        });
        GoToPage(context,AuthenticationScreen(langcode: langCode,),false);
      },
      selected: true,
      title: Text(
        langauge,textAlign: TextAlign.center,style: mediumTextStyleDark,
      ),
    );
  }
}

