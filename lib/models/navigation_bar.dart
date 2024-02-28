import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon/pages/home_page.dart';
import 'package:hackathon/pages/product_page.dart';

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar({super.key});

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: "Home"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: "Product",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_shopping_cart_rounded),
          label: "Cart",
        ),
      ],
      onTap: (value) {
        // context.go(widget._pages[value]);
        switch (value) {
          case 0:
            context.go('/');  //home page
            break;
          case 1:
            context.go('/product-page');
            break;
          case 2:
            context.go('/cart-page');
          default:
        }
      },
      backgroundColor: Colors.grey,
    );
  }
}
