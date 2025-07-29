import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesphere_app/core/utils/assets.dart';
import 'package:stylesphere_app/features/home/doman/entities/item_entity.dart';
import 'package:stylesphere_app/features/home/presentation/views/widgets/custom_scroll_sheet_item.dart';
import 'package:stylesphere_app/features/home/presentation/views/widgets/item_model.dart';

class CustomScrollableSheet extends StatefulWidget {
  const CustomScrollableSheet({super.key, required this.item});
  final ItemEntity item;
  @override
  State<CustomScrollableSheet> createState() => _CustomScrollableSheetState();
}

class _CustomScrollableSheetState extends State<CustomScrollableSheet> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.15,
      minChildSize: 0.15,
      maxChildSize: 0.845,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: ListView(
            controller: scrollController,
            children: [
              const Center(
                child: SizedBox(
                  width: 40,
                  height: 5,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.item.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    widget.item.price,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    isSelected: isFavorite,
                    padding: EdgeInsets.zero,
                    icon: isFavorite
                        ? const Icon(Icons.favorite)
                        : const Icon(
                            Icons.favorite_border,
                            color: Colors.black,
                          ),
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 55,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white /* White */,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 1,
                      color: Color(0xFFEBEBEB) /* Light-Grey */,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 20),

                    const Text(
                      "Select colour",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,

                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    SvgPicture.asset(Assets.assetsSvgsSelect),
                    const SizedBox(width: 55),
                    SvgPicture.asset(Assets.assetsSvgsRectangle38),

                    const Spacer(),
                    const Text(
                      "Select size",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,

                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    SvgPicture.asset(Assets.assetsSvgsSelect),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 55,

                decoration: ShapeDecoration(
                  color: const Color(0xFF181818) /* Black */,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'ADD TO BAG',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white /* White */,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const CustomScrollSheetItem(
                image: Assets.assetsSvgsGroup,
                text: 'Free delivery',
              ),
              const CustomScrollSheetItem(
                image: Assets.assetsSvgsHugeiconsTruckReturn,
                text: 'Free return',
                child: Text(
                  "View return policy",
                  style: TextStyle(
                    color: Color(0xFF989797),
                    fontSize: 14,

                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  SizedBox(width: 8),
                  Text(
                    "About product",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CustomScrollSheetItem(
                image: Assets.assetsSvgsProductDetails,
                text: 'Product details',

                child: SvgPicture.asset(Assets.assetsSvgsArrowUp),
              ),
              CustomScrollSheetItem(
                image: Assets.assetsSvgsBrand,
                text: 'Brand',
                child: SvgPicture.asset(Assets.assetsSvgsArrowDown),
              ),
              CustomScrollSheetItem(
                image: Assets.assetsSvgsSizeandfit,
                text: 'Size and fit',
                child: SvgPicture.asset(Assets.assetsSvgsArrowDown),
              ),
              CustomScrollSheetItem(
                image: Assets.assetsSvgsHistory,
                text: 'History',
                child: SvgPicture.asset(Assets.assetsSvgsArrowDown),
              ),
              const SizedBox(height: 10),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  SizedBox(width: 5),
                  Text(
                    'You might also like',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,

                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'View all',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,

                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  child: Row(
                    children: List.generate(4, (index) {
                      return Row(
                        children: [
                          SizedBox(
                            width: 170,
                            child: ItemModel(item: ItemEntity.items[index]),
                          ),
                          const SizedBox(width: 10),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        );
      },
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
