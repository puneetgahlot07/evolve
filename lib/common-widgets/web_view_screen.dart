import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewScreen extends StatelessWidget {
  final String? url;
  final String? appBarTitle;

  const WebViewScreen({Key? key, this.url, this.appBarTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            WebviewScaffold(
              url: url ?? '',
              resizeToAvoidBottomInset: true,
              appBar: buildAppBar(context),
              withZoom: true,
              withLocalStorage: true,
              hidden: false,
              initialChild: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          ],
        )
      );
    });
  }

  AppBar buildAppBar(BuildContext context) => AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          appBarTitle ?? '',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.black),
        ),
      );
}
