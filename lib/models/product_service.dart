import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addProduct(Map<String, dynamic> product) async {
    await _firestore.collection('shop').add(product);
  }

  Future<List<Map<String, dynamic>>> getProducts() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _firestore.collection('shop').get();

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

  // cart functions

  addtoCart(List cartList, List products, int index) {
    return cartList.add(products[index]);
  }

  deleteFromCart(List cartList, int index) {
    return cartList.removeAt(index);
  }
}
