import 'package:flutter/material.dart';
import 'package:hackathon/models/navigation_bar.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({
    super.key,
    // required this.cropname,
    // required this.description,
    // required this.farmername,
    // required this.price,
    // required this.quantity,
    // required this.whenharvested,
  });

  // final String cropname;
  // final String description;
  // final String farmername;
  // final String price;
  // final String quantity;    // in kg
  // final String whenharvested;

  final String cropname = "rice";
  final String description = "very tasty, organic";
  final String farmername = "farmer joe";
  final String price = "200";
  final String quantity = "300";
  final String whenharvested = "2024-02-14";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      child: Scaffold(
        bottomNavigationBar: MyNavigationBar(),
        appBar: AppBar(title: Text("Product"),),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 9 / 9,
                    child: Container(
                      child: const Center(
                          child: Text(
                        "image",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      )),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1C4A1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cropname,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "$farmername,",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black45,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "$whenharvested,",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black45,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "$quantity kg",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black45,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Divider(
                    thickness: 1,
                    color: Color(0xFF2D3B4A),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "\$2000",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "\$$price/kg",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          child: const Icon(Icons.remove_circle_outline)),
                      const Text(
                        "20",
                        style: TextStyle(
                            color: const Color(0xFFEA4E25), fontSize: 16),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        child: const Icon(Icons.add_circle_outline),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade700),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Add to cart"),
                        style: const ButtonStyle(
                          foregroundColor: MaterialStatePropertyAll(
                            Color(0xFFEA4E25)
                          ),
                          // backgroundColor: MaterialStatePropertyAll(Colors.white),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
