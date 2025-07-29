import 'package:stylesphere_app/core/utils/assets.dart';

class ItemEntity {
  final String name;
  final String price;
  final String image;

  ItemEntity({required this.name, required this.price, required this.image});

  static List<ItemEntity> items = [
    ItemEntity(
      name: "Model Name",
      price: "Rs. 5000",
      image: Assets.assetsImagesModelsModel1,
    ),
    ItemEntity(
      name: "Model Name",
      price: "Rs. 5000",
      image: Assets.assetsImagesModelsModel2,
    ),
    ItemEntity(
      name: "Model Name",
      price: "Rs. 5000",
      image: Assets.assetsImagesModelsModel3,
    ),
    ItemEntity(
      name: "Model Name",
      price: "Rs. 5000",
      image: Assets.assetsImagesModelsModel4,
    ),
    ItemEntity(
      name: "Model Name",
      price: "Rs. 5000",
      image: Assets.assetsImagesModelsModel1,
    ),
  ];
}
