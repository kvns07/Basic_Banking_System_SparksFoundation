import 'package:flutter/material.dart';
class IntroPage2 extends StatelessWidget {
  const IntroPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.purpleAccent],
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Image.asset(
                'Assets/online.png',
                fit: BoxFit.fitWidth,
                width: 220.0,
                alignment: Alignment.bottomCenter,
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: <Widget>[
                    Text("Online",
                        style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w300,
                            color: Color(0XFF3F3D56),
                            height: 2.0)),
                    Text(
                      "Now do things Online",
                      style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 1.2,
                          fontSize: 16.0,
                          height: 1.3),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
