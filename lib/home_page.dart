import 'package:flutter/material.dart';
import 'model.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HT One',
      //test commit
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ScrollableListViewDemo(),
    );
  }
}
class ScrollableListViewDemo extends StatelessWidget {
  final List<NewsItem> items = [
    NewsItem(
      title: 'Apple',
      description: 'A sweet red fruit.',
      imageUrl: 'https://via.placeholder.com/50',
    ),
    NewsItem(
      title: 'Banana',
      description: 'A long yellow fruit.',
      imageUrl: 'https://via.placeholder.com/50',
    ),
    NewsItem(
      title: 'Cherry',
      description: 'A small red fruit.',
      imageUrl: 'https://via.placeholder.com/50',
    ),
    NewsItem(
      title: 'Date',
      description: 'A sweet brown fruit.',
      imageUrl: 'https://via.placeholder.com/50',
    ),
    NewsItem(
      title: 'Elderberry',
      description: 'A dark purple fruit.',
      imageUrl: 'https://via.placeholder.com/50',
    ),
    NewsItem(
      title: 'Fig',
      description: 'A soft, sweet fruit.',
      imageUrl: 'https://via.placeholder.com/50',
    ),
    NewsItem(
      title: 'Grape',
      description: 'A juicy fruit that comes in bunches.',
      imageUrl: 'https://via.placeholder.com/50',
    ),
    NewsItem(
      title: 'Honeydew',
      description: 'A sweet green melon.',
      imageUrl: 'https://via.placeholder.com/50',
    ),
    NewsItem(
      title: 'Indian Fig',
      description: 'Also known as prickly pear.',
      imageUrl: 'https://via.placeholder.com/50',
    ),
    NewsItem(
      title: 'Jackfruit',
      description: 'A large tropical fruit with a spiky exterior.',
      imageUrl: 'https://via.placeholder.com/50',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HT One'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Scrollable Header
            HeaderWidget(newsItem: NewsItem(title: "Header", description: "Des", imageUrl: "https://img.freepik.com/free-photo/colorful-design-with-spiral-design_188544-9588.jpg"),),
            // List Items
            ListItemsWidget(items: items),
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
    return Container(
      height: 150, // Height of the header
      width: double.infinity, // Full width
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(newsItem.imageUrl), // Background image from model
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end, // Align to bottom
          children: [
            // Title (max 3 lines)
            Text(
              newsItem.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 1),
            // Description
            Text(
              newsItem.description,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ListItemsWidget extends StatelessWidget {
  final List<NewsItem> items;

  const ListItemsWidget({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var item in items)
          ListItemWidget(newsItem: item),
      ],
    );
  }
}

class ListItemWidget extends StatelessWidget {
  final NewsItem newsItem;
  const ListItemWidget({
    Key? key,
    required this.newsItem
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          // Text Column: Title and Description (left-aligned)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  newsItem.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  newsItem.description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16), // Space between text and image
          // Image (right-aligned)
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
            child: Image.network(
              newsItem.imageUrl,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
