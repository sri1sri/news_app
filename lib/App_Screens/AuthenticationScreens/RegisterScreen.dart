import 'package:dropdown_search/dropdownSearch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gender_selection/gender_selection.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/App_Screens/HomeScreens/home.dart';
import 'package:newsapp/App_Screens/menu_frame.dart';
import 'package:newsapp/global_file/common_variables/app_colors.dart';
import 'package:newsapp/global_file/common_variables/app_fonts.dart';
import 'package:newsapp/global_file/common_variables/app_functions.dart';
import 'package:newsapp/global_file/common_widgets/offline_widgets/offline_widget.dart';
import 'package:lottie/lottie.dart';

class RegistrationScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_RegistrationScreens(),
    );
  }
}

class F_RegistrationScreens extends StatefulWidget {
  @override
  _F_RegistrationScreens createState() => _F_RegistrationScreens();
}

class _F_RegistrationScreens extends State<F_RegistrationScreens> {
  final _formKey = GlobalKey<FormState>();

  String _username;
  final FocusNode _usernameFocusNode = FocusNode();

  String selectedGender;

  DateTime selectedDate = DateTime.now();
  var customFormat2 = DateFormat("dd MMMM yyyy");

  bool isLoading = false;

  Future<Null> showPicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2003),
      firstDate: DateTime(1930),
      lastDate: DateTime(2003),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
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
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 40,),
                      GradientText(
                        'Almost there..!',
                        style: foregroundTextStyleDark,
                        gradient: LinearGradient(
                          colors: [
                            Color(0Xff0072FF),
                            Color(0Xff00C6FF),
                          ],
                          begin: Alignment.topLeft,
                          end:
                          Alignment.bottomRight,
                        ),
                      ),
                      //Text("Almost there..!",style: foregroundTextStyleDark,),
                      SizedBox(height: 10,),
                      Form(
                        key: _formKey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Username",style: mediumTextStyleDark,),
                                     SizedBox(height: 10,),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10.0),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromRGBO(0, 0, 0, 0.1),
                                              offset: Offset(3, 3),
                                              blurRadius: 1.0,
                                              spreadRadius: 2.0),
                                          BoxShadow(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 0.9),
                                              offset: Offset(-2, -2),
                                              blurRadius: 1.0,
                                              spreadRadius: 2.0)
                                        ],
                                      ),
                                      child: new TextFormField(
                                        onChanged: (value) => _username = value,
                                        textInputAction: TextInputAction.done,
                                        //onEditingComplete: _submit,
                                        autocorrect: true,
                                        obscureText: false,
                                        focusNode: _usernameFocusNode,
                                        decoration: new InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.account_circle,
                                            color: inActiveButtonTextColor,
                                          ),
                                          labelText: "Enter username",
                                          labelStyle: smallTextStyleDark,
                                          border: new OutlineInputBorder(
                                            borderRadius:
                                            new BorderRadius.circular(5.0),
                                            borderSide: new BorderSide(),
                                          ),
                                        ),
                                        style: new TextStyle(
                                          fontFamily: "Poppins",
                                        ),
                                        keyboardType: TextInputType.text,
                                        keyboardAppearance: Brightness.light,
                                        validator: (value) {
                                          print(value);
                                          if (value.isEmpty) {
                                            return 'Please enter username';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text("Add State",style: mediumTextStyleDark,),
                                    SizedBox(height: 10,),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10.0),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromRGBO(0, 0, 0, 0.1),
                                              offset: Offset(3, 3),
                                              blurRadius: 1.0,
                                              spreadRadius: 2.0),
                                          BoxShadow(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 0.9),
                                              offset: Offset(-2, -2),
                                              blurRadius: 1.0,
                                              spreadRadius: 2.0)
                                        ],
                                      ),
                                      child: new  DropdownSearch(
                                          showSelectedItem: true,
                                          maxHeight: 400,
                                          mode: Mode.MENU,
                                          items: ["Tamil Nadu", "Kerala", "Andhra"],
                                          label: "State",
                                          labelStyle: smallTextStyleDark,
                                          onChanged: print,
                                          selectedItem: "Choose your State",
                                          showSearchBox: true),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text("Add District",style: mediumTextStyleDark,),
                                    SizedBox(height: 10,),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10.0),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromRGBO(0, 0, 0, 0.1),
                                              offset: Offset(3, 3),
                                              blurRadius: 1.0,
                                              spreadRadius: 2.0),
                                          BoxShadow(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 0.9),
                                              offset: Offset(-2, -2),
                                              blurRadius: 1.0,
                                              spreadRadius: 2.0)
                                        ],
                                      ),
                                      child: new  DropdownSearch(
                                          showSelectedItem: true,
                                          maxHeight: 400,
                                          mode: Mode.MENU,
                                          items: ["Coimbatore", "Chennai", "Madurai"],
                                          label: "City/District",
                                          labelStyle: smallTextStyleDark,
                                          onChanged: print,
                                          selectedItem: "Choose your District",
                                          showSearchBox: true),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Note:\nPlease add your State and District to get local news & Be updated by knowing whats happening around you. ",style: smallTextStyleDark,),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Date Of Birth",
                                      style: mediumTextStyleDark,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding:
                                      EdgeInsets.only(top: 0, bottom: 10),
                                      child: Container(
                                        child: RaisedButton(
                                          color: Colors.white,
                                          child: Container(
                                            height: 60,
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: <Widget>[
                                                    Container(
                                                      child: Row(
                                                        children: <Widget>[
                                                          Icon(
                                                            Icons.date_range,
                                                            size: 18.0,
                                                            color:
                                                            backgroundColor,
                                                          ),
                                                          SizedBox(width: 10,),
                                                          Text(
                                                              customFormat2.format(
                                                                  selectedDate) ==
                                                                  customFormat2.format(
                                                                      DateTime
                                                                          .now())
                                                                  ? 'Add birthday'
                                                                  : '${customFormat2.format(selectedDate)}',
                                                              style:
                                                              smallTextStyleDark),
                                                        ],
                                                      ),
                                                    ),
                                                    GradientText(
                                                      'Change',
                                                      style: mediumTextStyleDark,
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color(0Xff0072FF),
                                                          Color(0Xff00C6FF),
                                                        ],
                                                        begin: Alignment.topLeft,
                                                        end:
                                                        Alignment.bottomRight,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: 10),
                                              ],
                                            ),
                                          ),
                                          onPressed: () {
                                            showPicker(context);
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Gender",
                                      style: mediumTextStyleDark,
                                    ),
