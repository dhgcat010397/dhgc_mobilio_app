import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhgc_mobilio_app/core/navigation/app_routes.dart';
import 'package:dhgc_mobilio_app/src/features/product/presentation/bloc/product_bloc.dart';
import 'package:dhgc_mobilio_app/src/features/product/presentation/widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool _isSearching;
  late final TextEditingController _searchController;
  late final FocusNode _searchFocusNode;

  @override
  void initState() {
    super.initState();

    _isSearching = false;
    _searchController = TextEditingController();
    _searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();

    super.dispose();
  }

  void _startSearch() {
    setState(() {
      _isSearching = true;
    });
    _searchFocusNode.requestFocus();
  }

  void _stopSearch() {
    setState(() {
      _isSearching = false;
      _searchController.clear();
      _searchFocusNode.unfocus();
    });

    context.read<ProductBloc>().add(ProductEvent.filterProductByName(""));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching ? _buildSearchField() : const Text('Home Page'),
        actions: [
          IconButton(
            icon:
                _isSearching
                    ? const Icon(Icons.clear)
                    : const Icon(Icons.search),
            onPressed: () {
              if (_isSearching) {
                _stopSearch();
              } else {
                _startSearch();
              }
            },
          ),
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('Initial State')),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (data, __) {
              final products = data;

              if (products.isEmpty) {
                return const Center(child: Text('No products found'));
              } else {
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];

                    return ProductCard(
                      onTap: () async {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.productDetail,
                          arguments: product.id,
                        );
                      },
                      name: product.name,
                      price: product.formattedPrice,
                      imageUrl: product.imageUrl,
                    );
                  },
                );
              }
            },
            error:
                (errorCode, errorMessage) =>
                    Center(child: Text('Error: $errorMessage')),
          );
        },
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      focusNode: _searchFocusNode,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: 'Filter product by name',
        filled: true,
        border: InputBorder.none,
        suffixIcon: const Icon(Icons.search),
      ),
      onTap: () {
        _startSearch();
      },
      onChanged:
          (query) => {
            context.read<ProductBloc>().add(
              ProductEvent.filterProductByName(query),
            ),
          },
    );
  }
}
