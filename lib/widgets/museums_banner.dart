import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../utils/constants.dart';
import 'museum_list_item.dart';
import '../Models/data_model.dart';
import '../screens/museum_details.dart';

class MuseumsBanner extends StatefulWidget {
MuseumsBanner({ this.data});
final data;

  @override
  _MuseumsBannerState createState() => _MuseumsBannerState(data: data);
}

class _MuseumsBannerState extends State<MuseumsBanner> {
  List<DataModel> data ;
  List<DataModel> _displayedData = List<DataModel>();

  _MuseumsBannerState({this.data});

  @override
  void initState() {
    super.initState();
    
    _displayedData = data;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        TextField(
          cursorColor: kDarkBlueColor,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
          autofocus: false,
          decoration: InputDecoration(
              hintText: '...البحث عن متحف',
              suffixIcon: Icon(
                Icons.search,
                color: kDarkBlueColor,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kDarkBlueColor,
                ),
              )),
          onChanged: (text) {
            setState(() {
              _displayedData = data.where((model) {
                String name = model.name;
                return name.contains(text);
              }).toList();
            });
          },
        ),
        Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: _displayedData.length + 1,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MuseumDetails(data: _displayedData[index]),
                      ));
                },
                child: index == _displayedData.length
                    ? SizedBox(
                        height: 60.0,
                      )
                    : Container(
                        height: screenWidth * 0.36,
                        child: index % 2 == 0
                            ? MuseumListItemLeft(
                                museumImage: _displayedData[index].image,
                                museumName: _displayedData[index].name,
                                museumGovernorate:
                                    _displayedData[index].governorate,
                              )
                            : MuseumListItemRight(
                                museumImage: _displayedData[index].image,
                                museumName: _displayedData[index].name,
                                museumGovernorate:
                                    _displayedData[index].governorate,
                              )),
              );
            },
          ),
        ),
      ],
    );
  }
}

// scale: 0.8,
// viewportFraction: 0.8,
// onTap: (index) {
//   Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) =>
//             MuseumDetails(data: _displayedData[index]),
//       ));
// },
// onIndexChanged: (index) {
//   setState(() {
//     _nameIndex = index;
//   });
// },
//index: 0,
