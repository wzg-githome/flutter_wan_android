import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android/custom/ace_app_bar.dart';
import 'package:flutter_wan_android/custom/will_po_scope_view.dart';
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

  double loadingProgress = 1;

  @override
  void dispose() {
    // _controller?.clearCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAceAppBar(widget.title ?? "webView", onBackClick: () async {
        if (_controller != null) {
          if (await _controller!.canGoBack()) {
            await _controller!.goBack();
          } else {
            Get.back();
          }
        }
      }),
      body: WillPoScopeView(
        quitFunction: () async {
          if (_controller != null) {
            if (await _controller!.canGoBack()) {
              await _controller!.goBack();
              return false;
            }
          }
          // SmartDialog.showToast("退出webView返回上一个节面");
          return true;
        },
        child: Column(
          children: [
            LinearProgressIndicator(
              value: loadingProgress,
              valueColor: const AlwaysStoppedAnimation(Colors.blue),
              backgroundColor: Colors.white,
            ),
            Expanded(
                child: WebView(
              onWebViewCreated: (controller) {
                _controller = controller;
              },
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              onProgress: (value) {
                setState(() {
                  if (value >= 1) {
                    loadingProgress = value / 100;
                  }
                  LogUtil.d("progress: $value");
                });
              },
              navigationDelegate: (mNavigationRequest) {
                ///可以根据url进行拦截
                return NavigationDecision.navigate;
              },
              onPageStarted: (url) async {
                setState(() {
                  loadingProgress=1;
                });
                // await SmartDialog.showToast("$url\n开始加载...");
              },
              onPageFinished: (url) async {
                // await SmartDialog.showToast("$url\n开始完毕!");
              },
              // onWebResourceError: (err){
              //
              // },
            ))
          ],
        ),
      ),
    );
  }
}
