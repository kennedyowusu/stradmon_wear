import 'package:stradmon_chairs/model/product.dart';

class ProductRepository {
  final List<Product> _products = [];

  List<Product> addProduct(Product product) {
    _products.add(product);
    return _products;
  }

  List<Product> removeProduct(Product product) {
    _products.remove(product);
    return _products;
  }

  List<Product> cleanListProduct() {
    _products.clear();
    return _products;
  }

  List<Product> getProducts() {
    return _products;
  }

  void updateProduct(Product updatedProduct) {
    for (var i = 0; i < _products.length; i++) {
      if (_products[i].shirt.id == updatedProduct.shirt.id &&
          _products[i].size == updatedProduct.size) {
        _products[i] = updatedProduct;
        break;
      }
    }
  }
}
