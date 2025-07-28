import 'package:flutter/material.dart';
import 'package:stylesphere_app/core/utils/assets.dart';
import 'package:stylesphere_app/features/home/presentation/views/men_view.dart';

class ListCategories extends StatelessWidget {
  const ListCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        assets.length,
        (index) => Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, widgets[index]);
            },
            child: Column(
              children: [
                Image.asset(assets[index], height: 80),
                const SizedBox(height: 15),
                Text(
                  imagesNames[index],
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<String> imagesNames = ["Women", "Men", "Kids", "Deals", "Health"];
List<String> assets = [
  Assets.assetsImagesCategoryWomen,
  Assets.assetsImagesCategoryMen,
  Assets.assetsImagesCategoryKids,
  Assets.assetsImagesCategoryDeals,
  Assets.assetsImagesCategoryHealth,
];
List<String> widgets = [
  MenView.routeName,
  MenView.routeName,
  MenView.routeName,
  MenView.routeName,
  MenView.routeName,
  MenView.routeName,
];
