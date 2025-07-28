import 'package:flutter/material.dart';
import 'package:stylesphere_app/core/utils/assets.dart';
import 'package:stylesphere_app/features/home/presentation/views/widgets/filter_and_sort.dart';

class ModelDetailsBody extends StatelessWidget {
  const ModelDetailsBody({super.key});

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
                    Assets.assetsImagesModelsModel1,
                    fit: BoxFit.fitHeight,
                    width: double.infinity,
                  ),
                ),
              ),
            ],
          ),
        ),

        DraggableScrollableSheet(
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
                children: const [
                  Center(
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
                  SizedBox(height: 12),
                  Text(
                    "Model Name",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "£99.99",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "This is a stylish and comfortable model made from high-quality materials. Available in multiple sizes.",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    "Model Name",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "£99.99",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "This is a stylish and comfortable model made from high-quality materials. Available in multiple sizes.",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    "Model Name",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "£99.99",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "This is a stylish and comfortable model made from high-quality materials. Available in multiple sizes.",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    "Model Name",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "£99.99",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "This is a stylish and comfortable model made from high-quality materials. Available in multiple sizes.",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    "Model Name",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "£99.99",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "This is a stylish and comfortable model made from high-quality materials. Available in multiple sizes.",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: null, // Add your logic here
                    child: Text("Add to Cart"),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
