// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:hackathon/models/product_listing.dart';

// class Products extends StatefulWidget {
//   const Products({
//     super.key,
//     required this.addProduct,
//     required this.product,
//   });

//   final FutureOr<void> Function() addProduct;
//   final Map<ProductListing, dynamic> product;

//   @override
//   State<Products> createState() => _ProductsState();
// }

// class _ProductsState extends State<Products> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addProduct(Map<String, dynamic> product) async {
    await _firestore.collection('newcollection').add(product);
  }

  Future<List<Map<String, dynamic>>> getProducts() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _firestore.collection('newcollection').get();

    final List<Map<String, dynamic>> products = querySnapshot.docs
        .map((DocumentSnapshot<Map<String, dynamic>> doc) => doc.data())
        .where((element) => element != null)
        .cast<Map<String, dynamic>>()
        .toList();

    return products;
  }

  Future<void> deleteProduct(String productId) async {
    // await _productService.deleteProduct(productId);
    await _firestore.collection('newcollection').doc(productId).delete();
  }
}
