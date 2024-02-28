// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.cropname,
    required this.price,
  });

  final String cropname;
  final String price;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 16,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          // color: Theme.of(context).colorScheme.primary,
          // color: Color(0xFF2F3C4D),
          color: Colors.white,
        ),
        child: Column(children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Theme.of(context).colorScheme.inversePrimary,
                // color: Color(0xFF2F3C4D),
              ),
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.background,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(0),
                      fixedSize: Size(50, 50),
                    ),
                    child: Icon(
                      Icons.favorite,
                      size: 30,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(5)),
          Text(
            cropname,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "\$$price",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(padding: EdgeInsets.all(7)),
          Container(
            height: 30,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Theme.of(context).colorScheme.background,
            ),
            child: Center(
              child: Text(
                "Wood Elements +3",
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  color: const Color.fromARGB(255, 137, 134, 134),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
