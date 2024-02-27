import 'package:flutter/material.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 9 / 9,
                  child: Container(
                    child: Center(
                        child: Text(
                      "image",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    )),
                    decoration: BoxDecoration(
                      color: Color(0xFFF1C4A1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cropname,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "$farmername,",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          "$whenharvested,",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          "$quantity kg",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  thickness: 1,
                  color: Color(0xFF2D3B4A),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "\$2000",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "\$$price/kg",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: Icon(Icons.remove_circle_outline)),
                    Text(
                      "20",
                      style: TextStyle(color: Color(0xFFEA4E25), fontSize: 16),
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: Icon(Icons.add_circle_outline)),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Add to cart"),
                      style: ButtonStyle(
                        foregroundColor: MaterialStatePropertyAll(
                          Color(0xFFEA4E25),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
