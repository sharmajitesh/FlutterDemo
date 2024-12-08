import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShadowDividerWidget extends StatelessWidget  {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3.0, // Divider height
      decoration: const BoxDecoration(
        color: Colors.white, // Line color
        boxShadow: [
          BoxShadow(
            color: Colors.white, // Shadow color
            offset: Offset(0, 2), // Horizontal and vertical shadow offset
            blurRadius: 12.0, // Softness of the shadow
          ),
        ],
      ),
    );


  }


}

