import 'package:HT_ONE/Premium/Model/premiumModel.dart';
import 'package:flutter/material.dart';

import '../../Home/Controller/HomeScreen.dart';
import '../ViewModel/Premium_viewModel.dart';

class Premiumscreen extends StatefulWidget {
  @override
  _Premiumscreen createState() => _Premiumscreen();
}

class _Premiumscreen extends State<Premiumscreen> {
  late Future<PremiumResponse?> premiumData;

  @override
  void initState() {
    super.initState();
    premiumData = PremiumApiService().fetchPremiumData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HT ONE")),
      body: FutureBuilder<PremiumResponse?>(
        future: premiumData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || snapshot.data == null) {
            return const Center(child: Text("Failed to load data"));
          } else {
            final premiumResponse = snapshot.data!;
            return DrawHomeListView(premiumResponse: premiumResponse);
          }
        },
      ),
    );
  }
}

class DrawHomeListView extends StatelessWidget {
  const DrawHomeListView({
    super.key,
    required this.premiumResponse,
  });

  final PremiumResponse premiumResponse;

  @override
  Widget build(BuildContext context) {
    var sectionItems = premiumResponse.sectionItems;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderPremium(),
            HeaderWidget(newsItem: sectionItems.first),
            ListItemsWidget(items: sectionItems.sublist(1)),
          ],
        ),
      ),
    );
  }
}

class HeaderPremium extends StatelessWidget {
  const HeaderPremium({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(12),
        height: 30,
        width: double.infinity,
        child:
            const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("HT Premium",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w900,
                  color: Colors.blue),
              overflow: TextOverflow.ellipsis),
          SizedBox(height: 10),
          Icon(Icons.workspace_premium_sharp, color: Colors.blue)
        ]));
  }
}
