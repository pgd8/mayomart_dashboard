class ProductDataClass {
  String id;
  String productImageLink;
  String productName;
  String productDescription;
  String productCategory;
  int productStock;
  int maxQuantity;
  int minQuantity;
  int productPrice;

  ProductDataClass(
      {this.id = "",
      required this.productImageLink,
      required this.productName,
      required this.productDescription,
      required this.productCategory,
      required this.productStock,
      required this.productPrice,
      required this.maxQuantity,
      required this.minQuantity});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "productName": productName,
      "productDescription": productDescription,
      "productStock": productStock,
      "productImageLink": productImageLink,
      "productCategory": productCategory,
      "productPrice": productPrice,
      "minQuantity": minQuantity,
      "maxQuantity": maxQuantity,
    };
  }

  ProductDataClass.fromJson(Map<String, dynamic> json)
      : this(
            id: json["id"],
            productName: json["productName"],
            productImageLink: json["productImageLink"],
            productCategory: json["productCategory"],
            productDescription: json["productDescription"],
            productStock: json["productStock"],
            minQuantity: json["minQuantity"],
            maxQuantity: json["maxQuantity"],
            productPrice: json["productPrice"]);
}
