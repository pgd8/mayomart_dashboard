import 'package:mayomart_dashboard/Data_Classes/product_data_class.dart';

class Cart {
  ProductDataClass product;
  int quantity;

  Cart({required this.product, required this.quantity});

  Cart.fromJson(Map<String, dynamic> json)
      : this(product: ProductDataClass.fromJson(json["product"]),
            quantity: json["quantity"]);

  Map<String, dynamic> toJson() {
    return {
      "product": product,
      "quantity": quantity,
    };
  }
}
