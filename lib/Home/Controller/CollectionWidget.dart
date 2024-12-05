import 'package:flutter/material.dart';

import '../Model/home_model.dart';

class Collectionwidget extends StatelessWidget {
  final SectionItem sectionItem;
  const Collectionwidget({super.key, required this.sectionItem});

  @override
  Widget build(BuildContext context) {

    List<Widget> widgets = [];
    if (sectionItem.collectionType == CollectionType.premium) {
      widgets.addAll([
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 12, top: 21),
          // image: Image(image: Image.network("https://fastly.picsum.photos/id/83/200/300.jpg?hmac=avqtE9ZSAkPbFtYCXzxg4TeAA-fMWqX6jUQeWI_HjLc")),
          // image: Image.network("https://fastly.picsum.photos/id/83/200/300.jpg?hmac=avqtE9ZSAkPbFtYCXzxg4TeAA-fMWqX6jUQeWI_HjLc", fit: BoxFit.cover,),
          child: Image.asset("assets/images/htPremium.png", fit: BoxFit.cover, width: 111, height: 16), // Base image
        ),
        SizedBox(height: 20),
      ]);
    } else if (sectionItem.blockName.isNotEmpty) {
      widgets.addAll([
        Padding(
            padding: EdgeInsets.only(left: 12, top: 21),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(sectionItem.blockName,
                  style: TextStyle(fontSize: 20, fontFamily: "Lato", fontWeight: FontWeight.w900, color: Colors.white), overflow: TextOverflow.ellipsis),
            )
        ),
        SizedBox(height: 20),
      ]);
    }
    return Container(
      width: double.infinity,
      // height: 260,
      // alignment: Alignment.topCenter,
      color: Color.fromRGBO(56, 56, 61, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widgets + [
          //for showing the title from the economist and view all on right side
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 9, bottom: 0),
            child: Row (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (var item in sectionItem.newsItems)
                    CollectionItem(item: item)
                ]

                // List.generate(items.length, (index) => Container(
                //     margin: EdgeInsets.only(right: 12), //middle spacing
                //     child: CollectionItem(item: index) //CircularImageView()
                // ),
                //
                // )
              // [
              //   CircleAvatar(
              //     radius: 30,
              //     backgroundColor: Colors.red,
              //     child: Padding(
              //       padding: EdgeInsets.all(3),
              //       child: ClipOval(
              //         child: Image.network("https://fastly.picsum.photos/id/83/200/300.jpg?hmac=avqtE9ZSAkPbFtYCXzxg4TeAA-fMWqX6jUQeWI_HjLc",
              //             fit: BoxFit.cover, height: double.infinity, width: double.infinity),
              //       ),
              //     ),
              //   ),
              //   CircleAvatar(
              //     radius: 30,
              //     backgroundColor: Colors.red,
              //     child: Padding(
              //       padding: EdgeInsets.all(3),
              //       child: ClipOval(
              //         child: Image.network("https://fastly.picsum.photos/id/83/200/300.jpg?hmac=avqtE9ZSAkPbFtYCXzxg4TeAA-fMWqX6jUQeWI_HjLc",
              //             fit: BoxFit.cover, height: double.infinity, width: double.infinity),
              //       ),
              //     ),
              //   ),
              //   CircleAvatar(
              //     radius: 30,
              //     backgroundColor: Colors.red,
              //     child: Padding(
              //       padding: EdgeInsets.all(3),
              //       child: ClipOval(
              //         child: Image.network("https://fastly.picsum.photos/id/83/200/300.jpg?hmac=avqtE9ZSAkPbFtYCXzxg4TeAA-fMWqX6jUQeWI_HjLc",
              //             fit: BoxFit.cover, height: double.infinity, width: double.infinity),
              //       ),
              //     ),
              //   ),
              //   CircleAvatar(
              //     radius: 30,
              //     backgroundColor: Colors.red,
              //     child: Padding(
              //       padding: EdgeInsets.all(3),
              //       child: ClipOval(
              //         child: Image.network("https://fastly.picsum.photos/id/83/200/300.jpg?hmac=avqtE9ZSAkPbFtYCXzxg4TeAA-fMWqX6jUQeWI_HjLc",
              //             fit: BoxFit.cover, height: double.infinity, width: double.infinity),
              //       ),
              //     ),
              //   ),
              //   CircleAvatar(
              //     radius: 30,
              //     backgroundColor: Colors.red,
              //     child: Padding(
              //       padding: EdgeInsets.all(3),
              //       child: ClipOval(
              //         child: Image.network("https://fastly.picsum.photos/id/83/200/300.jpg?hmac=avqtE9ZSAkPbFtYCXzxg4TeAA-fMWqX6jUQeWI_HjLc",
              //             fit: BoxFit.cover, height: double.infinity, width: double.infinity),
              //       ),
              //     ),
              //   ),
              //   CircleAvatar(
              //     radius: 30,
              //     backgroundColor: Colors.red,
              //     child: Padding(
              //       padding: EdgeInsets.all(3),
              //       child: ClipOval(
              //         child: Image.network("https://fastly.picsum.photos/id/83/200/300.jpg?hmac=avqtE9ZSAkPbFtYCXzxg4TeAA-fMWqX6jUQeWI_HjLc",
              //             fit: BoxFit.cover, height: double.infinity, width: double.infinity),
              //       ),
              //     ),
              //   ),
              //   CircleAvatar(
              //     radius: 30,
              //     backgroundColor: Colors.red,
              //     child: Padding(
              //       padding: EdgeInsets.all(3),
              //       child: ClipOval(
              //         child: Image.network("https://fastly.picsum.photos/id/83/200/300.jpg?hmac=avqtE9ZSAkPbFtYCXzxg4TeAA-fMWqX6jUQeWI_HjLc",
              //             fit: BoxFit.cover, height: double.infinity, width: double.infinity),
              //       ),
              //     ),
              //   ),
              // ],
            ),
          ),
        ],
      ),
    );
  }
}

class CircularImageView extends StatelessWidget {
  const CircularImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.red,
      child: Padding(
        padding: EdgeInsets.all(3),
        child: ClipOval(
          child: Image.network("https://fastly.picsum.photos/id/83/200/300.jpg?hmac=avqtE9ZSAkPbFtYCXzxg4TeAA-fMWqX6jUQeWI_HjLc",
              fit: BoxFit.cover, height: double.infinity, width: double.infinity),
        ),
      ),
    );
  }
}

// class CollectionItem extends StatefulWidget {
//  
//   final int index;
//   const CollectionItem({super.key, required this.index});
//
//   @override
//   State<CollectionItem> createState() => _CollectionItemState();
// }
//
// class _CollectionItemState extends State<CollectionItem> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

class CollectionItem extends StatelessWidget {
  
  final NewsItem item;
  const CollectionItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width - 40;
    // Calculate the height of the image based on the width
    double imageHeight = screenWidth * 0.56;

    return Container(
      margin: EdgeInsets.only(right: 12),
      width: 131,
      height: 155,
      color: Color.fromRGBO(28, 27, 34, 1),
      child: Container(
        child: Column(
          children: [
            Image.network(item.wallpaperLarge, width: double.infinity, height: 74, fit: BoxFit.fill,),
            SizedBox(height: 5,),
            Padding(
                padding: EdgeInsets.only(left: 6, right: 6, bottom: 6),
                child: Text(item.headline,
                        style: TextStyle(fontSize: 12, fontFamily: "Lato", fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis, color: Colors.white), maxLines: 4,),
            )
          ],
        )
      ),
    );
  }
}

