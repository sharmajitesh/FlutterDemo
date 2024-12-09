
import 'package:flutter/material.dart';

import '../../Helper.dart';
import '../Model/SectionResponse.dart';

class BigNewsItemWidget extends StatelessWidget {
  SectionItem sectionItem;
  int position;
  BigNewsItemWidget({Key? key, required this.sectionItem, required this.position});

   @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // Calculate the height of the image based on the width
    double imageHeight = screenWidth * 0.56;

    return Container(
      height: imageHeight, // Height of the header
      width: double.infinity,
      margin: const EdgeInsets.only(left: 12, right: 12, top: 12),// Full width
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0), // Apply corner radius here
        image: DecorationImage(
          image: NetworkImage(sectionItem.wallpaperLarge), // Background image from model
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
              sectionItem.headLine,
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
                  sectionItem.section.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 10,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(238, 238, 238, 1),
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  HelperUtils.getTimeRead(sectionItem.timeToRead),
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

