import 'package:mayomart_dashboard/Data_Classes/cart.dart';

class OrderDataClass {
  String id;
  String userID;
  List<Cart> orderProducts;
  DateTime time = DateTime.now();
  int totalPrice;
  bool isCompleted;

  OrderDataClass({
    this.id = "",
    this.isCompleted = false,
    required this.userID,
    required this.orderProducts,
    required this.totalPrice,
  });

  OrderDataClass.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        userID = json["user"],
        totalPrice = json["totalPrice"],
        time = json["time"],
        isCompleted = json["isCompleted"],
        orderProducts = (json["orderProducts"] as List)
            .map((item) => Cart.fromJson(item))
            .toList();

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "user": userID,
      "time": time,
      "isCompleted": isCompleted,
      "totalPrice": totalPrice,
    };
  }
}
