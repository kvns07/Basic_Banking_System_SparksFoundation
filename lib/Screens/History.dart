import 'package:flutter/material.dart';
import 'package:sparks/model/database.dart';
import 'package:sparks/Screens/transectionHIstroy.dart';
import 'package:sparks/components/constants.dart';
class THistory extends StatefulWidget {
  const THistory({Key? key}) : super(key: key);

  @override
  State<THistory> createState() => _THistoryState();
}

class _THistoryState extends State<THistory> {
  DatabaseHelper _dbhelper = new DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        "Transacion Histroy",
        style:const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontStyle:  FontStyle.normal,
            fontSize: 25.0
        ) ,
      ),
      centerTitle: true,
    ),

      body:Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 70,),
              FutureBuilder(
                initialData: [],
                future: _dbhelper.getTransectionDetatils(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: mgDefaultPadding),
                    itemBuilder: (context, index) {
                      return TransactionHistroy(
                        isTransfer: true,
                        customerName: snapshot.data![index].userName,
                        transferAmount: snapshot.data![index].transectionAmount,
                        senderName: snapshot.data![index].senderName,
                        avatar: snapshot.data![index].userName[0],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      )
    );
  }
}

