import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vinnovatetest/data/models/productmodel.dart';
import 'package:vinnovatetest/data/repositories/productrepo.dart';
import 'package:vinnovatetest/data/service/network.dart';

final productRepositoryProvider =
    Provider((ref) => ProductRepository(apiService: ApiService()));

final productsProvider =
    FutureProvider.family<List<Product>, int>((ref, page) async {
  final repository = ref.read(productRepositoryProvider);
  return repository.fetchProducts(page);
});
