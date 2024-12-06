import 'package:flutter/material.dart';

import '../Model/home_model.dart';

class Pickofdaywidget extends StatelessWidget {
  final List<NewsItem> items;
  const Pickofdaywidget({super.key, required this.items});

  @override
  Widget build(BuildContext context)
  {
    return Container(

        color: const Color.fromRGBO(245, 252, 255, 100),
        margin: const EdgeInsets.only(top: 16),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Padding(
                  padding:  EdgeInsets.only(left: 12, top: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child:  Icon(Icons.facebook, color: Colors.blue, size: 20,)
                  ),

                ),
                Padding(padding: EdgeInsets.only(right: 12, top: 10),
                 child: Align(
                    alignment: Alignment.topRight,
                    child:   Row(

                      children: [
                        Icon(Icons.facebook, color: Colors.blue, size: 20,),
                        Icon(Icons.ice_skating, color: Colors.green,size: 20),
                        Icon(Icons.close, color: Colors.black,size: 20,)


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
                      color:  Color.fromRGBO(35, 31, 32, 100),
                      indent: 16,
                      endIndent: 16,
                      thickness: 1),
                  Divider(
                      height:5.0,
                      color:  Color.fromRGBO(35, 31, 32, 100),
                      indent: 16,
                      endIndent: 16,
                      thickness: 1),
                  Divider(
                      height:1.0,
                      color:  Color.fromRGBO(35, 31, 32, 100),
                      indent: 16,
                      endIndent: 16,
                      thickness: 1),
                ]
            ),


      Padding(
        padding:  const EdgeInsets.only(left: 12, top: 10, right: 12),
            child:  Text(
              items[0].headline,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                 color: Color.fromRGBO(33, 33, 33, 100)
              ),
            ),
      ),

             const SizedBox(height: 10),

            Image.network(
              height: 150,
              width: MediaQuery.of(context).size.width,
              items[0].wallpaperLarge,
            ),

             const SizedBox(height: 16),

            // Article description
      Padding(
             padding:  const EdgeInsets.only(left: 12, top: 16, right: 12),
           child:  Text(
              items[0].shortDescription,
              style: const TextStyle(fontSize: 14, color: Color.fromRGBO(33, 33, 33, 100)),
            ),
      ),

            const SizedBox(height: 12),
            const Center(

                child: Text('Read Full Story', style: TextStyle(fontSize: 10, color: Color.fromRGBO(0, 177, 205, 100), fontWeight: FontWeight.w700, fontFamily: 'Lato'))


            ),

            const SizedBox(height: 10),

          ],
        ),

    );
  }


}








