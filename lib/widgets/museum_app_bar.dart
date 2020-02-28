import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';

import '../utils/constants.dart';
ShapeOfView museumAppBar({BuildContext context,GlobalKey<InnerDrawerState> innerDrawerKey,String title,Widget leading}) {
    return ShapeOfView(
      shape: ArcShape(
          direction: ArcDirection.Outside,
          height: 30,
          position: ArcPosition.Bottom),
      elevation: 10.0,
      height: 96,
      width: MediaQuery.of(context).size.width,
      child: Container(
        color: kDarkBlueColor,
        child: ListTile(
              title: AutoSizeText(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kGoldColor,
              fontFamily: 'ReemKufi',
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
          leading: SizedBox(),
          trailing: IconButton(icon: Icon(Icons.view_headline,color: kGoldColor,), onPressed: (){
           innerDrawerKey.currentState.open();
          }),
        ),
      ),
    );
  }