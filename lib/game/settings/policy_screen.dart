import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

String gdsfgdfsg = '';
List<String> posgsdfgers = [];
List<bool> gfdgsdfg = [true, true];
bool dsaxasd = false;
String gdshfs = '';

class PolicyScreen extends StatelessWidget {
  final String pol;

  const PolicyScreen({super.key, required this.pol});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(pol),
          ),
        ),
      ),
    );
  }
}
