import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesphere_app/core/utils/assets.dart';

class FilterAndSort extends StatelessWidget {
  const FilterAndSort({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 40,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            const Text(
              'Sort by',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            const SizedBox(width: 16),
            SvgPicture.asset(Assets.assetsSvgsSelect),
            const Spacer(),
            SvgPicture.asset(Assets.assetsSvgsFilter),
            const SizedBox(width: 9),

            const Text(
              'Filter',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            const SizedBox(width: 18),

            SvgPicture.asset(Assets.assetsSvgsGrid),
            const SizedBox(width: 18),
            SvgPicture.asset(Assets.assetsSvgsGroups),
          ],
        ),
      ),
    );
  }
}
