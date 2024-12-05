import 'package:HT_ONE/Home/Model/home_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class InfographicsWidget extends StatefulWidget {

  final SectionItem sectionItem;

  const InfographicsWidget({super.key, required this.sectionItem});

  @override
  State<InfographicsWidget> createState() => _InfographicsWidgetState();
}

class _InfographicsWidgetState extends State<InfographicsWidget> {
  int currentIndex = 0;
  final CarouselSliderController controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;
    // Calculate the height of the image based on the width

    return Container(
      width: double.infinity,
      color: const Color.fromRGBO(236, 252, 255, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 12),
            child: Text(widget.sectionItem.blockName, style: TextStyle(color: Color.fromRGBO(0, 30, 40, 1), fontSize: 20, fontFamily: "Lato", fontWeight: FontWeight.w900), maxLines: 1,),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 12),
            child: Text("Simplifying news with the help of images, charts and graphs", style: TextStyle(color: Color.fromRGBO(110, 128, 152, 1), fontSize: 12, fontFamily: "Lato", fontWeight: FontWeight.w400), maxLines: 3,),
          ),
          const SizedBox(height: 12),
          CarouselSlider.builder(itemCount: widget.sectionItem.newsItems.length,
            itemBuilder: (context, index, realIndex) {
            return Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(widget.sectionItem.newsItems[index].wallpaperLarge),
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
            options: CarouselOptions(
            height: screenSize + 50,
            enlargeCenterPage: false,
            initialPage: 0,
            autoPlay: false,
            aspectRatio: 16/9,
            enableInfiniteScroll: false,
            viewportFraction: 0.8,
            onPageChanged: (index, reason) {
              // Update the index when the page changes
              setState(() {
                currentIndex = index;
              });
            }
          ),
            carouselController: controller,
          ),
          Container(
            padding: const EdgeInsets.only(top: 12),
            alignment: Alignment.center,
            child: AnimatedSmoothIndicator(
              activeIndex: currentIndex, // Use the current index
              count: widget.sectionItem.newsItems.length, // Total number of items
              effect: const WormEffect(
                activeDotColor: Colors.blue,
                dotColor: Colors.grey,
                dotHeight: 8,
                dotWidth: 8,
              ),
            ),
          ),
          // SingleChildScrollView(
          //   padding: EdgeInsets.only(left: 12),
          //   scrollDirection: Axis.horizontal,
          //   child: Row (
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       crossAxisAlignment: CrossAxisAlignment.end,
          //       children: List.generate(sectionItem.newsItems.length, (index) => Container(
          //           margin: EdgeInsets.only(right: 10),
          //           width: imageWidth,
          //           height: imageHeight,
          //           child: ClipRRect(
          //               borderRadius: BorderRadius.circular(8),
          //               child: Image.network(sectionItem.newsItems[index].wallpaperLarge, height: 200, fit: BoxFit.cover)
          //           ) //CircularImageView()
          //       )),
          //       // [
          //       //   for (var item in sectionItem.newsItems)
          //       //     Container(
          //       //       child: Image.network(item.wallpaperLarge, height: 200, fit: BoxFit.cover)
          //       //     )
          //       // ]
          //   ),
          // ),
          // Center(
          //   child: SmoothPageIndicator(
          //       controller: controller,  // PageController
          //       count:  widget.sectionItem.newsItems.length,
          //       effect:  WormEffect(dotWidth: 8, dotHeight: 8, radius: 4, dotColor: Color.fromRGBO(190, 190, 190, 1), activeDotColor: Colors.blue, type: WormType.underground), // your preferred effect
          //       onDotClicked: (index){
          //       }
          //   )
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 12, right: 12),
            child: Text(widget.sectionItem.newsItems[currentIndex].headline, style: TextStyle(color: Colors.black, fontSize: 20, fontFamily: "Lato", fontWeight: FontWeight.w900), maxLines: 1, overflow: TextOverflow.ellipsis,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Text(widget.sectionItem.newsItems[currentIndex].shortDescription, style: TextStyle(color: Color.fromRGBO(33, 33, 33, 1), fontSize: 16, fontFamily: "Lato", fontWeight: FontWeight.w400), maxLines: 3, overflow: TextOverflow.ellipsis,),
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

