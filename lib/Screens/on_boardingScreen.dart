import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sparks/Screens/Intro/IntroPage1.dart';
import 'package:sparks/Screens/Intro/IntroPage2.dart';
import 'package:sparks/Screens/Intro/IntroPage3.dart';
import 'package:sparks/Screens/addDetails.dart';
class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  bool onLastPage=false;
  @override
  Widget build(BuildContext context) {
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
               onLastPage=(index==2)?true:false;
             });
           },
           scrollDirection: Axis.horizontal,
           children: [
             IntroPage1(),
             IntroPage2(),
             IntroPage3(),
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
                      child: Text(">>")
                 ):
                 GestureDetector(
                     onTap:(){

                     },
                     child: Text("")
                 ),

                 SmoothPageIndicator(controller: controller, count: 3),

                 //next
                 onLastPage ?
                 GestureDetector(
                     onTap:(){
                       // controller.jumpToPage(1);
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (context) =>
                                   AddCardDetails()))
                           .then((value) => {});
                     },
                     child: Text("Done")
                 ):
                 GestureDetector(
                     onTap:(){
                       controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                     },
                     child: Text(">")
                 ),
               ],
             )
         )
       ]
      )
    );
  }
}
