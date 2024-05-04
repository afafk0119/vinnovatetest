import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vinnovatetest/data/models/productmodel.dart';

class ApiService {
  Future<List<Product>> fetchProducts(int page) async {
    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/products?limit=$page'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return responseData.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
