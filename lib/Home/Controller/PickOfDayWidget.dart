import 'package:flutter/material.dart';

import '../Model/home_model.dart';

class Pickofdaywidget extends StatelessWidget {
  final NewsItem item;
  const Pickofdaywidget({super.key, required this.item});

  @override
  Widget build(BuildContext context)
  {
    double screenWidth = MediaQuery.of(context).size.width;
    double relativeHeight = screenWidth * 0.56;

    return Container(

        color: const Color.fromRGBO(245, 252, 255, 1),
        margin: const EdgeInsets.only(top: 16),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:  EdgeInsets.only(left: 16, top: 10),
                  child: Image.asset("assets/images/pickOfTheDay.jpg", fit: BoxFit.contain, width: 140, height: 48), // Base image
                ),
                Container(
                  padding: EdgeInsets.only(right: 16, top: 28),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child:   Row(
                      children: [
                        Icon(Icons.facebook, color: Colors.blue, size: 20,),
                        SizedBox(width: 20),
                        Icon(Icons.mail, color: Colors.green,size: 20),
                        SizedBox(width: 20),
                        Icon(Icons.account_balance_wallet, color: Colors.black,size: 20,)


                      ],
                    ),
                  ),
                )
              ],
            ),
            const Column(
                children: [
                  SizedBox(height: 10),
                  Divider(
                      height:1.0,
                      color:  Colors.black,
                      indent: 16,
                      endIndent: 16,
                      thickness: 0.4),
                  Divider(
                      height:5.0,
                      color:  Colors.black,
                      indent: 16,
                      endIndent: 16,
                      thickness: 0.4),
                  Divider(
                      height:1.0,
                      color:  Colors.black,
                      indent: 16,
                      endIndent: 16,
                      thickness: 0.4),
                ]
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 10, right: 16),
                child:  Text(
                  item.headline,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.bold,
                     color: Color.fromRGBO(33, 33, 33, 1)
                  ),
                ),
            ),
            const SizedBox(height: 10),
            Image.network(
              height: relativeHeight,
              width: double.infinity,
              item.wallpaperLarge,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 10),

            // Article description
            Padding(
               padding:  const EdgeInsets.only(left: 16, right: 16),
               child:  Text(
                 item.shortDescription,
                 style: const TextStyle(fontSize: 14, fontFamily: "Lato", fontWeight: FontWeight.w400, color: Color.fromRGBO(33, 33, 33, 1)),
               ),
            ),

            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                //Need to add some action here for "Read full story"
                debugPrint("read full story button tapped from pick of the day widget");
              },
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,// Adjust size based on content
                children: [
                  const Text('Read Full Story', style: TextStyle(fontSize: 12, color: Color.fromRGBO(0, 177, 205, 1), fontWeight: FontWeight.w700, fontFamily: 'Lato')),
                  const SizedBox(width: 4),
                  Image.asset("assets/images/blueArrow.png", width: 6, height: 12)
                ],
              ),
            ),
          ],
        ),

    );
  }
}








