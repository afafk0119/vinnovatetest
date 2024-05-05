import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vinnovatetest/data/models/productmodel.dart';
import 'package:vinnovatetest/data/repositories/productrepo.dart';
import 'package:vinnovatetest/data/service/network.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vinnovatetest/data/models/productmodel.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepository();
});

final productListStateNotifierProvider =
    StateNotifierProvider<ProductListStateNotifier, ProductListState>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return ProductListStateNotifier(repository);
});

class ProductListStateNotifier extends StateNotifier<ProductListState> {
  ProductListStateNotifier(this._repository) : super(const ProductListState());

  final ProductRepository _repository;

  Future<void> fetchProducts() async {
    state = state.copyWith(isLoading: true);
    try {
      final newProducts = await _repository.fetchProducts(
        state.currentPage,
      );
      final uniqueProducts = [
        ...state.products,
        ...newProducts.where((product) => !state.products
            .any((existingProduct) => existingProduct.id == product.id))
      ];
      state = state.copyWith(
        products: uniqueProducts,
        currentPage: state.currentPage + 1,
        isLoading: false,
      );
    } catch (e) {
      print(e);
      state = state.copyWith(isLoading: false);
    }
  }
}

@immutable
class ProductListState {
  final List<Product> products;
  final int currentPage;
  final bool isLoading;

  const ProductListState({
    this.products = const [],
    this.currentPage = 1,
    this.isLoading = false,
  });

  ProductListState copyWith({
    List<Product>? products,
    int? currentPage,
    bool? isLoading,
  }) {
    return ProductListState(
      products: products ?? this.products,
      currentPage: currentPage ?? this.currentPage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
