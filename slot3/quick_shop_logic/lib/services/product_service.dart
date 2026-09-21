import '../models/product.dart';
import '../data/data_source.dart';

class ProductService {
  /// Lấy toàn bộ sản phẩm
  List<Product> getAllProducts() {
    return rawProducts;
  }

  /// Lấy sản phẩm giá rẻ
  List<Product> getCheapProducts() {
    return rawProducts.where((product) {
      return product.price < 100;
    }).toList();
  }

  /// Lọc sản phẩm theo giá tối đa
  List<Product> filterByMaxPrice(double maxPrice) {
    return rawProducts.where((product) {
      return product.price < maxPrice;
    }).toList();
  }

  /// Xử lý khi người dùng chọn sản phẩm
  void handleAddToCart(Product product) {
    print("Đã chọn mua: ${product.name}");
    print("Giá tiền: ${product.price}\$");
  }

  /// Tính tổng tiền
  double calculateTotal(List<Product> products) {
    double total = 0;

    for (final product in products) {
      total += product.price;
    }

    return total;
  }
}
