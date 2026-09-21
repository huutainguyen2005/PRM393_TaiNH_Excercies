import 'package:flutter/material.dart';

import '../models/product.dart';
import '../services/product_service.dart';

class QuickShopPage extends StatelessWidget {
  QuickShopPage({super.key});

  final ProductService _service = ProductService();

  void handleAddToCart(Product product) {
    _service.handleAddToCart(product);
  }

  @override
  Widget build(BuildContext context) {
    // Lấy danh sách sản phẩm có giá dưới 100$
    final products = _service.filterByMaxPrice(100);

    // Tính tổng tiền
    final total = _service.calculateTotal(products);

    // In tổng tiền ra Console
    print("Tổng tiền các sản phẩm đang hiển thị: $total\$");

    return Scaffold(
      appBar: AppBar(title: const Text("Quick Shop - Sản phẩm giá rẻ")),

      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: products.map((product) {
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: Image.network(
                      product.imageUrl,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.image_not_supported, size: 40);
                      },
                    ),

                    title: Text(product.name),

                    subtitle: Text("\$${product.price}"),

                    trailing: IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () {
                        handleAddToCart(product);
                      },
                    ),

                    onTap: () {
                      handleAddToCart(product);
                    },
                  ),
                );
              }).toList(),
            ),
          ),

          // Hiển thị tổng tiền
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Text(
              "Tổng tiền: \$${total.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
