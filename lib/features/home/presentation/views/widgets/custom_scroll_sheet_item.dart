import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomScrollSheetItem extends StatelessWidget {
  const CustomScrollSheetItem({
    super.key,
    required this.text,
    required this.image,
    this.child,
  });
  final String text;
  final String image;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,

      decoration: const ShapeDecoration(
        color: Colors.white /* White */,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFEBEBEB) /* Light-Grey */),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          const SizedBox(width: 10),
          SvgPicture.asset(image),
          const SizedBox(width: 10),

          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          if (child != null) child!,
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
