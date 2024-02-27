import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/app_state.dart';
import 'package:hackathon/models/authentication.dart';
import 'package:hackathon/models/product_card.dart';
import 'package:hackathon/models/product_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
    // required this.products,
  });
  final ProductService _productService = ProductService();
  // final products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Discover")),
      body: SafeArea(
        child: Column(
          children: [
            Text("hello"),
            Container(
              height: 10,
              width: 10,
              color: Colors.cyan,
            ),
            Consumer<ApplicationState>(
              builder: (context, appState, _) => AuthFunc(
                  loggedIn: appState.loggedIn,
                  signOut: () {
                    FirebaseAuth.instance.signOut();
                  }),
            ),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: _productService.getProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<Map<String, dynamic>> products = snapshot.data!;
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        cropname: products[index]["cropname"],
                        price: products[index]["price"],
                      );
                    },
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
