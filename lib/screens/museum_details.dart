import 'dart:async';

import 'package:flutter/material.dart';
import '../Models/data_model.dart';
import '../utils/constants.dart';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MuseumDetails extends StatefulWidget {
  final DataModel data;

  const MuseumDetails({this.data});

  @override
  _MuseumDetailsState createState() => _MuseumDetailsState();
}

class _MuseumDetailsState extends State<MuseumDetails> {
  Completer<GoogleMapController> _controller = Completer();

  static final targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['travel', 'fly', 'museum'],
    testDevices: <String>[],
  );

  InterstitialAd myInterstitial = InterstitialAd(
    adUnitId: InterstitialAd.testAdUnitId,
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event) {
      print("InterstitialAd event is $event");
    },
  );

  @override
  void initState() {
    myInterstitial
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
      );
    super.initState();
  }

  @override
  void dispose() {
    myInterstitial.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlueColor,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.width * 0.75,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(widget.data.name,
                  style: TextStyle(
                      shadows: [
                        Shadow(
                          color: kGoldColor,
                          blurRadius: 5.0,
                        )
                      ],
                      fontFamily: 'ReemKufi',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w900,
                      color: kDarkBlueColor)),
              background: Image.network(
                  widget.data.image,
                  fit: BoxFit.fill,
                ),
            ),
          ),
          SliverList(
            
            delegate: SliverChildListDelegate(

              <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        child: titledText(
                            title: 'نوع المتحف',
                            txt: widget.data.museumType)),
                    Expanded(
                        child: titledText(
                            title: 'المحافظة',
                            txt: widget.data.governorate)),
                  ],
                ),
                titledText(title: 'عنوان المتحف', txt: widget.data.address),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 2,
                  child: GoogleMap(
                    
                    mapType: MapType.hybrid,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(widget.data.location.lat, widget.data.location.long),
                      zoom: 14.4746,
                    ),
                    markers: {
                      Marker(
                        markerId: MarkerId(widget.data.name),
                        position: LatLng(widget.data.location.lat, widget.data.location.long),
                      )
                    },
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
                titledText(title: 'تليفون', txt: widget.data.phone),
                titledText(title: 'فاكس', txt: widget.data.fax),
                titledText(
                    title: 'متاح للزيارة',
                    txt: widget.data.isAvailableToVisit),
                titledText(
                    title: 'مواعيد الزيارة', txt: widget.data.visitDates),
                titledText(
                    title: 'اسعار التذاكر', txt: widget.data.ticketPrices),
                titledText(
                    title: 'توصيف المتحف\n', txt: widget.data.description),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget titledText({String title, String txt}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: RichText(
        textDirection: TextDirection.rtl,
        text: new TextSpan(
          style: TextStyle(fontFamily: 'Changa'),
          children: <TextSpan>[
            TextSpan(
                text: ' $title: ',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w900,
                  color: kGoldColor,
                )),
            TextSpan(
                text: '$txt',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: kLightGoldColor)),
          ],
        ),
      ),
    );
  }
}
