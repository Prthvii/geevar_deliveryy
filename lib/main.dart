import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:spicy_food_delivery/api/sendNotificationToken.dart';

import 'Screens/Splash.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  FirebaseMessaging messaging;
  bool _enableConsentButton = false;
  String externalUserId = "";
  String _homeScreenText = "Waiting for token...";
  String _debugLabelString;
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Geevar Rider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
      ),
      home: SplashScreen(),
    );
  }

  void initPlatformState() async {
    print(
        "---------------------------------------------------------------------------");
    OneSignal.shared.setAppId(
      '2830aaa3-bbef-4e21-b34d-4d71a6cd9733',
    );

    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    bool requiresConsent = await OneSignal.shared.requiresUserPrivacyConsent();
    final status = await OneSignal.shared.getDeviceState();
    final String osUserID = status?.userId;
    print("`````````````````````````osUserID`````````````````````````");
    print(osUserID);
    print("``````````````````````````osUserID``````````````````````````");

    var sendToken = await sendNotiTokenApi(osUserID.toString());
    print("tokenadichh");
    print(sendToken);
    setState(() {
      _homeScreenText = "Push Messaging token: $osUserID";
    });
    print(_homeScreenText);

    this.setState(() {
      _enableConsentButton = requiresConsent;
    });
  }
}
