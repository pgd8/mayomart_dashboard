import 'package:flutter/material.dart';
import 'package:mayomart_dashboard/Firebase/firebase_functions.dart';
import 'package:mayomart_dashboard/Shared_Components/product_Item.dart';

class Products extends StatelessWidget {
  Products({super.key});

  var products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
          future: getProductFromFireStore(),
          builder: (context, snapshot) {
            products =
                snapshot.data?.docs.map((product) => product.data()).toList() ??
                    [];
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) =>
                  ProductItem(product: products[index]),
            );
          }),
    );
  }
}
