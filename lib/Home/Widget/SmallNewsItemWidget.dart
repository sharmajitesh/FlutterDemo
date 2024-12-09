


import 'package:flutter/material.dart';

import '../../Helper.dart';
import '../Model/SectionResponse.dart';

class SmallNewsItemWidget extends StatelessWidget {
  SectionItem sectionItem;
  int position;
  SmallNewsItemWidget({Key? key, required this.sectionItem, required this.position});

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
                  sectionItem.headLine,
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
                      sectionItem.section.toUpperCase(),
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
                      HelperUtils.getTimeRead(sectionItem.timeToRead),
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
              sectionItem.wallpaperLarge,
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