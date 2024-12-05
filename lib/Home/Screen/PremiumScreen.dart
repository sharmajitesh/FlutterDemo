import 'package:HT_ONE/Home/Model/premium_model.dart';
import 'package:HT_ONE/Home/ViewModel/premium_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:HT_ONE/Helper.dart';

class Premiumscreen extends StatefulWidget {
  @override
  _Premiumscreen createState() => _Premiumscreen();
}

class _Premiumscreen extends State<Premiumscreen> {
  late Future<PremiumResponse?> _premiumData;

  @override
  void initState() {
    super.initState();
    _premiumData = PremiumApiService().fetchPremiumData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HT One")),
      body: FutureBuilder<PremiumResponse?>(
        future: _premiumData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || snapshot.data == null) {
            return const Center(child: Text("Failed to load data"));
          } else {
            final premiumRes = snapshot.data!;
            return DrawPremiumView(premiumResponse: premiumRes );
          }
        },
      ),
    );
  }
}

class DrawPremiumView extends StatelessWidget {
  const DrawPremiumView({
    super.key,
    required this.premiumResponse,
  });

  final PremiumResponse premiumResponse;

  @override
  Widget build(BuildContext context) {
    var sectionItems = premiumResponse.premiumItems;
    List<Widget> widgets = [];
    widgets.add(HeaderPremium());
    for (var entry in sectionItems.asMap().entries) {
      int index = entry.key;
      PremiumItem sectionItem = entry.value;

      if (index == 0) {
        widgets.add(HeaderWidget(premiumItem: sectionItem));
      } else {
       if(index==1) widgets.add(SizedBox(height: 10));
        widgets.add(SectionSeparator());
        widgets.add(ListItemWidget(premiumItem: sectionItem));
      }

    }
    return Scaffold(
      backgroundColor: Color(0xFFEDF4F4),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widgets,
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
        margin: EdgeInsets.all(10),
        width: double.infinity,
        child:
            const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("HT Premium",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
              overflow: TextOverflow.ellipsis),
          SizedBox(height: 10),
          Padding(padding: EdgeInsets.only(left: 10), child: Icon(Icons.workspace_premium_sharp, color: Color(0xFF29A5BA))),
        ]));
  }
}

class SectionSeparator extends StatelessWidget {
  const SectionSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12),
      height: 0.75,
      width: double.infinity,
      color: Color(0xFFA8C8C8),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  final PremiumItem premiumItem;

  const HeaderWidget({
    Key? key,
    required this.premiumItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // Calculate the height of the image based on the width
    double imageHeight = screenWidth * 0.56;

    return Container(
        height: imageHeight,
        // Height of the header
        width: double.infinity,
        margin: EdgeInsets.only(left: 12, right: 12),
        // Full width
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0), // Apply corner radius here
          image: DecorationImage(
            image: NetworkImage(premiumItem.wallpaperLarge),
            // Background image from model
            fit: BoxFit.cover, // Cover the entire container
          ),
        ),
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Positioned(
              top: 10,
              left: 12,
              child:
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: Color(0xFF29A5BA)),
                    child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "PREMIUM",
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ))),

            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
                child:Container(
              // Overlay with gradient
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                // Apply corner radius here
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                    // Dark gradient at the bottom
                  ],
                ),
              ),
              padding: const EdgeInsets.fromLTRB(12.0,0.0, 0.0, 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end, // Align to bottom
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 0.0),
                      child: Column(
                        children: [
                          Text(
                            premiumItem.mobileHeadline,
                            style: const TextStyle(
                              fontSize: 16,
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
                                premiumItem.section.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w900,
                                  color: Color.fromRGBO(238, 238, 238, 1),
                                ),
                              ),
                              SizedBox(width: 12),
                              Text(
                                HelperUtils.getTimeRead(premiumItem.timeToRead),
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
                      )),
                ],
              ),
            )
            )
          ],
        ));
  }
}



class ListItemWidget extends StatelessWidget {
  final PremiumItem premiumItem;

  const ListItemWidget(
      {Key? key, required this.premiumItem})
      : super(key: key);

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
                  premiumItem.mobileHeadline,
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
                      premiumItem.section.toUpperCase(),
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
                    HelperUtils.getTimeRead(premiumItem.timeToRead),
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
          Container(
            height: imageHeight,
            width: imageWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.0), // Rounded corners
              image: DecorationImage(
                image: NetworkImage(premiumItem.thumbImage),
                fit: BoxFit.cover,
              ),
            ),
          child: Stack(

            children: [

              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(4.0)),
                      color: Color(0xFF29A5BA),

                    ),
                padding: EdgeInsets.all(2),
                child: const Text(
                  "PREMIUM",
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ))
            ],
          ),
          ),

          // ClipRRect(
          //   borderRadius: BorderRadius.circular(4.0), // Rounded corners
          //
          //   child: Image.network(
          //     newsItem.wallpaperLarge,
          //     height: imageHeight,
          //     width: imageWidth,
          //     fit: BoxFit.cover,
          //   ),
          // ),
        ],
      ),
    );
  }
}
