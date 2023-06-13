import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sparks/Screens/Intro/IntroPage1.dart';
import 'package:sparks/Screens/Intro/IntroPage2.dart';
import 'package:sparks/Screens/Intro/IntroPage3.dart';
import 'package:sparks/Screens/Intro/IntroPage4.dart';
import 'package:sparks/Screens/Intro/IntroPage5.dart';
import 'package:sparks/Screens/addDetails.dart';
import 'package:sparks/components/dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sparks/model/sharedprf.dart';

class OnBoardScreen extends StatefulWidget {
  SharedPreferences?prefs;
  String ?boolKey;
  OnBoardScreen({this.prefs, this.boolKey});
  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  bool onLastPage=false;
  @override
  Widget build(BuildContext context) {
    widget.prefs?.setBool(widget.boolKey!, true);
    final controller=PageController(
      initialPage:0,
    );
    return Scaffold(

      body: Stack(
       children:[
         PageView(
           controller: controller,
           onPageChanged: (index){
             setState(() {
               onLastPage=(index==4)?true:false;
             });
           },
           scrollDirection: Axis.horizontal,
           children: [
             IntroPage1(),
             IntroPage2(),
             IntroPage3(),
             IntroPage4(),
             IntroPage5(),
           ],
  
         ),
         Container(
           alignment: Alignment(0,0.75),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 //skip
                 onLastPage!=true ?
                 GestureDetector(
                      onTap:(){
                        controller.jumpToPage(3);
                      },
                      child: Text(">>",
                        style: TextStyle(fontWeight: FontWeight.w400,fontSize: 27),)
                 ):
                 GestureDetector(
                     onTap:(){

                     },
                     child: Text("")
                 ),

                 SmoothPageIndicator(controller: controller, count: 5),

                 //next
                 onLastPage ?
                 GestureDetector(
                     onTap:(){
                       // controller.jumpToPage(1);
                       showDialog(
                           context: context,
                           builder: (context) {
                             return CustomDialog(
                               onpressed: () {
                                 Navigator.push(
                                     context,
                                     MaterialPageRoute(
                                         builder: (context) =>
                                             AddCardDetails()))
                                     .then((value) => {});
                               },
                               title: "Welcome",
                               isSuccess: true,
                               description:
                               "Lets Get Started",
                               buttonText: "Ok",
                               addIcon: Icon(
                                 Icons.start,
                                 color: Colors.white,
                                 size: 30,
                               )
                             );});
                       // Navigator.push(
                       //     context,
                       //     MaterialPageRoute(
                       //         builder: (context) =>
                       //             AddCardDetails()))
                       //     .then((value) => {});
                     },
                     child: Text("Done",
                     style:TextStyle(fontSize: 22))
                 ):
                 GestureDetector(
                     onTap:(){
                       controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                     },
                     child: Text(">",
                     style: TextStyle(fontWeight: FontWeight.w400,fontSize: 27),)
                 ),
               ],
             )
         )
       ]
      )
    );
  }
}
