import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../models/product.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';
import '../screens/order_page_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;


  const ProductDetailsScreen({
    required this.product,
    super.key,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  int? selectedIndex;

  // Define your unique labels in a list
  final List<String> labels = ['S', 'M', 'L'];

 final ProductController prodContr = Get.find<ProductController>();

 addToCart(product, context){
    prodContr.addProduct(product);
    prodContr.update();
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFEDEDED), //Color(0XFFE3E3E3),
      body: Stack(
        children: [
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        IconlyLight.arrowLeft2
                      ),
                    ),
                    Text(
                      'Details',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    GetBuilder<ProductController>(
                      builder: (controller) {
                        return GestureDetector(
                          onTap: () => controller.makeFavorite(widget.product),
                          child: widget.product.isFavorite 
                              ? Icon(IconlyBold.heart, color: Colors.red) 
                              : Icon(IconlyLight.heart),
                        );
                      }
                    )
                  ],
                ),
                SizedBox(height: 25),
                Hero(
                tag: 'product-image-${widget.product.name}',
                  child: Container(
                    padding: EdgeInsets.all(0),
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20), bottom: Radius.circular(20)),
                    image: DecorationImage(
                      image: AssetImage(widget.product.imageUrl),
                      fit: BoxFit.cover,
                    ),
                   ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  widget.product.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.translate(
                      offset: Offset(0, -10),
                      child: Text(
                        'Ice/Hot',
                        style: TextStyle(
                          color: Colors.black.withValues(alpha: 0.3),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(top:Radius.circular(10), bottom: Radius.circular(10)),
                            color: Color(0XFFF9F2ED),
                          ),
                          child: Icon(
                            Icons.delivery_dining_rounded,
                            color: Color(0xFFC67C4E),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(top:Radius.circular(10), bottom: Radius.circular(10)),
                            color: Color(0XFFF9F2ED),
                          ),
                          child: Icon(
                            Icons.breakfast_dining_outlined,
                            color: Color(0xFFC67C4E),
                          ),
                        ),
                         SizedBox(width: 10),
                        Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(top:Radius.circular(10), bottom: Radius.circular(10)),
                            color: Color(0XFFF9F2ED),
                          ),
                          child: Icon(
                            IconlyBold.work,
                            color: Color(0xFFC67C4E),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      IconlyBold.star,
                      color: Colors.yellow,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '${widget.product.rating}',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16
                      ),
                    ),
                    SizedBox(width: 2),
                    Text(
                      '(${widget.product.noOfraters})',
                      style: TextStyle(
                        color: Colors.black.withValues(alpha: 0.5),
                        fontSize: 12
                      ),
                    ),
                  ],
                ),  
                SizedBox(height: 13),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      border: BoxBorder.symmetric(
                        horizontal: BorderSide(
                          width: 1,
                          color: Colors.grey.withValues(alpha:0.1),
                        )
                      )
                    ),
                  ),
                ),
                 SizedBox(height: 13),
                Text(
                  'Description',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ), 
                SizedBox(height: 10),
                Text(
                  widget.product.detailedDescription,
                  style: TextStyle(
                    color: Colors.black.withValues(alpha: 0.4),
                    fontSize: 12,
                    height: 1.7,
                  ),
                ), 
                SizedBox(height: 20),
                Text(
                  'Size',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ), 
                SizedBox(height: 20),  
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:List.generate(labels.length, (index) {
                  bool isSelected = selectedIndex == index;
                
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        // Toggle logic: tap again to deselect
                        selectedIndex = (selectedIndex == index) ? null : index;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      decoration: BoxDecoration(
                        // 2. Conditional Styling
                        color: isSelected ? Color(0xFFEDD6C8).withValues(alpha: 0.5) : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: BoxBorder.all(
                          color: isSelected? Color(0xFFC67C4E) : Colors.black.withValues(alpha: 0.1),
                          width: 2,
                        ),
                      ),
                      child: Text(
                        labels[index], // 3. Access unique text via index
                        style: TextStyle(
                          color: isSelected ? Color(0xFFC67C4E)  : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17
                        ),
                      ),
                    ),
                  );
                }),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              width: double.infinity,
              padding:EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                          color: Colors.black.withValues(alpha: 0.5),
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '\$${widget.product.price}',
                        style: TextStyle(
                          color: Color(0xFFC67C4E),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      addToCart(widget.product, context);
                      Get.to(OrderPageScreen());
                    },
                    child: Container(
                      height: 60,
                      width: 250,
                      decoration: BoxDecoration(
                      color: Color(0xFFC67C4E),
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(15), bottom: Radius.circular(15)),
                      ),
                      child: Center(
                        child: Text(
                          'Buy Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}