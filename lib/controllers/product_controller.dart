import 'package:get/get.dart';
// ignore: unused_import
import 'package:flutter/material.dart';
import '../models/product.dart';


class ProductController extends GetxController{

final List<Product> products = [
  Product(
    id: '1',
    name: 'Caffe Mocha',
    imageUrl: 'assets/2.png',
    price: 4.53,
    shortDescription: 'Deep Foam',
    detailedDescription:
        'A cappuccino is an aproximately 150 ml(5 oz) beverage'
        'with 25ml of espresso coffee and 85ml of fresh milk to add a creamy and satisfying taste, feeling and pleasure to it',
    rating: 4.8,
    noOfraters: 230,
    isMachiato: true,
  ),
  Product(
    id: '2',
    name: 'Flat White',
    imageUrl: 'assets/flat_white.png',
    price: 3.53,
    shortDescription: 'Espresso',
    detailedDescription:
        'A flat white is a smooth coffee made with a single or double shot of espresso and steamed milk,'
        'creating a velvety texture with a thin layer of microfoam.',
    rating: 4.6,
    noOfraters: 168,
    isLatte: true,
  ),
  Product(
    id: '3',
    name: 'Americano',
    imageUrl: 'assets/americano.png',
    price: 5.23,
    shortDescription: 'Rich & Bold',
    detailedDescription:
        'An Americano is made by diluting a shot of espresso with hot water,'
        'resulting in a strong, rich coffee similar to brewed coffee.',
    rating: 4.8,
    noOfraters: 468,
    isAmericano: true,
  ),
  Product(
    id: '4',
    name: 'Caramel Macchiato',
    imageUrl:'assets/caramel.png' ,
    price: 5.23,
    shortDescription: 'Sweet Foam',
    detailedDescription:
        'A caramel macchiato combines freshly steamed milk with espresso,'
        'finished with a drizzle of caramel for a sweet and creamy flavor.',
    rating: 4.8,
    noOfraters: 468,
    isMachiato: true,
  ),
];

List<Product> cart = <Product>[].obs;
double get totalAmount => cart.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
double get total => totalAmount + 1.0; // Adding $1.0 delivery fee

List<Product> favoritesList = [];

void addProduct(Product product){
  final existingIndex = cart.indexWhere((p) => p.id == product.id); // you can change the p to anything
      if (existingIndex >= 0) {
      cart[existingIndex].quantity++;
    } else {
    cart.add(product);
    }
}

removeProduct(Product product){
  cart.remove(product);
}

makeFavorite(Product product){
final existingIndex = favoritesList.indexWhere((p) => p.id == product.id); // you can change the p to anything
  if(existingIndex >= 0) {
    // If it exists, remove it
    favoritesList.removeAt(existingIndex);
    product.isFavorite = false;
  } else{
    // If it doesn't exist, add it
    favoritesList.add(product);
    product.isFavorite = true;
  }
  update();
}

  // Increase quantity
  void increaseQuantity(Product product) {
    final index = cart.indexWhere((p) => p.id == product.id);
    if (index >= 0) {
      cart[index].quantity++;
      update();
    }
  }

  // Decrease quantity
  void decreaseQuantity(Product product) {
    final index = cart.indexWhere((p) => p.id == product.id);
    if (index >= 0 && cart[index].quantity > 1) {
      cart[index].quantity--;
      update();
    }
  }


}