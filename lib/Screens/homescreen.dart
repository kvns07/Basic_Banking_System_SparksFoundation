// import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparks/model/operation.dart';
import 'package:sparks/Screens/transectionHIstroy.dart';
import 'package:sparks/components/constants.dart';
import 'package:sparks/model/cardData.dart';
import 'package:sparks/model/database.dart';
import 'package:sparks/Screens/addDetails.dart';
import 'package:sparks/Screens/transection.dart';
import 'package:sparks/model/atmCard.dart';
import 'package:sparks/Screens/History.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseHelper _dbhelper = new DatabaseHelper();
  String userName = "Hello! ";
  String ?avatar;
  String ?greeting;
  double ?currentBalance;int?currentCustomerId;String?currentUserCardNumeber,senderName;

  List<CardData> ?_list;

  int current = 0;

  @override
  void initState() {
    _list = CardData.cardDataList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    avatar= userName;
    return Scaffold(
      backgroundColor: mgBgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: mgDefaultPadding),
        ),
        title: Image.asset(
          'Assets/safepay.png',
          fit: BoxFit.fitWidth,
          width: 220.0,
          alignment: Alignment.bottomCenter,
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: mgDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Welcome",
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: Colors.black,
                        fontSize: 25,
                      )),
                  Text(userName,
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: mgBlackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      )),
                ],
              ),
            ),
            SizedBox(height: 20),

            //<<<<<<<<<<< ATM Card Section >>>>>>>>>>>>>>//
            Container(
              height: 199,
              child: FutureBuilder(
                initialData: [],
                future: _dbhelper.getUserDetails(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    padding:
                    const EdgeInsets.only(left: mgDefaultPadding, right: 6),
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() => {
                            userName = snapshot.data![index].userName,
                            avatar = snapshot.data![index].userName[0],
                            currentBalance=snapshot.data![index].totalAmount,
                            currentCustomerId= snapshot.data![index].id,
                            currentUserCardNumeber= snapshot.data![index].cardNumber,
                            senderName= snapshot.data![index].userName,
                          });
                        },
                        child: UserATMCard(
                          cardNumber: snapshot.data![index].cardNumber,
                          cardExpiryDate: snapshot.data![index].cardExpiry,
                          totalAmount: snapshot.data![index].totalAmount,
                          gradientColor: _list![index].mgPrimaryGradient,
                        ),
                      );
                    },

                  );
                },
              ),
            ),

            //Send Button....
            SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                width: 175, // <-- Your width
                height: 135,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: ElevatedButton.icon(
                      onPressed: (){
                        Navigator.push(context,
                          MaterialPageRoute(
                            builder: (_) => TransferMoney(
                              currentBalance:currentBalance??0.0,
                              currentCustomerId:currentCustomerId??0,
                              currentUserCardNumebr:currentUserCardNumeber??"",
                              senderName:senderName??"",
                            ),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(color: Colors.red)
                            )
                        ),
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.redAccent) ,
                      ),
                      icon: Icon(Icons.send),
                      label: Text(
                        "Send",
                        style: TextStyle(fontSize: 22),
                      )),
                ),
                SizedBox(
                  width: 155, // <-- Your width
                  height: 135,
                  child: ElevatedButton.icon(
                      onPressed: (){
                        Navigator.push(context,
                          MaterialPageRoute(
                            builder: (_) => AddCardDetails(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(color: Colors.greenAccent)
                            )
                        ),
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.greenAccent),
                      ),
                      icon: Icon(Icons.credit_card),
                      label: Text(
                        "Add Bank",
                        style: TextStyle(fontSize: 22),
                      )),
                ),
              ],
            ),
            // <<<<<<<<< Transaction Section >>>>>>>>>>>> //
            SizedBox(height:20),
            SizedBox(
              width: 340,
              height: 90,
              child: ElevatedButton.icon(onPressed:(){
                Navigator.push(
                  context,MaterialPageRoute(
                  builder: (_) => THistory(),
                )
                );
              }, style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: Colors.greenAccent)
                    )
                ),
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.blueAccent),
              ),
                icon: Icon(Icons.add_card),
                label: Text("Transaction Histroy",
                    style: TextStyle(fontSize: 22)),
              ),
            ),

          ],
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   shape: const CircularNotchedRectangle(),
      //   color: mgBlueColor,
      //   elevation: 15,
      //   child: Container(
      //     height: 50,
      //   ),
      // ),
    );
  }
}
