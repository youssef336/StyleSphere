import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylesphere_app/core/utils/assets.dart';
import 'package:stylesphere_app/core/widgets/custom_app_bar2.dart';
import 'package:stylesphere_app/features/home/presentation/views/widgets/video_player.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomVideoPlayer(),
        const CustomAppBar2(
          title: 'Runway',
          prefex: Assets.assetsSvgsNotification,
          sufex: Assets.assetsSvgsMenu,
        ),
        Positioned(
          bottom: 0,
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Categories'),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      assets.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Image.asset(assets[index], height: 80),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

List<String> assets = [
  Assets.assetsImagesCategoryDeals,
  Assets.assetsImagesCategoryHealth,
  Assets.assetsImagesCategoryKids,
  Assets.assetsImagesCategoryMen,
  Assets.assetsImagesCategoryWomen,
];
