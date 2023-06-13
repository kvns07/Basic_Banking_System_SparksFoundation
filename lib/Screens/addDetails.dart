import 'package:sparks/model/database.dart';
import 'package:sparks/components/textfield.dart';
import 'package:sparks/components/dialog.dart';
import 'package:sparks/model/userData.dart';
import 'package:sparks/Screens/homescreen.dart';
import 'package:flutter/material.dart';

class AddCardDetails extends StatefulWidget {
  @override
  _AddCardDetailsState createState() => _AddCardDetailsState();
}

class _AddCardDetailsState extends State<AddCardDetails> {
  String?cardHolderName;
  String?cardNumber;
  String?cardExpiry;
  double?currentBalance;

  DatabaseHelper _dbhelper = new DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    String error="";
    return Scaffold(
      extendBodyBehindAppBar: true,
      // backgroundColor: Colors.red,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Card Details",
          style:const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontFamily: "serif",
              fontStyle:  FontStyle.normal,
              fontSize: 25.0
          ) ,
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.blue],
          ),
        ),
        child: Column(
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                child: Column(
                  children: [
                    Icon(
                      Icons.add_card,
                      size: 100,
                      color: Colors.black,
                    ),
                    CustomTextField(
                      hintName: "Enter cardholder name",
                      onChanged: (value) => {cardHolderName = value},
                      keyboardTypeNumber: false,
                    ),
                    CustomTextField(
                      hintName: "Enter card number",
                      onChanged: (value) => {cardNumber = value},
                      keyboardTypeNumber: false,
                    ),
                    CustomTextField(
                      hintName: "Enter card expiry date",
                      onChanged: (value) => {cardExpiry = value},
                      keyboardTypeNumber: false,
                    ),
                    CustomTextField(
                      hintName: "Enter current amount",
                      onChanged: (value) =>
                      {currentBalance = double.parse(value)},
                      keyboardTypeNumber: true,
                    ),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (cardHolderName != null &&
                              cardNumber != null &&
                              cardExpiry != null &&
                              currentBalance != null) {
                            UserData _userData = UserData(
                              userName: cardHolderName!,
                              cardNumber: cardNumber!,
                              cardExpiry: cardExpiry!,
                              totalAmount: currentBalance!,
                            );

                            await _dbhelper.insertUserDetails(_userData);

                            showDialog(
                                context: context,
                                builder: (context) {
                                  return CustomDialog(
                                    onpressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeScreen()))
                                          .then((value) => {});
                                    },
                                    title: "Card Details added",
                                    isSuccess: true,
                                    description:
                                    "",
                                    buttonText: "Ok",
                                    addIcon: Icon(
                                      Icons.credit_card,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                  );
                                });
                          } else if(cardHolderName == null||
                              cardNumber == null ||
                              cardExpiry == null ||
                              currentBalance == null){
                            setState(() {
                              error="Enter all fields please";
                            });
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return CustomDialog(
                                    onpressed: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             AddCardDetails()))
                                      //     .then((value) => {});
                                    },
                                    title: "Please fill all the fields",
                                    isSuccess: false,
                                    description:
                                    "",
                                    buttonText: "",
                                    addIcon: Icon(
                                      Icons.credit_card,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                  );
                                });
                            print("Fail to insert");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black, // Background color
                          onPrimary: Colors.amber,
                          shadowColor: Colors.amber,// Text Color (Foreground color)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(error),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
