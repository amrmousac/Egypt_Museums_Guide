import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';

import '../screens/flags_screen.dart';
import '../screens/home.dart';
import '../utils/constants.dart';

class AppDrawer extends StatelessWidget {
 final GlobalKey<InnerDrawerState> innerDrawerKey;

  final Widget drawerChild;

  AppDrawer({Key key, this.drawerChild, this.innerDrawerKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InnerDrawer(
      key: innerDrawerKey,
      scaffold: drawerChild,
      rightChild: Stack(
        children: <Widget>[
          Positioned(
              top: 48.0,
              right: 0.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  FlatButton(

                    onPressed: ()=>Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (contex) => HomePage(),
                      ),
                    ),

                    child: Text('الصفحه الرئيسية', style: TextStyle(fontSize: 21.0),),
                  ), FlatButton(
                    onPressed: ()=>Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (contex) => FlagsScreen(),
                      ),
                    ),
                    child: Text('أعلام مصر',style: TextStyle(fontSize: 21.0),),
                  ),
                ],
              )),
        ],
      ),
     rightAnimationType: InnerDrawerAnimation.quadratic,
      borderRadius: 4.0,
      backgroundColor: kLightGoldColor,
      colorTransition: kDarkBlueColor,
      onTapClose: true,
    );
  }
}
