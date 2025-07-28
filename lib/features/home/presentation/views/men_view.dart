import 'package:flutter/material.dart';
import 'package:stylesphere_app/core/utils/assets.dart';
import 'package:stylesphere_app/core/widgets/custom_app_bar.dart';
import 'package:stylesphere_app/features/home/presentation/views/widgets/men_view_body.dart';

class MenView extends StatelessWidget {
  const MenView({super.key});
  static const routeName = '/men';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        sufix: Assets.assetsSvgsArrowLeft,
        sufixOnTap: () {
          Navigator.pop(context);
        },
        prefex: Assets.assetsSvgsCart,
        title: "Men",
      ),
      body: const MenViewBody(),
    );
  }
}
