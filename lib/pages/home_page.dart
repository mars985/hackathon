import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/app_state.dart';
import 'package:hackathon/models/authentication.dart';
import 'package:hackathon/models/navigation_bar.dart';
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
      bottomNavigationBar: MyNavigationBar(),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Discover"),
            Consumer<ApplicationState>(
              builder: (context, appState, _) => AuthFunc(
                  loggedIn: appState.loggedIn,
                  signOut: () {
                    FirebaseAuth.instance.signOut();
                  }),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: _productService.getProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<Map<String, dynamic>> products = snapshot.data!;
              return Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: products.length,
                  // itemCount: 2,
                  itemBuilder: (context, index) {
                    // return ProductCard(
                    //   cropname: products[index]["cropname"],
                    //   price: products[index]["price"],
                    // );
                    return AspectRatio(
                      aspectRatio: 1/3,
                      child: Container(
                        child: Column(
                          children: [
                            Text("name", style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    );
                  },
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
