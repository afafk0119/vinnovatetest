import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vinnovatetest/provider/product.dart';

class Productlisting extends ConsumerStatefulWidget {
  const Productlisting({super.key});

  @override
  ConsumerState<Productlisting> createState() => _ProductlistingState();
}

class _ProductlistingState extends ConsumerState<Productlisting> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
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
      if (!_isLoadingMore) {
        _isLoadingMore = true;
        _currentPage++;
        ref.refresh(productsProvider(_currentPage));
        _isLoadingMore = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final productsAsyncValue = ref.watch(productsProvider(_currentPage));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fake Store'),
      ),
      body: productsAsyncValue.when(
        data: (products) {
          if (products.isEmpty) {
            return const Center(
              child: Text('No products found'),
            );
          }

          return ListView.builder(
            controller: _scrollController,
            itemCount: _isLoadingMore ? products.length + 1 : products.length,
            itemBuilder: (context, index) {
              if (index == products.length) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              final product = products[index];
              return ListTile(
                title: Text(product.title),
                subtitle: Text('\$${product.price.toString()}'),
                leading: Image.network(product.image),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
