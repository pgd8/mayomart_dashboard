import 'package:flutter/material.dart';
import 'package:mayomart_dashboard/Data_Classes/product_data_class.dart';
import 'package:mayomart_dashboard/Screens/poduct_details_screen.dart';

class ProductItem extends StatelessWidget {
  ProductDataClass product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child: ListTile(
        title: Text(product.productName),
        subtitle: Text(product.productDescription),
        trailing: Image.network(product.productImageLink),
        onTap: () {
          Navigator.pushNamed(context, ProductDetailScreen.routeName,
              arguments: product);
        },
      ),
    );
  }
}
