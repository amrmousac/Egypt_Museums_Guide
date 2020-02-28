import 'package:flutter/material.dart';

class CustomNavigation extends PageRouteBuilder{
   
   final Widget widget;

  CustomNavigation({this.widget}):super(
      transitionDuration: Duration(seconds: 1),
      transitionsBuilder:(BuildContext context,Animation<double> animation,Animation<double> secondAnimation,Widget widget){
        
        animation = CurvedAnimation(parent: animation, curve: Curves.easeOutBack);

        return ScaleTransition(scale: animation,alignment: Alignment.center,child: widget);
      },
      pageBuilder:(BuildContext context,Animation<double> animation,Animation<double> secondAnimation){
        return widget;
      }
  );
  
}