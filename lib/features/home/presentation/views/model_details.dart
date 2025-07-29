import 'package:flutter/material.dart';
import 'package:stylesphere_app/core/utils/assets.dart';
import 'package:stylesphere_app/core/widgets/custom_app_bar.dart';
import 'package:stylesphere_app/features/home/doman/entities/item_entity.dart';
import 'package:stylesphere_app/features/home/presentation/views/widgets/model_details_body.dart';

class ModelDetails extends StatelessWidget {
  const ModelDetails({super.key, required this.item});
  static const String routeName = 'model_details';
  final ItemEntity? item;
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
      body: ModelDetailsBody(item: item!),
    );
  }
}
