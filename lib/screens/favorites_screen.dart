import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {

  final prodContr = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    bool isEmptyFavorites = prodContr.favoritesList.isEmpty;
    return Scaffold(
      backgroundColor: Color(0XFFEDEDED),
      body: isEmptyFavorites? Center(
        child: Text(
          'No favorites yet',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,)
        ),
      ) : Padding(
            padding: const EdgeInsets.all(8.0),
            child:GetBuilder<ProductController>(
  builder: (controller) {
    return GridView.builder(
      shrinkWrap: true, // Let the GridView take only the space it needs
      physics: const NeverScrollableScrollPhysics(), // Parent ListView handles scrolling
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two items per row
        mainAxisSpacing: 15, // Vertical space between items
        crossAxisSpacing: 15, // Horizontal space between items
        childAspectRatio: 0.75, // Adjust this to make cards taller or shorter
      ),
      itemCount: prodContr.favoritesList.length,
      itemBuilder: (ctx, index) {
        final product = prodContr.favoritesList[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image placeholder
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    //final product = prodContr.products[index];
                   // Get.to(ProductDetailsScreen(
                   //   product: product
                   // ));
                  },
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(10), bottom: Radius.circular(10)),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          width: double.infinity,
                          height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(10), bottom: Radius.circular(10)),
                          image: DecorationImage(
                            image: AssetImage(product.imageUrl),
                            fit: BoxFit.fitWidth,
                            ),
                        ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 14,
                        child: Row(
                          children: [
                            Icon(
                              IconlyBold.star,
                              color: Colors.yellow,
                            ),
                            Text(
                              '${product.rating}',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(product.shortDescription, style: TextStyle(color: Colors.grey, fontSize: 12)),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$${product.price}', style: TextStyle(fontWeight: FontWeight.bold, color:Colors.black)),
                        GestureDetector(
                         // onTap: () => addToCart(product, context),
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFC67C4E),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.add, color: Colors.white, size: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  },
)
          ),
    );
  }
}