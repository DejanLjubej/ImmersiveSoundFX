import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
//import 'package:ads/ads.dart';


class DisplayBanner extends StatefulWidget {
  @override
  _DisplayBannerState createState() => new _DisplayBannerState();
}
class _DisplayBannerState extends State<DisplayBanner> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-6864369459139595~3414829771')
        .then((response) {
      myBanner
        ..load()
        ..show();
    });
    return new Scaffold(
        //body: Container(height: 50,),
        );
  }
}

MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: null,
  contentUrl: null,
 
  childDirected: false,
  
  testDevices: <String>[], // Android emulators are considered test devices
);
BannerAd myBanner = BannerAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  adUnitId:"ca-app-pub-6864369459139595/1627584310",
  size: AdSize.smartBanner,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);

