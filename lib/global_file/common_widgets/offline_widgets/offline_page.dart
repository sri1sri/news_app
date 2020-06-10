
import 'package:flutter/cupertino.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:newsapp/global_file/common_variables/app_fonts.dart';
import 'package:newsapp/global_file/common_variables/app_functions.dart';



class OfflinePage extends CustomOfflinePage{
  OfflinePage({
    @required String text,
  }) : assert(text != null),
        super(
        text: text,
      );
}

class CustomOfflinePage extends StatelessWidget {

  CustomOfflinePage({this.text});

  final text;

  @override

  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getDynamicHeight(100.0,context),),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GradientText(
                'Tell The Truth',
                style: foregroundTextStyleDark,
                gradient: LinearGradient(
                  colors: [
                    Color(0XffFD8B1F),
                    Color(0XffD152E0),
                    Color(0Xff30D0DB),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            SizedBox(
              width: getDynamicWidth(350.0,context),
              height: getDynamicHeight(450.0,context),
              child: FlareActor("images/no internet.flr", alignment:Alignment.center, fit:BoxFit.contain, animation:'no_netwrok'),
            ),
            //Splash(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('No Internet connection.\nPlease check connection!!!',style: foregroundTextStyleDark,),
            ),

          ],
        ) ,
      ),
    );
  }
}