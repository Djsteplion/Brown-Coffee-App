import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../controllers/product_controller.dart';
import 'package:get/get.dart';
import '../screens/product_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final prodContr = Get.put(ProductController());

    addToCart(product, context){
    prodContr.addProduct(product);
    prodContr.update();
    }

  // ignore: unused_field
  String _searchQuery = '';

  int? selectedIndex;

  // 1. Define your unique labels in a list
  final List<String> labels = ['All Coffee', 'Machiato', 'Latte', 'Americano'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFEDEDED),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(25,25,20,120),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Location',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Bilzen, Tanjungbalai,',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                  
                   // Search bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            //, //290 on emulator
                            
                            decoration: BoxDecoration(
                              color: Color(0xFF313131),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(width: 1),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: const Icon(
                                    Icons.search, color: Color(0xFFE3E3E3)),
                                ),
                                Expanded(
                                  child: TextField(
                                    decoration: const InputDecoration(
                                      hintText: 'Search for products or devices..',
                                      hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFFE3E3E3),
                                      ),
                                      border: InputBorder.none,
                                      filled:true,
                                      fillColor: Color(0xFF313131),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        _searchQuery = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                                
                        GestureDetector(
                          onTap: () {
                           // _showSortOptions();
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.fromLTRB(5, 4, 0, 5),
                            decoration: BoxDecoration(
                              color:Color(0xFFC67C4E),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              IconlyLight.filter,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
         // Image.asset(
         //   ''
         // ),
         
          Transform.translate(
            offset: Offset(0, -70),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20,0,20,25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.all(0),
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                     image: AssetImage('assets/Banner (3).png'),
                     fit: BoxFit.fill,
                      ),
                  ),

                ),
              ),
            ),
          ),

      Column(
        children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(labels.length, (index) {
            bool isSelected = selectedIndex == index;
          
            return GestureDetector(
              onTap: () {
                setState(() {
                  // Toggle logic: tap again to deselect
                  selectedIndex = (selectedIndex == index) ? null : index;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  // 2. Conditional Styling
                  color: isSelected ? Color(0xFFC67C4E) : Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  labels[index], // 3. Access unique text via index
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            );
          }),
              ),
          
          Padding(
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
      itemCount: prodContr.products.length,
      itemBuilder: (ctx, index) {
        final product = prodContr.products[index];
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
                    final product = prodContr.products[index];
                    Get.to(ProductDetailsScreen(
                      product: product
                    ));
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
                          onTap: () => addToCart(product, context),
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
          ],
          ),
        ],
      ),
    );
  }
}