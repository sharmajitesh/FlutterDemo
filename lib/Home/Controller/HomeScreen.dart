import 'package:flutter/material.dart';
import 'package:HT_ONE/Helper.dart';
import '../ViewModel/home_viewmodel.dart';
import '../Model/home_model.dart';

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
      appBar: AppBar(title: const Text("HT One")),
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
    var firstNews = homeResponse.sectionItems[0].newsItems;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget(newsItem: firstNews.first),
            ListItemsWidget(items: firstNews.sublist(1)),
          ],
        ),
      ),
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
      width: double.infinity, // Full width
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(newsItem.wallpaperLarge), // Background image from model
          fit: BoxFit.cover, // Cover the entire container
        ),
      ),
      child: Container(
        // Overlay with gradient
        decoration: BoxDecoration(
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
              newsItem.thumbImage,
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
