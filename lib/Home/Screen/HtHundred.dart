import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

const HT100List = [
  {
    "tabTitle": "HT @100",
    "icon": Icons.newspaper,
    "url": "https://www.hindustantimes.com/100-years-of-hindustan-times/?platform=app",
  },
  {
    "tabTitle": "HT @100 Photo Contest",
    "icon": Icons.camera_alt_outlined,
    "url": "https://www.hindustantimes.com/100-years-of-hindustan-times/my-country-my-lens-photo-contest",
  },
];

class HT100 extends StatefulWidget {
  @override
  _HT100State createState() => _HT100State();
}

class _HT100State extends State<HT100> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<WebViewController> _controllers = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: HT100List.length, vsync: this);

    // Initialize WebViewControllers for each tab
    for (var tab in HT100List) {
      final controller = WebViewController()
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
        ..loadRequest(Uri.parse(tab["url"] as String));
      _controllers.add(controller);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HT @100"),
        bottom: TabBar(
          controller: _tabController,
          tabs: HT100List.map((tab) => Tab(
            text: tab["tabTitle"] as String,
            icon: Icon(tab["icon"] as IconData),
          )).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _controllers.map((controller) {
          return SizedBox.expand(
            child: WebViewWidget(controller: controller),
          );
        }).toList(),
      ),
    );
  }
}
