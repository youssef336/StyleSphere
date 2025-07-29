import 'package:flutter/material.dart';
import 'package:stylesphere_app/constant.dart';
import 'package:stylesphere_app/core/services/shared_preferences_service.dart';
import 'package:stylesphere_app/core/utils/assets.dart';
import 'package:stylesphere_app/features/home/presentation/views/model_details.dart';

class ItemModel extends StatefulWidget {
  const ItemModel({super.key, required this.image});

  @override
  State<ItemModel> createState() => _ItemModelState();
  final String image;
}

class _ItemModelState extends State<ItemModel> {
  bool isFavorite = Prefs.getBool(Kisfavorite) ?? false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ModelDetails.routeName);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 255,
            decoration: BoxDecoration(
              color: const Color(0xFFEBEBEB),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                widget.image,
                fit: BoxFit.fitHeight,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Model Name",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          ),

          Row(
            children: [
              const Text(
                "£99.99",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Spacer(),
              IconButton(
                isSelected: isFavorite,
                padding: EdgeInsets.zero,
                icon: isFavorite
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border, color: Colors.black),
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                    Prefs.setBool(Kisfavorite, isFavorite);
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
