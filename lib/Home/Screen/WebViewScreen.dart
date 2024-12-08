import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'BaseScreen.dart';



class WebViewScreen extends BaseScreen {
  String webUrl;
  int position;
  WebViewScreen({super.key, required this.webUrl, required this.position});

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> with SingleTickerProviderStateMixin {

  late WebViewController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize WebViewControllers for each tab

    _controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              debugPrint('Loading progress: $progress%');
            },
            onPageStarted: (String url) {
              debugPrint('Page started loading: $url');
            },
            onPageFinished: (String url) {
              debugPrint('Page finished loading: $url');
            },
            onHttpError: (HttpResponseError error) {
              debugPrint('HTTP error: ${error.response}');
            },
            onNavigationRequest: (NavigationRequest request) {
              if (request.url.startsWith('https://www.youtube.com/')) {
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
          ),
        )
        ..loadRequest(Uri.parse(widget.webUrl));


  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: WebViewWidget(controller: _controller),
    );
  }
}
