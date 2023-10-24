import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/game/data/constants.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'game/dataParams/constants.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:dio/dio.dart';
import 'game/music.dart';
import 'game/previewScreen/PreviewScreen.dart';
import 'game/settings/con.dart';
import 'game/settings/policy_screen.dart';
import 'game/settings/privx.dart';

bool? gsdfgdfscvds;
String cxdasdsa = '';

var _inited = false;
late final SharedPreferences gfdhgfddf;
final inAppReview = InAppReview.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  gfdhgfddf = await SharedPreferences.getInstance();
  Constants.fasdfdas = cprtg(Constants.fasdfdas, Constants.off);
  sadfads = (cprtg(sadfads, -9));
  String nax = gfdhgfddf.getString('key') ?? '';

  if (nax.toString() != 'null' || nax.toString() != 'none') {
    gsdfgdfscvds = true;
    gdshfs = nax;
  }
  nonData = gdfsgdfs(nonData, -2);
  await initilize();

  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  OneSignal.shared.setAppId("74f4de5c-ea33-4d30-b2f5-f3406de80766");
  OneSignal.shared
      .promptUserForPushNotificationPermission()
      .then((accepted) {});
  await Future.delayed(const Duration(seconds: 2));
  reviewApp();
  runApp(MyApp());
}

Dio dio = Dio();
Future<bool> initilize() async {
  _inited = true;
  await dsafasdfdasxsadfdas(sadfads);

  if (gfdgsdfg[0] && gfdgsdfg[1]) return false;
  return false;
}

Future<void> reviewApp() async {
  bool gfdsgfdsfds = gfdhgfddf.getBool('sgfdsdcas') ?? false;
  if (!gfdsgfdsfds) {
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
      await gfdhgfddf.setBool('sgfdsdcas', true);
    }
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final audioControl = AudioControl();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 56, 13, 64),
      body: Center(
        child: FutureBuilder<bool>(
          future: checkCoinsData(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return OrientationBuilder(builder: (context, orientation) {
                if (orientation == Orientation.landscape) {
                  return Container(
                    height: ParamsAxis(context).height,
                    width: ParamsAxis(context).width,
                    child: Image.asset(
                      'assets/images/bg/bgPreviewHorizontal.png',
                      fit: BoxFit.fill,
                    ),
                  );
                } else {
                  return Container(
                    height: ParamsAxis(context).height,
                    width: ParamsAxis(context).width,
                    child: Image.asset(
                      'assets/images/bg/bgPreview.png',
                      fit: BoxFit.fill,
                    ),
                  );
                }
              });
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return OrientationBuilder(builder: (context, orientation) {
                if (orientation == Orientation.landscape) {
                  return Container(
                    height: ParamsAxis(context).height,
                    width: ParamsAxis(context).width,
                    child: Image.asset(
                      'assets/images/bg/bgPreviewHorizontal.png',
                      fit: BoxFit.fill,
                    ),
                  );
                } else {
                  return Container(
                    height: ParamsAxis(context).height,
                    width: ParamsAxis(context).width,
                    child: Image.asset(
                      'assets/images/bg/bgPreview.png',
                      fit: BoxFit.fill,
                    ),
                  );
                }
              });
            } else if (snapshot.data == true) {
              return ShowDailyRewards(rewardCoinsAmount: gdshfs);
            } else if (snapshot.data == false) {
              return PreviewScreenGame();
            } else {
              return PreviewScreenGame();
            }
          },
        ),
      ),
    );
  }
}
