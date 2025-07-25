import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylesphere_app/core/utils/assets.dart';
import 'package:stylesphere_app/core/widgets/custom_app_bar2.dart';
import 'package:stylesphere_app/core/widgets/custom_buttom.dart';
import 'package:stylesphere_app/features/home/presentation/views/widgets/video_player.dart';
import 'package:video_player/video_player.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          const CustomVideoPlayer(),
          // fill entire stack
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
              height: 60,
              child: SvgPicture.asset(Assets.assetsImagesCategoryDeals),
            ),
          ),
        ],
      ),
    );
  }
}
