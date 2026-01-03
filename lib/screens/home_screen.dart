import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';
import '../screens/product_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final prodContr = Get.put(ProductController());
  
  // This key is used to force the entire grid to rebuild/re-animate 
  // when we call setState() upon returning from details.
  Key _gridKey = UniqueKey();

  // ignore: unused_field
  String _searchQuery = '';
  int? selectedIndex;
  final List<String> labels = ['All Coffee', 'Machiato', 'Latte', 'Americano'];

  void addToCart(product, context) {
    prodContr.addProduct(product);
    prodContr.update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFEDEDED),
      body: ListView(
        children: [
          // HEADER SECTION
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(25, 25, 20, 120),
                decoration: const BoxDecoration(color: Colors.black),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Location', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    const Text('Bilzen, Tanjungbalai', 
                      style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xFF313131),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 12),
                                  child: Icon(Icons.search, color: Colors.white),
                                ),
                                Expanded(
                                  child: TextField(
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                      hintText: 'Search coffee..',
                                      hintStyle: TextStyle(fontSize: 14, color: Color(0xFF989898)),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                    ),
                                    onChanged: (value) => setState(() => _searchQuery = value),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFC67C4E),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(IconlyLight.filter, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          // BANNER SECTION
          Transform.translate(
            offset: const Offset(0, -60),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: AssetImage('assets/Banner (3).png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          // CATEGORY SELECTOR
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: List.generate(labels.length, (index) {
                bool isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () => setState(() => selectedIndex = index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFFC67C4E) : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      labels[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : const Color(0xFF2F2D2C),
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),

          // PRODUCT GRID
          Padding(
            padding: const EdgeInsets.all(20),
            child: GetBuilder<ProductController>(
              builder: (controller) {
                return GridView.builder(
                  key: _gridKey, // Important for re-triggering animation
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 0.62, // Adjusted to fit image + text perfectly
                  ),
                  itemCount: controller.products.length,
                  itemBuilder: (ctx, index) {
                    final product = controller.products[index];

                    return TweenAnimationBuilder<double>(
                      duration: Duration(milliseconds: 400 + (index * 100)),
                      tween: Tween(begin: 0.0, end: 1.0),
                      curve: Curves.easeOutQuart,
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(0, 50 * (1 - value)),
                            child: child,
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // FIXED HEIGHT IMAGE SECTION
                            AspectRatio(
                              aspectRatio: 1.0, // This makes the image a perfect square
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => ProductDetailsScreen(product: product),
                                  duration: const Duration(milliseconds: 800), // Slows it down to 0.8 seconds
                                  curve: Curves.easeInOutQuart,)?.then((_) {
                                    // Refresh the key to trigger entrance animation again
                                    setState(() {
                                      _gridKey = UniqueKey();
                                    });
                                  });
                                },
                                child: Stack(
                                  children: [
                                    Hero(
                                      tag: 'product-image-${product.name}',
                                      createRectTween: (begin, end) {
                                      return MaterialRectCenterArcTween(begin: begin, end: end);
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          image: DecorationImage(
                                            image: AssetImage(product.imageUrl),
                                            fit: BoxFit.cover, // Forces image to fill the square
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 10,
                                      right: 12,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.5),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(IconlyBold.star, color: Color(0xFFFBBE21), size: 10),
                                            const SizedBox(width: 4),
                                            Text(
                                              '${product.rating}',
                                              style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            
                            // TEXT SECTION
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF2F2D2C)),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    product.shortDescription,
                                    style: const TextStyle(fontSize: 12, color: Color(0xFF9B9B9B)),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '\$ ${product.price}',
                                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF2F2D2C)),
                                      ),
                                      GestureDetector(
                                        onTap: () => addToCart(product, context),
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFC67C4E),
                                            borderRadius: BorderRadius.circular(10),
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
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 100), // Bottom padding for navigation bar
        ],
      ),
    );
  }
}