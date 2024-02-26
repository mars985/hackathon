// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hackathon/models/product_card.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        // ignore: prefer_const_constructors
        body: Column(
          children: [
            Center(
              child: Container(
                height: 350,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_shopping_cart_rounded,
                      size: 144,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ), // Main icon
                    Padding(padding: EdgeInsets.all(25)),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.tertiary,
                        fixedSize: Size(335, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20), // Adjust the radius as needed
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Sell your vegetables here🫑🥔",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    //Title
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ProductCard(),
          ],
        ));
  }
}
