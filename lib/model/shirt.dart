class Shirt {
  Shirt({
    required this.id,
    required this.name,
    required this.intensity,
    required this.shirtType,
    required this.price,
    required this.isActive,
    required this.bestSellers,
    required this.imageAssets,
    required this.description,
    required this.rating,
  });

  final int id;
  final String name;
  final int intensity;
  final String shirtType;
  final double price;
  final bool isActive;
  final bool bestSellers;
  final String imageAssets;
  final String description;
  final double rating;
}
