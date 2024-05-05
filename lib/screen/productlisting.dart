import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:vinnovatetest/data/models/productmodel.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  int _currentPage = 1;
  List<Product> _products = [];
  bool _isLoading = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchProducts();
    _scrollController.addListener(_loadMoreProducts);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMoreProducts() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _fetchProducts();
    }
  }

  Future<void> _fetchProducts() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final response = await http.get(Uri.parse(
          'https://fakestoreapi.com/products?limit=${10 + _currentPage}'));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        setState(() {
          _products.clear(); // Clear the existing list
          _products.addAll(responseData.map((json) => Product.fromJson(json)));
          _currentPage++;
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: _products.length + (_isLoading ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == _products.length && _isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (index < _products.length) {
            final product = _products[index];
            return ListTile(
              leading: Image.network(product.image),
              title: Text(product.title),
              subtitle: Text(product.price.toString()),
            );
          } else {
            return SizedBox.shrink(); // Return an empty widget
          }
        },
        controller: _scrollController,
      ),
    );
  }
}
