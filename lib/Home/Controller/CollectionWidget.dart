import 'package:flutter/material.dart';

class Collectionwidget extends StatelessWidget {
  const Collectionwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      color: Colors.grey,
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(10, (index) => Container(
                  margin: EdgeInsets.only(right: 10),
                  child: CollectionItem(itemIndex: index) //CircularImageView()
              ),
              )
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
  
  final int itemIndex;
  const CollectionItem({super.key, required this.itemIndex});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width - 40;
    // Calculate the height of the image based on the width
    double imageHeight = screenWidth * 0.56;

    return Container(
      width: screenWidth,
      height: imageHeight,
      color: Colors.lightGreen,
      child: Center(
          child: Text("Item $itemIndex", style: TextStyle(fontSize: 16, fontFamily: "Lato", fontWeight: FontWeight.bold),)
      ),
    );
  }
}

