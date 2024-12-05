import 'package:HT_ONE/Home/Model/home_model.dart';
import 'package:flutter/material.dart';

class InfographicsWidget extends StatelessWidget {

  final SectionItem sectionItem;
  const InfographicsWidget({super.key, required this.sectionItem});

  @override
  Widget build(BuildContext context) {

    double imageWidth = (MediaQuery.of(context).size.width - 40)/2;
    // Calculate the height of the image based on the width
    double imageHeight = (imageWidth - 4) * 1.78 + 4;

    return Container(
      width: double.infinity,
      color: Color.fromRGBO(236, 252, 255, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 12, top: 12),
            child: Text(sectionItem.blockName, style: TextStyle(color: Color.fromRGBO(0, 30, 40, 1), fontSize: 20, fontFamily: "Lato", fontWeight: FontWeight.w900), maxLines: 1,),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Text("Simplifying news with the help of images, charts and graphs", style: TextStyle(color: Color.fromRGBO(110, 128, 152, 1), fontSize: 12, fontFamily: "Lato", fontWeight: FontWeight.w400), maxLines: 3,),
          ),
          SizedBox(height: 12),
          SingleChildScrollView(
            padding: EdgeInsets.only(left: 12),
            scrollDirection: Axis.horizontal,
            child: Row (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(sectionItem.newsItems.length, (index) => Container(
                    margin: EdgeInsets.only(right: 10),
                    width: imageWidth,
                    height: imageHeight,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(sectionItem.newsItems[index].wallpaperLarge, height: 200, fit: BoxFit.cover)
                    ) //CircularImageView()
                )),
                // [
                //   for (var item in sectionItem.newsItems)
                //     Container(
                //       child: Image.network(item.wallpaperLarge, height: 200, fit: BoxFit.cover)
                //     )
                // ]
            ),
          ),
          SizedBox(height: 12),

        ],
      ),
    );
  }
}

class InfographicsImageWidget extends StatelessWidget {
  final NewsItem item;
  const InfographicsImageWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

