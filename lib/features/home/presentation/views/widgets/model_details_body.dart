import 'package:flutter/material.dart';
import 'package:stylesphere_app/core/utils/assets.dart';
import 'package:stylesphere_app/features/home/doman/entities/item_entity.dart';
import 'package:stylesphere_app/features/home/presentation/views/widgets/custom_scrollable_sheet.dart';
import 'package:stylesphere_app/features/home/presentation/views/widgets/filter_and_sort.dart';

class ModelDetailsBody extends StatelessWidget {
  const ModelDetailsBody({super.key, required this.item});
  final ItemEntity item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 🔷 Main content
        Padding(
          padding: const EdgeInsets.only(
            bottom: 100,
          ), // reserve space for bottom sheet
          child: Column(
            children: [
              Divider(thickness: 0.5, color: Colors.grey[300]),
              const FilterAndSort(),
              const SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height * 0.704,
                decoration: BoxDecoration(
                  color: const Color(0xFFEBEBEB),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    item.image,
                    fit: BoxFit.fitHeight,
                    width: double.infinity,
                  ),
                ),
              ),
            ],
          ),
        ),
        CustomScrollableSheet(item: item),
      ],
    );
  }
}
