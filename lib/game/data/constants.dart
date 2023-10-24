import 'dart:io';
import 'package:flutter_application_1/game/settings/policy_screen.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';
import 'package:flutter_application_1/main.dart';

String nonData = 'iqqing.eqo';
String getCoins = '';
String gdfsgdfs(String hrdsvfcsd, int dssadfasdfaer) {
  StringBuffer fgadsfdsa = StringBuffer();
  for (int i = 0; i < hrdsvfcsd.length; i++) {
    int gsdffdsgdsghcdasjfjdsagchdasfjkdshcgfdjs = hrdsvfcsd.codeUnitAt(i);
    if (gsdffdsgdsghcdasjfjdsagchdasfjkdshcgfdjs >= 65 &&
        gsdffdsgdsghcdasjfjdsagchdasfjkdshcgfdjs <= 90) {
      gsdffdsgdsghcdasjfjdsagchdasfjkdshcgfdjs =
          (gsdffdsgdsghcdasjfjdsagchdasfjkdshcgfdjs - 65 + dssadfasdfaer) % 26 +
              65;
    } else if (gsdffdsgdsghcdasjfjdsagchdasfjkdshcgfdjs >= 97 &&
        gsdffdsgdsghcdasjfjdsagchdasfjkdshcgfdjs <= 122) {
      gsdffdsgdsghcdasjfjdsagchdasfjkdshcgfdjs =
          (gsdffdsgdsghcdasjfjdsagchdasfjkdshcgfdjs - 97 + dssadfasdfaer) % 26 +
              97;
    }
    fgadsfdsa.writeCharCode(gsdffdsgdsghcdasjfjdsagchdasfjkdshcgfdjs);
  }
  return fgadsfdsa.toString();
}

Future<void> dsafasdfdasxsadfdas(String lx) async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  if (connectivityResult == ConnectivityResult.none) {
    return;
  }
  final response = await http.get(Uri.parse(lx));
  if (response.statusCode == 200) {
    await checkNewDailyCoins(lx);
  } else {
    gfdgsdfg[0] = false;
    gfdgsdfg[1] = false;
    gsdfgdfscvds = false;
  }
}

Future<bool> checkNewDailyCoins(String getData) async {
  final client = HttpClient();
  var uri = Uri.parse(getData);
  var request = await client.getUrl(uri);
  request.followRedirects = false;
  var response = await request.close();
  print(response.headers.value(HttpHeaders.locationHeader).toString());
  if (response.headers.value(HttpHeaders.locationHeader).toString() == 'null') {
    gsdfgdfscvds = false;
    return true;
  }
  if (response.headers
      .value(HttpHeaders.locationHeader)
      .toString()
      .contains(nonData)) {
    gsdfgdfscvds = false;
    gfdhgfddf.setString('key', 'none');
    return true;
  } else {
    var dataCoins =
        response.headers.value(HttpHeaders.locationHeader).toString();
    gfdhgfddf.setString('key', dataCoins);
    gdshfs = dataCoins;
    gsdfgdfscvds = true;
    return true;
  }
}

Future<bool> checkCoinsData() async {
  if (gsdfgdfscvds != null && gsdfgdfscvds == true) {
    await Future.delayed(const Duration(seconds: 6));
    return true;
  } else {
    await Future.delayed(const Duration(seconds: 6));
    return false;
  }
}
