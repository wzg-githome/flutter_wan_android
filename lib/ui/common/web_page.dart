import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/custom/ace_app_bar.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

///webView
class WebPage extends StatefulWidget {
  const WebPage({Key? key, required this.url, this.title}) : super(key: key);

  final String? url;
  final String? title;

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  WebViewController? _controller;

  @override
  void dispose() {
    _controller?.clearCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAceAppBar(widget.title ?? "webView", onBackClick: () async {
        if (_controller != null) {
          if (await _controller!.canGoBack()) {
            _controller!.goBack();
          } else {
            Get.back();
          }
        }
      }),
      body: WebView(
        onWebViewCreated: (controller) {
          _controller = controller;
          // _controller.
        },
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        navigationDelegate: (mNavigationRequest) {
          ///可以根据url进行拦截
          return NavigationDecision.navigate;
        },
        onPageStarted: (url) async {
          // await SmartDialog.showToast("$url\n开始加载...");
        },
        onPageFinished: (url) async {
          // await SmartDialog.showToast("$url\n开始完毕!");
        },
        // onWebResourceError: (err){
        //
        // },
      ),
    );
  }
}
