import 'package:flutter/material.dart';
import 'package:stylesphere_app/core/services/shared_preferences_service.dart';
import 'package:stylesphere_app/features/home/doman/entities/item_entity.dart';
import 'package:stylesphere_app/features/home/presentation/views/widgets/item_model.dart';

class FavoritesBody extends StatefulWidget {
  const FavoritesBody({super.key});

  @override
  State<FavoritesBody> createState() => _FavoritesBodyState();
}

class _FavoritesBodyState extends State<FavoritesBody> {
  List<ItemEntity> favoriteItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final allItems = ItemEntity.items;
    final List<ItemEntity> favorites = [];

    for (var item in allItems) {
      final key = '${item.image}_favorite';
      final liked = Prefs.getBool(key) ?? false;
      if (liked) {
        favorites.add(item);
      }
    }

    setState(() {
      favoriteItems = favorites;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (favoriteItems.isEmpty) {
      return const Center(
        child: Text("No favorites yet!", style: TextStyle(fontSize: 18)),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GridView.builder(
        itemCount: favoriteItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 1,
          childAspectRatio: 0.588,
        ),
        itemBuilder: (context, index) {
          return ItemModel(item: favoriteItems[index]);
        },
      ),
    );
  }
}
