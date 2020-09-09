import 'package:flutter/material.dart';

import 'dart:ui';
import 'dart:math';

class ButtonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            _appBg(),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[_titles(), _roundedButtons()],
              ),
            ),
          ],
        ),
        bottomNavigationBar: _bottomNavigationBar(context));
  }

  Widget _appBg() {
    final gradient = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(52, 54, 101, 1.0),
        Color.fromRGBO(35, 37, 57, 1.0)
      ], begin: FractionalOffset(0.0, 0.6), end: FractionalOffset(0.0, 1.0))),
    );

    final pinkBox = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(236, 98, 188, 1.0),
            Color.fromRGBO(241, 142, 172, 1.0)
          ]),
          borderRadius: BorderRadius.circular(80.0),
        ),
      ),
    );

    return Stack(
      children: <Widget>[
        gradient,
        Positioned(top: -100.0, left: -50.0, child: pinkBox),
      ],
    );
  }

  Widget _titles() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10.0),
            Text('Classify transaction',
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10.0),
            Text('Classify transaction into a particular category',
                style: TextStyle(fontSize: 18.0, color: Colors.white))
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return Theme(
      /** 
          *******************************
          Todo este código de aquí es para personalizar a mi gusto la bottom 
          navigation bar 
      */
      data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
          primaryColor: Colors.pinkAccent,
          textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0)))),
      child: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, size: 30.0), title: Container()),
        BottomNavigationBarItem(
            icon: Icon(Icons.bubble_chart, size: 30.0), title: Container()),
        BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle, size: 30.0),
            title: Container()),
      ]),
    );
  }

  Widget _roundedButtons() {
    return Table(
      children: <TableRow>[
        TableRow(children: <Widget>[
          _createRoundedButton(Colors.blue, Icons.swap_calls, 'Llamadas'),
          _createRoundedButton(Colors.green, Icons.bubble_chart, 'Burbujas'),
        ]),
        TableRow(children: <Widget>[
          _createRoundedButton(Colors.yellow, Icons.ac_unit, 'Frío'),
          _createRoundedButton(
              Colors.purple, Icons.youtube_searched_for, 'Lupa'),
        ]),
        TableRow(children: <Widget>[
          _createRoundedButton(Colors.red, Icons.volume_down, 'Volumen'),
          _createRoundedButton(
              Colors.brown, Icons.account_balance_wallet, 'Cartera'),
        ]),
      ],
    );
  }

  Widget _createRoundedButton(Color color, IconData iconData, String text) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
        child: Container(
          height: 180.0,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(62, 66, 107, 0.7),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                height: 5.0,
              ),
              CircleAvatar(
                backgroundColor: color,
                radius: 35.0,
                child: Icon(
                  iconData,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
              Text(
                text,
                style: TextStyle(color: color),
              ),
              SizedBox(
                height: 5.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
