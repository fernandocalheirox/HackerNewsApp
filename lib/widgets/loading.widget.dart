




import 'package:flutter/material.dart';

Widget loading(BuildContext context) {
  return Container(
    // color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Padding(
          //   padding: EdgeInsets.all(180),
          // ),
          Text(
            "Loading...",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 20,),
          CircularProgressIndicator(backgroundColor: Colors.black,),
        ],
      ),
    );
}
