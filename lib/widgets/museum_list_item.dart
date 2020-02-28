import 'package:flutter/material.dart';
import 'package:museums_guide/utils/constants.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:auto_size_text/auto_size_text.dart';

class MuseumListItemRight extends StatelessWidget {
  const MuseumListItemRight({
    Key key,
    this.museumName,
    this.museumImage,
    this.museumGovernorate
  });

  final String museumName;
  final String museumImage;
  final String museumGovernorate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: ShapeOfView(
            elevation: 0,
            shape: DiagonalShape(
                position: DiagonalPosition.Right,
                direction: DiagonalDirection.Right,
                angle: DiagonalAngle.deg(angle: 20)),
            child: Image.network(
              museumImage,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: buildAutoSizeText(museumName,museumGovernorate),
        ),
      ],
    );
  }
}

class MuseumListItemLeft extends StatelessWidget {
  const MuseumListItemLeft({
    Key key,
    this.museumName,
    this.museumImage,
    this.museumGovernorate,
  });

  final String museumName;
  final String museumImage;
  final String museumGovernorate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: buildAutoSizeText(museumName,museumGovernorate),
        ),
        Expanded(
          flex: 3,
          child: ShapeOfView(
            elevation: 0,
            shape: DiagonalShape(
                position: DiagonalPosition.Left,
                direction: DiagonalDirection.Left,
                angle: DiagonalAngle.deg(angle: 20)),
            child: Hero(
              tag: museumName,
                          child: Image.network(
                museumImage,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget buildAutoSizeText(String museumName, String museumGovernorate) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
                child: AutoSizeText(
            museumName,
            style: TextStyle(fontSize: 32,color: kDarkBlueColor,fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
                child: AutoSizeText(
            museumGovernorate,
            style: TextStyle(fontSize: 16,color: kLightBlueColor),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}
