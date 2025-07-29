import 'package:flutter/material.dart';
import 'package:stylesphere_app/constant.dart';
import 'package:stylesphere_app/core/services/shared_preferences_service.dart';
import 'package:stylesphere_app/core/utils/assets.dart';
import 'package:stylesphere_app/features/home/doman/entities/item_entity.dart';
import 'package:stylesphere_app/features/home/presentation/views/model_details.dart';

class ItemModel extends StatefulWidget {
  const ItemModel({super.key, required this.item});

  @override
  State<ItemModel> createState() => _ItemModelState();
  final ItemEntity item;
}

class _ItemModelState extends State<ItemModel> {
  bool? isFavorite; // Nullable to track loading state

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  Future<void> _loadFavoriteStatus() async {
    final key = '${widget.item.image}_favorite'; // More unique than name
    final value = Prefs.getBool(key);
    if (mounted) {
      setState(() {
        isFavorite = value ?? false;
      });
    }
  }

  Future<void> _toggleFavorite() async {
    final key = '${widget.item.image}_favorite';
    final newValue = !(isFavorite ?? false);
    await Prefs.setBool(key, newValue);
    if (mounted) {
      setState(() {
        isFavorite = newValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // While loading favorite status, show placeholder
    if (isFavorite == null) {
      return const SizedBox(height: 300); // or a shimmer/loading placeholder
    }

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
                widget.item.image,
                fit: BoxFit.fitHeight,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.item.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          ),
          Row(
            children: [
              Text(
                widget.item.price,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              IconButton(
                isSelected: isFavorite!,
                padding: EdgeInsets.zero,
                icon: isFavorite!
                    ? const Icon(Icons.favorite, color: Colors.red)
                    : const Icon(Icons.favorite_border, color: Colors.black),
                onPressed: _toggleFavorite,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
