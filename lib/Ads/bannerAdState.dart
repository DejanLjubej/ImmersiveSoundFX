//import 'package:ads/ads.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';


class DisplayBanner extends StatefulWidget {
  @override
  _DisplayBannerState createState() => new _DisplayBannerState();
}

class _DisplayBannerState extends State<DisplayBanner> {
  int _sizeOfBannerSpaceFlex=1;
  int sizeOfBannerSpaceWhithAd;
  int sizeOfBannerSpaceWithoutAd = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    (MediaQuery.of(context).size.height * 0.1).floor();
    FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-3940256099942544~3347511713')
        .then((response) {
      myBanner
        ..load()
        ..show();
      sizeOfBannerSpaceWhithAd=
      _sizeOfBannerSpaceFlex = sizeOfBannerSpaceWhithAd;
    });
    return Expanded(
        flex: _sizeOfBannerSpaceFlex,
        child: Container(
          child: new Scaffold(
            body: FutureBuilder(
              future: myBanner.isLoaded(),
              builder: (context, snap) {
                if (snap.data == true) {
                  _sizeOfBannerSpaceFlex =
                      sizeOfBannerSpaceWhithAd;
                  return Container(
                    color: Color.fromARGB(255, 57, 62, 70),
                  );
                } else {
                  _sizeOfBannerSpaceFlex = sizeOfBannerSpaceWithoutAd;
                  return Container(
                    color: Color.fromARGB(0, 0, 0, 0),
                  );
                }
              },
            ),
          ),
        ));
  }
}

MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: null,
  contentUrl: null,

  childDirected: false,

  testDevices: <String>[
    ""
  ], // Android emulators are considered test devices
);
BannerAd myBanner = BannerAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  adUnitId: "ca-app-pub-3940256099942544/6300978111",
  size: AdSize.banner,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    //print("BannerAd event is $event");
  },
);
