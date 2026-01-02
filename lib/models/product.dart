class Product{
  String id;
  String name;
  String imageUrl;
  double price;
  String shortDescription;
  String detailedDescription;
  double rating;
  int quantity;
  int noOfraters;
  bool isFavorite;
  bool isMachiato;
  bool isLatte;
  bool isAmericano;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.shortDescription,
    required this.detailedDescription,
    required this.rating,
    required this.noOfraters,
    this.quantity = 1,
    this.isFavorite = false,
    this.isMachiato = false,
    this.isLatte = false,
    this.isAmericano = false,
  });

}