//                              SizedBox(height: 20,),
                                    GenderSelection(
                                      maleText: "Male", //default Male
                                      femaleText: "Female", //default Female
                                      //linearGradient: pinkRedGradient,
                                      femaleImage: NetworkImage(
                                          "https://cdn2.iconfinder.com/data/icons/avatar-2/512/laly_face_woman-128.png"),
                                      maleImage: NetworkImage(
                                          "https://cdn2.iconfinder.com/data/icons/avatar-2/512/profile_boy-512.png"),
                                      selectedGenderIconBackgroundColor:
                                      Colors.green, // default red
                                      checkIconAlignment: Alignment
                                          .centerRight, // default bottomRight
                                      selectedGenderCheckIcon:
                                      null, // default Icons.check
                                      onChanged: (gender) {
                                        selectedGender =
                                            gender.toString().substring(7);
                                      },
                                      equallyAligned: true,
                                      animationDuration:
                                      Duration(milliseconds: 400),
                                      isCircular: true, // default : true,
                                      isSelectedGenderIconCircular: true,
                                      opacityOfGradient: 0.4,
                                      padding: const EdgeInsets.all(3),
                                      size: 120, //default : 120
                                    ),
                                    SizedBox(
                                      height:30,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text(""),
                        ),
                        GestureDetector(
                          child: Container(
                            width: 170.0,
                            height: 60,
                            padding: EdgeInsets.all(20.0),
                            child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(),
                                      Text("Submit",style: foregroundTextStyleLight,),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                      Container(),
                                    ])),
                            decoration: BoxDecoration(
                                color: Colors.white,
                            gradient: LinearGradient(
                                colors: <Color>[
                                Color(0Xff0072FF),
                            Color(0Xff00C6FF),
                            ], begin: Alignment.centerLeft, end: Alignment.centerRight),

                                borderRadius: BorderRadius.circular(30.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.6),
                                      offset: Offset(2, 1),
                                      blurRadius: 1.0,
                                      spreadRadius: 2.0),
                                ]),
                          ),
                          onTap: (){
                            GoToPage(context,MenuFrame(),false);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                              'By continuing, You accept the Terms & Conditions Of the',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: ' Terms of use',
                              style: TextStyle(
                                color: backgroundColor,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: ' and',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: ' Privacy Policies',
                              style: TextStyle(
                                color: backgroundColor,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}

