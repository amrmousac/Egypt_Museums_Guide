
import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';


import '../Models/flag_model.dart';

import '../utils/constants.dart';
import '../utils/fetch_flags_data.dart';
import '../widgets/museum_app_bar.dart';
import '../widgets/app_drawer.dart';

class FlagsScreen extends StatefulWidget {
  @override
  _FlagsScreenState createState() => _FlagsScreenState();
}
ScrollController list1;
ScrollController list2;
class _FlagsScreenState extends State<FlagsScreen> {
  final GlobalKey<InnerDrawerState> innerDrawerKey =
      GlobalKey<InnerDrawerState>();
  int index = 0;

  @override
  void initState() {
    list1 = ScrollController();
    list2 = ScrollController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppDrawer(
      innerDrawerKey: innerDrawerKey,
      drawerChild: Scaffold(
        backgroundColor: kGoldColor,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              museumAppBar(
                  context: context,
                  innerDrawerKey: innerDrawerKey,
                  title: 'أعلام مصر'),
              Expanded(
                child: FutureBuilder(
                    future: fetchFlagsData(context),
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        List<FlagModel> flags = snapshot.data;

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: ListWheelScrollView(
                            physics: BouncingScrollPhysics(),
                            controller: list1,
                            itemExtent: MediaQuery.of(context).size.width*0.5,

                            onSelectedItemChanged: (index) {
                              print(index);
                              setState(() {
                                list2.animateTo(index.toDouble(),duration: Duration(seconds: 1),curve: Curves.ease);
                              });
                            },
                            children: flags
                                .map(
                                  (m) => Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Image.asset(
                                          "assets/images/flags/${m.img}",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(m.era, style: TextStyle(fontWeight: FontWeight.bold),),
                                            Text(m.timePeriod),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                            )
                                .toList(),
                          ),
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Swiper(
//itemBuilder: (BuildContext context, int index) {
//return Image.asset(
//"assets/images/flags/${flags[index].img}",
//fit: BoxFit.scaleDown,
//);
//},
//itemCount: flags.length,
//viewportFraction: 0.75,
//scale: 0.8,
//scrollDirection: Axis.vertical,
//onIndexChanged: (currentIndex){
//setState(() {
//index = currentIndex;
//});
//
//},
//),
