import 'package:stradmon_chairs/model/shirt.dart';

class Product {
  Product({
    required this.shirt,
    required this.size,
    this.quantity = 1,
  });

  Shirt shirt;
  String size;
  int quantity;
}
