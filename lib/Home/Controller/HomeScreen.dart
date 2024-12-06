import 'package:HT_ONE/Home/Controller/CollectionWidget.dart';
import 'package:HT_ONE/Home/Controller/PickOfDayWidget.dart';
import 'package:flutter/material.dart';
import 'package:HT_ONE/Helper.dart';
import '../ViewModel/home_viewmodel.dart';
import '../Model/home_model.dart';
import 'InfographicsWidget.dart';
import 'CollectionWidget.dart';

class HomeScreen extends StatefulWidget {
@override
_HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  late Future<HomeResponse?> _homeData;

  @override
  void initState() {
    super.initState();
    _homeData = ApiService().fetchHomeData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HT ONE")),
      body: FutureBuilder<HomeResponse?>(
        future: _homeData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || snapshot.data == null) {
            return const Center(child: Text("Failed to load data"));
          } else {
            final homeResponse = snapshot.data!;
            return DrawHomeListView(homeResponse: homeResponse);
          }
        },
      ),
    );
  }
}

class DrawHomeListView extends StatelessWidget {
  const DrawHomeListView({
    super.key,
    required this.homeResponse,
  });
  final HomeResponse homeResponse;
  @override
  Widget build(BuildContext context) {
    var sectionItems = homeResponse.sectionItems;

    List<Widget> widgets = [];
    for (var entry in sectionItems.asMap().entries) {
      int index = entry.key;
      SectionItem sectionItem = entry.value;

      if (sectionItem.newsItems.isNotEmpty) {
        if (sectionItem.collectionType == CollectionType.pickOfTheDay) {
          widgets.addAll([
            Pickofdaywidget(item: sectionItem.newsItems.first),
            SizedBox(height: 18)
          ]);
        }
        if (sectionItem.collectionType == CollectionType.infographics) {
          // if (index > 0) {
          //   widgets.add(SizedBox(height: 5));
          // }
          widgets.addAll([
            InfographicsWidget(sectionItem: sectionItem),
            SizedBox(height: 18)
          ]);
        } else if (sectionItem.collectionType == CollectionType.premium) {
          widgets.addAll([
            Collectionwidget(sectionItem: sectionItem),
            SizedBox(height: 18)
          ]);
        } else if (sectionItem.collectionType == CollectionType.economist) {
          widgets.addAll([
            Collectionwidget(sectionItem: sectionItem),
            SizedBox(height: 18)
          ]);
        } else {
          if (index > 0) {
            widgets.addAll([
              SectionSeparator(),
              SizedBox(height: 18,)]);
          }
          if (sectionItem.blockName != "") {
            widgets.add(
                Padding(
                  padding: EdgeInsets.only(left: 12, bottom: 12),
                  child: Text(sectionItem.blockName, style: TextStyle(
                      color: Color.fromRGBO(33, 33, 33, 1),
                      fontSize: 20,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w900)),
                )
            );
          }
          widgets.addAll([
            HeaderWidget(newsItem: sectionItem.newsItems.first),
            ListItemsWidget(items: sectionItem.newsItems.sublist(1)),
            SizedBox(height: 18,)]);
        }
      }
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widgets
        ),
      ),
    );
  }
}

class SectionSeparator extends StatelessWidget {
  const SectionSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12),
      height: 2,
      width: double.infinity,
      color: Color.fromRGBO(33, 33, 33, 1),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  final NewsItem newsItem;

  const HeaderWidget({
    Key? key,
    required this.newsItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    // Calculate the height of the image based on the width
    double imageHeight = screenWidth * 0.56;

    return Container(
      height: imageHeight, // Height of the header
      width: double.infinity,
      margin: EdgeInsets.only(left: 12, right: 12),// Full width
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0), // Apply corner radius here
        image: DecorationImage(
          image: NetworkImage(newsItem.wallpaperLarge), // Background image from model
          fit: BoxFit.cover, // Cover the entire container
        ),
      ),
      child: Container(
        // Overlay with gradient
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0), // Apply corner radius here
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.7), // Dark gradient at the bottom
            ],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end, // Align to bottom
          children: [
            // Title (max 3 lines)
            Text(
              newsItem.headline,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: "Lato",
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            // Description
            Row(
              children: [
                Text(
                  newsItem.section.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 10,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(238, 238, 238, 1),
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  HelperUtils.getTimeRead(newsItem.timeToRead),
                  style: const TextStyle(
                    fontSize: 10,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(238, 238, 238, 1),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class ListItemsWidget extends StatefulWidget {
  final List<NewsItem> items;

  const ListItemsWidget({Key? key, required this.items}) : super(key: key);

  @override
  State<ListItemsWidget> createState() => ListItemsWidgetState();
}
class ListItemsWidgetState extends State<ListItemsWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var item in widget.items)
          ListItemWidget(newsItem: item, timeToRead: HelperUtils.getTimeRead(item.timeToRead)),
      ],
    );
  }
}
class ListItemWidget extends StatelessWidget {
  final NewsItem newsItem;
  final String timeToRead;

  const ListItemWidget({
    Key? key,
    required this.newsItem,
    required this.timeToRead
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double imageHeight = 62;
    double imageWidth = imageHeight * 1.33;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Row(
        children: [
          // Text Column: Title and Description (left-aligned)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  newsItem.headline,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(34, 34, 34, 1),
                    letterSpacing: 0.2,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      newsItem.section.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 10,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w900,
                        color: Color.fromRGBO(102, 102, 102, 1),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(width: 12),
                    Text(
                      timeToRead,
                      style: const TextStyle(
                        fontSize: 10,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(102, 102, 102, 1),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 16), // Space between text and image
          // Image (right-aligned)
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0), // Rounded corners

            child: Image.network(
              newsItem.wallpaperLarge,
              height: imageHeight,
              width: imageWidth,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
