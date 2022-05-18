// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shopa/ui/account/dashboard.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffffff),
      appBar: AppBar(
        title: Text(
          'Mega Mill',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0.5,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          Icon(Icons.notifications),
          SizedBox(
            width: 15,
          ),
          Icon(Icons.shopping_cart),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Dashboard(),
    );
  }

  
}


