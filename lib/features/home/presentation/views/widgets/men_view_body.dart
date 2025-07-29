import 'package:flutter/material.dart';
import 'package:stylesphere_app/core/utils/assets.dart';
import 'package:stylesphere_app/features/home/doman/entities/item_entity.dart';
import 'package:stylesphere_app/features/home/presentation/views/widgets/filter_and_sort.dart';
import 'package:stylesphere_app/features/home/presentation/views/widgets/item_model.dart';

class MenViewBody extends StatelessWidget {
  const MenViewBody({super.key});
  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(thickness: 0.5, color: Colors.grey[300]),
        const FilterAndSort(),
        const SizedBox(height: 10),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GridView.builder(
              itemCount: 5,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 1,
                childAspectRatio: 0.594,
              ),
              itemBuilder: (context, index) {
                return ItemModel(item: ItemEntity.items[index]);
              },
            ),
          ),
        ),
      ],
    );
  }
}

List<String> images = [
  Assets.assetsImagesModelsModel1,
  Assets.assetsImagesModelsModel2,
  Assets.assetsImagesModelsModel3,
  Assets.assetsImagesModelsModel4,
  Assets.assetsImagesModelsModel1,
];
