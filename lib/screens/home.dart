import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';

import '../widgets/app_drawer.dart';
import '../widgets/museum_app_bar.dart';
import '../utils/fetch_museums_data.dart';
import '../widgets/museums_banner.dart';
import '../utils/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['travel', 'fly', 'museum'],
    testDevices: <String>[],
  );

  BannerAd myBanner = BannerAd(
    adUnitId: BannerAd.testAdUnitId,
    size: AdSize.smartBanner,
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event) {
      print("BannerAd event is $event");
    },
  );
  

  @override
  void initState() {

    FirebaseAdMob.instance.initialize(appId: BannerAd.testAdUnitId);
    myBanner
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
      );
    super.initState();
  }

  @override
  void dispose() {
    myBanner.dispose();

    super.dispose();
  }
final GlobalKey<InnerDrawerState> innerDrawerKey = GlobalKey<InnerDrawerState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlueColor,
      body: SafeArea(
        child: AppDrawer(
          innerDrawerKey: innerDrawerKey,
                  drawerChild: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [kGoldColor, kLightGoldColor],
              begin: Alignment.topRight,
              end: Alignment.topLeft,
            )),
            child: Column(
              children: <Widget>[
                museumAppBar(context:context,innerDrawerKey:innerDrawerKey,title: 'دَلِيلٌ الْمَتاحِف الْمِصْرِيَّة'),

                Expanded(
                  child: StreamBuilder(
                    stream: Connectivity().onConnectivityChanged,

                    builder: (BuildContext context, AsyncSnapshot snapshot) {

                      if (!snapshot.hasData ||
                          snapshot.hasError ||
                          snapshot.data == ConnectivityResult.none) {
                        return Text('No Internet');


                      } else {
                        return FutureBuilder(

                          future: fetchMuseumsData(context),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.data == null) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              return MuseumsBanner(data: snapshot.data);
                            }
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}
