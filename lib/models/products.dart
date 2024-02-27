import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hackathon/models/product_listing.dart';

class Products extends StatefulWidget {
  const Products({
    super.key,
    required this.addProduct,
    required this.product,
  });

  final FutureOr<void> Function() addProduct;
  final Map<ProductListing, dynamic> product;

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
