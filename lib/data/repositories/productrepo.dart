import 'package:flutter/foundation.dart';
import 'package:vinnovatetest/data/models/productmodel.dart';
import 'package:vinnovatetest/data/service/network.dart';

class ProductRepository {
  final ApiService apiService;

  ProductRepository({required this.apiService});

  Future<List<Product>> fetchProducts(int page) async {
    try {
      final products = await apiService.fetchProducts(page);
      return products;
    } catch (e) {
      debugPrint('Error fetching products: $e');
      rethrow;
    }
  }
}
