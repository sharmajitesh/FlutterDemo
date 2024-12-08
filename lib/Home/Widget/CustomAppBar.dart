import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'ShadowDividerWidget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  double elevation=0;
  CustomAppBar({Key? key, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        AppBar(
        backgroundColor: Colors.white,

       title: Row(

      mainAxisAlignment: MainAxisAlignment.start,

      children: [
        SvgPicture.asset('assets/images/ic_hamburger.svg'),
        const SizedBox(width: 8),
        SvgPicture.asset('assets/images/ic_toolbar_logo.svg'),
             // Optional app title
      ],
    ),

        actions: [
          IconButton(
            icon:SvgPicture.asset('assets/images/ic_e_paper.svg'),
            onPressed: () {
              // Add action for Profile
            },
          ),
          IconButton(
            icon:SvgPicture.asset('assets/images/ic_search.svg'),
            onPressed: () {
              // Add action for Profile
            },
          ),
          // User Icon
          IconButton(
            icon:SvgPicture.asset('assets/images/ic_profile.svg'),
            onPressed: () {
              // Add action for Profile
            },
          ),
        ],

      ),
        //ShadowDividerWidget(),
    ],
    );


  }

  // This is required by PreferredSizeWidget
  @override
  Size get preferredSize => const Size.fromHeight(
      kToolbarHeight);
}

