
import 'package:flutter/cupertino.dart';

class SmallNewsSeparator extends StatelessWidget {
  const SmallNewsSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12),
      height: 0.75,
      width: double.infinity,
      color: Color(0xEEEEEEFF),
    );
  }
}
