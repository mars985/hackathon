import 'package:cloud_firestore/cloud_firestore.dart';

class ProductListing {
  ProductListing({
    required this.cropname,
    required this.description,
    required this.farmername,
    required this.price,
    required this.quantity,
    required this.whenharvested,
  });

  final String cropname;
  final String description;
  final String farmername;
  final String price;
  final String quantity;
  final String whenharvested;
}
