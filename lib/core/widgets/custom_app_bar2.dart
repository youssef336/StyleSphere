import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar2 extends StatelessWidget {
  const CustomAppBar2({
    super.key,
    required this.title,
    required this.sufex,
    required this.prefex,
    this.height = 60,
  });
  final String title;
  final String sufex;
  final String prefex;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(sufex, width: 26),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const Spacer(),

            SvgPicture.asset(prefex, width: 20),
          ],
        ),
      ),
    );
  }
}
