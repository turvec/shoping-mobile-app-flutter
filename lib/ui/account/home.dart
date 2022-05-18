import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:shopa/ui/account/dashboard.dart';
import 'package:shopa/ui/account/shop.dart';

class Home extends StatefulWidget {

  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget>  _children = [Dashboard(), Shop(), Text('Account'),  Text('settings')];
  int index = 0;

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text(''),),
           bottomNavigationBar: SnakeNavigationBar.color(
             onTap: (_index) {
               setState(() {
                 index = _index;
               });
             },
             currentIndex: index,
             showUnselectedLabels: true,
            //  snakeShape: SnakeShape.rectangle,
             behaviour: SnakeBarBehaviour.floating,
             elevation: 10,
             items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
                BottomNavigationBarItem(icon: Icon(Icons.account_balance), label: 'Account'),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'settings'),
              ],
           ),
           body: _children[index],
       );
  }
}