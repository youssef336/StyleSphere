import 'package:flutter/material.dart';
import 'package:stylesphere_app/core/utils/assets.dart';
import 'package:stylesphere_app/core/widgets/custom_app_bar2.dart';
import 'package:stylesphere_app/features/home/presentation/views/widgets/list_categories.dart';
import 'package:stylesphere_app/features/home/presentation/views/widgets/video_player.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(height: double.infinity),
        const CustomVideoPlayer(),
        const CustomAppBar2(
          height: 78,
          title: 'Runway',
          prefex: Assets.assetsSvgsNotification,
          sufex: Assets.assetsSvgsMenu,
        ),
        Positioned(
          bottom: 70,
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: 180,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Categories',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ListCategories(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
